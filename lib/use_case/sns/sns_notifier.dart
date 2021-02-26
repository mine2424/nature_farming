import 'dart:io';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_farming/common/constants/constants.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/models/post/replyMessage.dart';
import 'package:nature_farming/models/user/index.dart';
import 'package:nature_farming/models/user/user.dart' as users;
import 'package:nature_farming/repository/index.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:share/share.dart';
import 'package:state_notifier/state_notifier.dart';

class SnsNotifier extends StateNotifier<SnsState> with LocatorMixin {
  SnsNotifier({@required this.isFetchReplyMessage, this.postDocId})
      : super(const SnsState(isLoading: false));

  DocumentAccessor documentAccessor = DocumentAccessor();
  CollectionPagingListener<Post> collectionPagingListener;

  final user = users.User(id: loggedInUserId());
  final batch = Batch();
  final storage = Storage();
  final bool isFetchReplyMessage;
  final String postDocId;

  @override
  void initState() {
    super.initState();
    if (state.postItems == null) {
      fetch();
    }
    if (isFetchReplyMessage) {
      fetchReplyMessage(postDocId);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startLoading() => state = state.copyWith(isLoading: true);

  void _finishLoading() => state = state.copyWith(isLoading: false);

  void _startLoadingReply() => state = state.copyWith(isLoadingReply: true);

  void _finishLoadingReply() => state = state.copyWith(isLoadingReply: false);

  Future<void> pushWithReload({BuildContext context, Widget page}) async {
    /// NOTE: disposeのbat connectはnotifierにnavigatorを移動すれば解決。
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) => page, fullscreenDialog: true),
    );
  }

  void saveContent(String content) => state = state.copyWith(content: content);

  Future savePostImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    state = state.copyWith(image: File(pickedFile.path));
  }

  Future<void> countUpGood(int goods, String docId) async {
    final doc = Post(id: docId)..good = goods + 1;
    await documentAccessor.update(doc);
  }

  Future<void> countUpReplyGood({
    int goods,
    String postDocId,
    String replyDocId,
  }) async {
    final doc = Post(id: postDocId);
    final replyDoc = ReplyMessage(
      id: replyDocId,
      collectionRef: doc.replyMessage.ref,
    )..good = goods + 1;
    // TODO(mine2424): create isPressedgood procession
    // state = state.copyWith(good: true);
    await documentAccessor.update(replyDoc);
  }

  Future snsShare({String name, String content}) async {
    await Share.share(content, subject: name);
  }

  void fetch() {
    _startLoading();
    print('start fetch');
    final path = Document.path<Post>();
    firestoreInstance
        .collection(path)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      final items = snapshot.docs.map((item) => Post(snapshot: item)).toList();
      state = state.copyWith(postItems: items);
      _finishLoading();
    });
  }

  Future<void> fetchReplyMessage(String postDocId) async {
    _startLoadingReply();
    final postDoc = Post(id: postDocId);
    final replyPath = Document.path<ReplyMessage>(
        collectionPath: postDoc.replyMessage.ref.path);
    firestoreInstance.collection(replyPath).snapshots().listen((snapshot) {
      final list =
          snapshot.docs.map((item) => ReplyMessage(snapshot: item)).toList();
      state = state.copyWith(replyMessages: list);
      _finishLoadingReply();
    });
  }

  Future<void> addPost() async {
    final userInfo = await documentAccessor.load<User>(user);
    final doc = Post()
      ..name = userInfo.name
      ..content = state.content
      ..good = 0
      ..userId = userInfo.id;

    if (state.image != null) {
      await storage.saveWithDoc(doc.reference, 'postImage', state.image);
    }
    if (userInfo.userImage?.url != null) {
      batch
        ..save(doc)
        ..update(Post(id: doc.id)..userImage = userInfo.userImage.url);
    } else {
      batch
        ..save(doc)
        ..update(Post(id: doc.id)..userImage = Constants.appImage);
    }
    await batch.commit();
  }

  Future<void> addReply(String docId) async {
    final userInfo = await documentAccessor.load<User>(user);
    final postDoc = Post(id: docId);
    final replyDoc = ReplyMessage(collectionRef: postDoc.replyMessage.ref)
      ..name = userInfo.name
      ..content = state.content
      ..good = 0
      ..userId = userInfo.id
      ..fmcToken = userInfo.fmcToken;

    if (state.image != null) {
      await storage.saveWithDoc(replyDoc.reference, 'postImage', state.image);
    }
    batch.save(replyDoc);
    if (userInfo.userImage?.url != null) {
      batch.update(
          ReplyMessage(id: replyDoc.id, collectionRef: postDoc.replyMessage.ref)
            ..userImage = userInfo.userImage.url);
    } else {
      batch
        ..save(replyDoc)
        ..update(Post(id: replyDoc.id)
          ..userImage =
              'https://firebasestorage.googleapis.com/v0/b/nature-farming-c8b9d.appspot.com/o/user%2F%E8%BE%B2%E6%A5%AD%E6%9D%91%20(1).png?alt=media&token=35dd13e1-39ec-4239-822d-d2e9898d4fa0');
    }
    await batch.commit();
  }

  Future<void> deletePost(String uid) async {
    final doc = Post(id: uid);
    await documentAccessor.delete(doc);
  }

  Future<void> deleteReplyMessage({String postDocId, String replyDocId}) async {
    final postDoc = Post(id: postDocId);
    final replyDoc = ReplyMessage(
      id: replyDocId,
      collectionRef: postDoc.replyMessage.ref,
    );
    await documentAccessor.delete(replyDoc);
  }
}

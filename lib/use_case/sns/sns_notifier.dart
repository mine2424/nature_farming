import 'dart:io';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/models/user/index.dart';
import 'package:nature_farming/models/user/user.dart' as users;
import 'package:nature_farming/repository/index.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:state_notifier/state_notifier.dart';

class SnsNotifier extends StateNotifier<SnsState> with LocatorMixin {
  SnsNotifier() : super(const SnsState(isLoading: false));

  DocumentAccessor documentAccessor = DocumentAccessor();
  CollectionPagingListener<Post> collectionPagingListener;

  final user = users.User(id: loggedInUserId());
  final batch = Batch();
  final storage = Storage();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startLoading() => state = state.copyWith(isLoading: true);

  void _finishLoading() => state = state.copyWith(isLoading: false);

  Future<void> pushWithReload({BuildContext context, Widget page}) async {
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (BuildContext context) => page, fullscreenDialog: true),
    );
  }

  void saveContent(String content) => state = state.copyWith(content: content);

  void savePostImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    state = state.copyWith(image: File(pickedFile.path));
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

  Future<void> addPost() async {
    final userInfo = await documentAccessor.load<User>(user);
    final doc = Post()
      ..name = userInfo.name
      ..content = state.content
      ..good = 0
      ..userId = userInfo.userId;
    if (state.image != null) {
      await storage.saveWithDoc(
        doc.reference,
        'postImage',
        state.image,
      );
    }
    batch.save(doc);
    await batch.commit();
  }

  Future<void> deletePost(String uid) async {
    final doc = Post(id: uid);
    await documentAccessor.delete(doc);
  }

  Future<void> replyComment() {}
}

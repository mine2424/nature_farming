import 'dart:io';

import 'package:flamingo/flamingo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_farming/models/post/post.dart';
import 'package:nature_farming/models/user/user.dart' as users;
import 'package:nature_farming/repository/index.dart';
import 'package:nature_farming/use_case/sns/sns_state.dart';
import 'package:state_notifier/state_notifier.dart';

class SnsNotifier extends StateNotifier<SnsState> with LocatorMixin {
  SnsNotifier() : super(const SnsState(isLoading: false));

  DocumentAccessor documentAccessor = DocumentAccessor();

  @override
  void dispose() {
    super.dispose();
  }

  void saveContent(String content) => state = state.copyWith(content: content);
  void savePostImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    state = state.copyWith(postImage: pickedFile.path);
    state = state.copyWith(image: File(pickedFile.path));
  }

  Future<void> addPost() async {
    final user = users.User();
    final batch = Batch();
    final storage = Storage();
    final doc = Post()
      ..name = user.name
      ..content = state.content
      ..good = 0
      ..userId = user.userId;
    batch.save(doc);
    await batch.commit();
    // await storage.saveWithDoc(
    //   doc.reference,
    //   user,
    //   state.image,
    // );
  }

  Future<void> replyComment() {}
}

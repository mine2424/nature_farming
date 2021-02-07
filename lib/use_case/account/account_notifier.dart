import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_farming/common/type/types.dart';
import 'package:nature_farming/repository/index.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:nature_farming/views/home/home_page.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../models/user/index.dart' as user;

class AccountNotifier extends StateNotifier<AccountState> with LocatorMixin {
  AccountNotifier({GlobalKey<FormState> formkey, this.context})
      : super(AccountState(isLoading: false));

  final formkey = GlobalKey<FormState>();
  final storage = Storage();
  final userDoc = user.User(id: loggedInUserId());

  DocumentAccessor documentAccessor = DocumentAccessor();

  // AuthDataSource _authDataSource;
  // AuthRepository get _authRepository => read<AuthRepository>();

  final batch = Batch();
  BuildContext context;

  @override
  void initState() {
    isFetchUserInfo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future isFetchUserInfo() async {
    if (await startUp() == StartUpType.loggedInUser) {
      await fetchUserInfo();
    }
  }

  void _finishLoading() {
    state = state.copyWith(isLoading: false);
  }

  void saveMessagingToken(String token) => state = state.copyWith(token: token);

  Future<StartUpType> startUp() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    print('this acount is $currentUser');
    if (currentUser != null) {
      print('logged in !');
      await fetchUserInfo();
      return StartUpType.loggedInUser;
    } else {
      return StartUpType.incompleteUser;
    }
  }

  String loggedInUserUid() {
    final userId = loggedInUserId();
    return userId;
  }

  Future<void> logout() async {
    return signOut();
  }

  void saveContent(String value) => state = state.copyWith(content: value);

  void saveName(String value) {
    state = state.copyWith(name: value);
    print('this name is ${state.name}');
  }

  void saveProfileImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    state = state.copyWith(image: File(pickedFile.path));
  }

  Future<void> pushReplacementHomePage() async {
    await Navigator.of(context).pushReplacement<MaterialPageRoute, void>(
      MaterialPageRoute(
        builder: (_) => HomePage.wrapped(),
      ),
    );
  }

  Future<void> createUser() async {
    await signInWithAnonymously();
    final userId = loggedInUserUid();
    print('IN createUser id is $userId');
    final userData = user.User(id: userId)
      ..name = state.name
      ..content = state.content
      ..fmcToken = state.token;
    if (state.image != null) {
      await storage.saveWithDoc(userData.reference, 'userImage', state.image);
      batch.save(userData);
    } else {
      final addData = user.User(id: userId)
        ..userImage.url =
            'https://firebasestorage.googleapis.com/v0/b/nature-farming-c8b9d.appspot.com/o/user%2F%E8%BE%B2%E6%A5%AD%E6%9D%91%20(1).png?alt=media&token=35dd13e1-39ec-4239-822d-d2e9898d4fa0';
      batch..save(userData)..save(addData);
    }
    await batch.commit();
    await pushReplacementHomePage();
    await fetchUserInfo();
  }

  Future<void> updateUser() async {
    final userData = user.User(id: loggedInUserUid())
      ..name = state.name
      ..content = state.content;
    if (state.image != null) {
      await storage.saveWithDoc(userData.reference, 'userImage', state.image);
    }
    batch.update(userData);
    await batch.commit();
    await fetchUserInfo();
  }

  Future fetchUserInfo() async {
    state = state.copyWith(isLoading: true);
    final loadUser = await documentAccessor.load<user.User>(userDoc);
    state = state.copyWith(userInfo: loadUser);
    _finishLoading();
  }
}

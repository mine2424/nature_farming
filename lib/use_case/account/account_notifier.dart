import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/common/type/types.dart';
import 'package:nature_farming/repository/index.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../models/user/index.dart' as user;

class AccountNotifier extends StateNotifier<AccountState> with LocatorMixin {
  AccountNotifier({GlobalKey<FormState> formkey})
      : super(const AccountState(isLoading: false));

  final formkey = GlobalKey<FormState>();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // AuthDataSource _authDataSource;
  AuthRepository get _authRepository => read<AuthRepository>();

  void _finishLoading() {
    state = state.copyWith(isLoading: false);
  }

  void saveMessagingToken(String token) => state = state.copyWith(token: token);

  Future<StartUpType> startUp() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    print('this acount is $currentUser');
    if (currentUser != null) {
      print('logged in !');
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

  Future<void> createUser() async {
    await signInWithAnonymously();
    final userId = loggedInUserUid();
    print('IN createUser id is $userId');
    final batch = Batch();
    final userData = user.User(id: userId)
      ..name = state.name
      ..content = state.content
      ..fmcToken = state.token;

    batch.save(userData);
    await batch.commit();
  }
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/repository/auth_repository.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../models/user/index.dart' as user;

class AccountNotifier extends StateNotifier<AccountState> with LocatorMixin {
  AccountNotifier({@required this.context})
      : super(const AccountState(isLoading: false));

  final BuildContext context;
  // AuthRepository _authRepository;

  FirebaseMessaging _firebaseMessaging;
  AuthRepository get _authRepository => read<AuthRepository>();

  @override
  void initState() {
    super.initState();
  }

  void _finishLoading() {
    state = state.copyWith(isLoading: false);
  }

  Future<bool> startUp() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print('logged in !');
      return true;
    }
    return false;
  }

  Future<String> loggedInUserId() async {
    final userId = _authRepository.loggedInUserId();
    return userId;
  }

  Future<void> logout() async {
    return _authRepository.signOut();
  }

  void saveContent(String value) => state = state.copyWith(content: value);
  void saveName(String value) => state = state.copyWith(name: value);

  Future<void> createUser() async {
    await _authRepository.signInWithAnonymously();
    final userId = _authRepository.loggedInUserId();
    final batch = Batch();
    final userData = user.User(id: userId)
      ..name = state.name
      ..content = state.content
      ..fmcToken = _firebaseMessaging.getToken();

    batch.save(userData);
    await batch.commit();
  }
}

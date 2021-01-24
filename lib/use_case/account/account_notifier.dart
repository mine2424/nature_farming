import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nature_farming/repository/auth_repository.dart';
import 'package:nature_farming/use_case/account/account_state.dart';
import 'package:state_notifier/state_notifier.dart';

class AccountNotifier extends StateNotifier<AccountState> with LocatorMixin {
  AccountNotifier({@required this.context})
      : super(const AccountState(isLoading: false));

  final BuildContext context;
  AuthRepository _authRepository;

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
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import '../repository/index.dart';

abstract class AuthRepository {
  User authUser();
  String loggedInUserId();
  Future<UserCredential> signInWithAnonymously();
  Future<void> userDelete(User user);
  Future<void> signOut();
}

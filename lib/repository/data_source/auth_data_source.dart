import 'package:firebase_auth/firebase_auth.dart';
import '../index.dart';

class AuthDataSource implements AuthRepository {
  AuthDataSource({FirebaseAuth auth}) {
    _auth = (auth != null) ? auth : FirebaseAuth.instance;
  }

  FirebaseAuth _auth;

  @override
  User authUser() => _auth.currentUser;

  @override
  String loggedInUserId() {
    final user = _auth.currentUser;
    return user?.uid;
  }

  @override
  Future<UserCredential> signInWithAnonymously() => _auth.signInAnonymously();

  @override
  Future<void> userDelete(User user) async {
    print('user delete ${user.uid}');
    await user.delete();
  }

  @override
  Future<void> signOut() async {
    return _auth.signOut();
  }
}
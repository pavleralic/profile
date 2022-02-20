import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  Future<UserCredential> login(
      {required String email, required String password}) async {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Stream<User?> authStateChanges() {
    return auth.authStateChanges();
  }

  Future<User?> signOut() async {
    await auth.signOut();
    return null;
  }
}

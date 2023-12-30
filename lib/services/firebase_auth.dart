import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  static final _auth = FirebaseAuth.instance;
  static Future createFirebaseUser(email, password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final res = await user.user.getIdToken();
    return res.token;
  }

  static Future authenticateFireBaseUser(email, password) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final res = await user.user.getIdToken();
    return res.token;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthenticationService {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future handleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      final res = await user.getIdToken();

      print('signInWithGoogle succeeded: ${user.email}');
      return {
        'email': user.email,
        'name': user.displayName,
        'token': res.token
      };
    } catch (error) {
      print(error);
      throw Error();
    }
  }
}

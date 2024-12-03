import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebaseservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential?> signin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> siginOut() async {
    await _auth.signOut();
  }

  Future<UserCredential?> signup(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<dynamic> signinwithgoogle() async {
    try {
      GoogleSignInAccount? user = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? auth = await user?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: auth?.accessToken, idToken: auth?.idToken);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomAuth {

//final _auth = FirebaseAuth.instance;

     Future<User?> login(String email, String password) async {
      try {
          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          return userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Fluttertoast.showToast(msg:'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            Fluttertoast.showToast(msg:'Wrong password provided for that user.');
          }
        } catch (e) {
          Fluttertoast.showToast(msg:'$e');
        }
        return null;

  }


     Future<void> signUp(String email, String password) async {
      try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );

        } on FirebaseAuthException catch (e) {
           if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg:'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg:'The account already exists for that email.');
        } 
      }catch(e) {
        Fluttertoast.showToast(msg:'$e');
      }

  }

  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }


}
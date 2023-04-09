import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:google_sign_in_web/google_sign_in_web.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';


class AuthService {

  // Google Sign in
  signInWithGoogle() async {

    // Begin interactive Sign-in Process
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/photoslibrary.readonly',
    ]);


    final GoogleSignInAccount? gUser = await googleSignIn.signIn();

    // Obtain Auth Details From the request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create New Credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );


    // Finally , Sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign In
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      // Begin interactive sign-in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // User cancelled the sign-in process
        return null;
      }

      // Obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create a new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Show CircularProgressIndicator while signing in
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      // Sign in with the credential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Hide the CircularProgressIndicator
      Navigator.pop(context);

      return userCredential;
    } catch (error) {
      // Handle sign-in error
      print('Sign in with Google failed: $error');
      return null;
    }
  }
}

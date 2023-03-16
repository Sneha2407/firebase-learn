import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../welcome.dart';

class AuthService {
  signInWithGoogle() async {
    //begin with interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithFacebook() async {
    //begin with interactive sign in process
    final LoginResult fUser =
        await FacebookAuth.instance.login(permissions: ['email', 'public_profile','openid']).then((value) {
          FacebookAuth.instance.getUserData();
         FacebookAuth.instance.accessToken;
          return value;
        });

    //obtain auth details from request
    // final FacebookAccessToken fAuth = fUser!.accessToken;
    final OAuthCredential fAuth = FacebookAuthProvider.credential(fUser.accessToken!.token);

    // //create a new credential for user
    // final credential = FacebookAuthProvider.credential(fAuth.token as String);

    // // //finally lets sign in
    // return await FirebaseAuth.instance.signInWithCredential(credential);

    return await FirebaseAuth.instance.signInWithCredential(fAuth);
  }

  
}

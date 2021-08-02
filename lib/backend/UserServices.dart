import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

import 'package:pitch_app/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GlobalVariables/globals_variable.dart' as globals;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Userservices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var facebookLogin = FacebookLogin();

  SharedPreferences sharedUserData;
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;

    // userid = _prefs.get(user.uid).toString();

    if (user != null) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = auth.currentUser;
      assert(user.uid == currentUser.uid);
      globals.userid = user.uid;
      _prefs.setString("currentUserId", user.uid);
      print("+++++++++++++++++++++++++${globals.userid}");
      _prefs.setString("name", user.displayName);
      print(user.displayName);

      Get.to(LoginScreen());

      return user;
    }

    return null;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final FacebookLoginResult result = await facebookLogin.logIn(["email"]);
    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Future<void> fbLoginAndSaveData(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await signInWithFacebook().then((value) async {
      globals.userid = value.user.uid;
      print("+++++++++++++++++++++++++${globals.userid}");

      _prefs.setString("uid", globals.userid);
      print(globals.userid);
    }).catchError((err) {
      print("Facebook Sign In Error => $err");
    });
  }

  void initiateFacebookLogin(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    facebookLogin = FacebookLogin();
    _prefs = await SharedPreferences.getInstance();
    await signInWithFacebook().then((value) async {
      globals.userid = value.user.uid;
      globals.name = value.user.displayName;
      globals.email = value.user.email;
      print("+++++++++++++++++++++++++${globals.userid}");

      _prefs.setString("uid", globals.userid);
      print(globals.userid);
    }).catchError((err) {
      print("Facebook Sign In Error => $err");
    });

    final FacebookLoginResult result = await facebookLogin.logIn(["email"]);

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Error => ${result.errorMessage.toString()}");
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("Cancel");
        break;

      case FacebookLoginStatus.loggedIn:
        print("logggggggggggggggggggin successfully");
        Get.to(LoginScreen());
    }
  }

  void appleSignIn(BuildContext context) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    try {
      final appleResult = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);

      final AuthCredential credential = OAuthProvider('apple.com').credential(
        accessToken: appleResult.authorizationCode,
        idToken: appleResult.identityToken,
      );

      print(credential);

      UserCredential firebaseResult =
          await auth.signInWithCredential(credential);
      User user = firebaseResult.user;
      globals.userid = user.uid;
      print("IOS${globals.userid}");
      if (user != null) {
        sharedPrefs.setString("uid", globals.userid);
        Get.to(LoginScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}

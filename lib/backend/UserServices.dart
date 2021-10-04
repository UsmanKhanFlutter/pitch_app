import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

import 'package:pitch_app/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GlobalVariables/globals_variable.dart' as globals;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

class Userservices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  // var facebookLogin = FacebookLogin();

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

    // userid = _prefs.get(user.userid).toString();

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
      _prefs.setString("image", user.photoURL);
      _prefs.setString("email", user.email);
      print(user.displayName);

      Get.to(LoginScreen());

      return user;
    }

    return null;
  }

  var facebookLogin = FacebookLogin();
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    // Create a credential from the access token
    final FacebookLoginResult result = await facebookLogin.logIn();
    if (result.status == FacebookLoginStatus.success) {
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken.token);
      return await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
    }
  }

  // Future<void> fbLoginAndSaveData(BuildContext context) async {
  //   sharedUserData = await SharedPreferences.getInstance();
  //   await signInWithFacebook().then((value) async {
  //     globals.userid = value.user.uid;
  //     print("+++++++++++++++++++++++++${globals.userid}");

  //     sharedUserData.setString("userid", globals.userid);
  //     print(globals.userid);
  //   }).catchError((err) {
  //     print("Facebook Sign In Error => $err");
  //   });
  // }

  void initiateFacebookLogin(BuildContext context) async {
    sharedUserData = await SharedPreferences.getInstance();
    facebookLogin = FacebookLogin();
    final FacebookLoginResult result = await facebookLogin.logIn();

    sharedUserData = await SharedPreferences.getInstance();
    await signInWithFacebook().then((value) async {
      globals.userid = value.user.uid;
      print("+++++++++++++++++++++++++${globals.userid}");

      print(globals.userid);
    }).catchError((err) {
      print("Facebook Sign In Error => $err");
    });

    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Error => ${result.error.toString()}");
        break;

      case FacebookLoginStatus.cancel:
        print("Cancel");
        break;

      case FacebookLoginStatus.success:
        print("logggggggggggggggggggin");
        String _url =
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${result.accessToken.token}';
        var graphResponse = await http.get(Uri.parse(_url));

        var profile = json.decode(graphResponse.body);
        print(profile["name"]);
        print(profile["id"]);
        print(profile["picture"]["data"]["url"]);

        print(profile.toString());
        print("logggggggggggggggggggin successfully");
        sharedUserData.setString("currentUserId", profile["id"]);
        sharedUserData.setString("name", profile["name"]);
        sharedUserData.setString("image", profile["picture"]["data"]["url"]);
        sharedUserData.setString("email", profile["email"]);
        Get.to(LoginScreen());

        break;

      default:
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final FacebookLoginResult result = await facebookLogin.logIn(["email"]);
  //   // Create a credential from the access token
  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.accessToken.token);

  //   return await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);
  // }

  // Future<void> fbLoginAndSaveData(BuildContext context) async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   await signInWithFacebook().then((value) async {
  //     globals.userid = value.user.userid;
  //     print("+++++++++++++++++++++++++${globals.userid}");
  //     print(value.user.userid);

  //     _prefs.setString("currentUserId", globals.userid);
  //     print(globals.userid);
  //   }).catchError((err) {
  //     print("Facebook Sign In Error => $err");
  //   });
  // }

  // void initiateFacebookLogin(BuildContext context) async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   facebookLogin = FacebookLogin();
  //   _prefs = await SharedPreferences.getInstance();
  //   await signInWithFacebook().then((value) async {
  //     globals.userid = value.user.userid;
  //     globals.name = value.user.displayName;
  //     globals.email = value.user.email;
  //     print("+++++++++++++++++++++++++${globals.userid}");

  //     _prefs.setString("currentUserId", globals.userid);
  //     print(globals.userid);
  //   }).catchError((err) {
  //     print("Facebook Sign In Error => $err");
  //   });

  //   final FacebookLoginResult result = await facebookLogin.logIn(["email"]);

  //   switch (result.status) {
  //     case FacebookLoginStatus.error:
  //       print("Error => ${result.errorMessage.toString()}");
  //       break;

  //     case FacebookLoginStatus.cancelledByUser:
  //       print("Cancel");
  //       break;

  //     case FacebookLoginStatus.loggedIn:
  //       print("logggggggggggggggggggin successfully");
  //       Get.to(LoginScreen());
  //   }
  // }

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
        sharedPrefs.setString("currentUserId", globals.userid);
        Get.to(LoginScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}

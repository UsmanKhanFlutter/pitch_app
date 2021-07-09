import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

import 'package:pitch_app/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String emailimage;
String idofuser;

String userid;

String imageurl;
String email;
String name;

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

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // userid = _prefs.get(user.uid).toString();

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');
      print(user.uid);
      _prefs.setString("uid", userid);

      idofuser = _prefs.getString("uid");
      print(idofuser + "iiiiiiiiiiiiiiddddddddddddddddddddddddd");
      print(userid + "aaaaaaaaaaaaaaaa");
      _prefs.setString("image", user.photoURL);
      imageurl = user.photoURL;
      emailimage = _prefs.getString("image");

      print(imageurl + "mmmmmmmmmmmmmmmmmmmm");
      print(emailimage +
          "emaaaaaaaaaaaaaaaaaaaaaaiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
      _prefs.setString("email", user.email);
      email = user.email;
      print(email + "eeeeeeeeeeee");
      _prefs.setString("name", user.displayName);
      name = user.displayName;
      print(name + "nnnnnnnnnnn");
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
      userid = value.user.uid;
      print("+++++++++++++++++++++++++$userid");

      _prefs.setString("uid", userid);
      print(userid);
    }).catchError((err) {
      print("Facebook Sign In Error => $err");
    });
  }

  void initiateFacebookLogin(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    facebookLogin = FacebookLogin();
    _prefs = await SharedPreferences.getInstance();
    await signInWithFacebook().then((value) async {
      userid = value.user.uid;
      name = value.user.displayName;
      email = value.user.email;
      print("+++++++++++++++++++++++++$userid");

      _prefs.setString("uid", userid);
      print(userid);
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
}

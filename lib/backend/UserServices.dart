import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:pitch_app/screens/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userid;
String imageurl;
String email;
String name;

class Userservices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

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
      _prefs.setString("uid", user.uid);
      userid = user.uid;
      print(userid + "aaaaaaaaaaaaaaaa");
      _prefs.setString("image", user.photoURL);
      imageurl = user.photoURL;
      print(imageurl + "mmmmmmmmmmmmmmmmmmmm");
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
}

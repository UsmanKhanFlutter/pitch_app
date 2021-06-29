import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_login.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/profile_image.dart';
import 'package:pitch_app/widgets/stretched_icon_button.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInMethodScreen extends StatefulWidget {
  @override
  _SignInMethodScreenState createState() => _SignInMethodScreenState();
}

class _SignInMethodScreenState extends State<SignInMethodScreen> {
  Userservices user = Userservices();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // // final GoogleSignIn googleSignIn = GoogleSignIn();
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //   print(googleAuth);
  //   // Create a new credential
  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance
  //       .signInWithCredential(credential)
  //       .then((value) {
  //     return ;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: ConfigSize.convertHeight(context, 40),
            ),
            Expanded(
              child: Theme(
                data: ThemeData(highlightColor: AppColors.mainColor),
                child: Scrollbar(
                  isAlwaysShown: true,
                  thickness: 3,
                  radius: Radius.circular(8),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          Strings.appLogo,
                          height: ConfigSize.convertHeight(context, 70),
                        ),
                        "PitchMe".text.size(8).bold.make(),
                        SizedBox(height: 16),
                        ProfileImage(
                          height: 120,
                          width: 120,
                          radius: 60,
                        ),
                        SizedBox(height: 30),
                        "Have an Account?".text.make(),
                        MaterialButton(
                          onPressed: () =>
                              context.push((context) => LoginScreen()),
                          child: "Sign In"
                              .text
                              .bold
                              .color(AppColors.mainColor)
                              .underline
                              .make(),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              indent: 100,
                              endIndent: 10,
                              thickness: 1,
                            )),
                            "OR".text.color(Colors.grey).make(),
                            Expanded(
                                child: Divider(
                              indent: 10,
                              endIndent: 100,
                              thickness: 1,
                            )),
                          ],
                        ),
                        SizedBox(height: 16),
                        StretchedIconButton(
                          path: "assets/images/Apple.png",
                          onPressed: () {},
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          width: ConfigSize.convertWidth(context, 220),
                        ),
                        SizedBox(height: 10),
                        StretchedIconButton(
                          path: "assets/images/Facebook.png",
                          onPressed: () {},
                          shadowColor: Colors.blue.shade300,
                          color: Colors.blue.shade500,
                          width: ConfigSize.convertWidth(context, 220),
                        ),
                        SizedBox(height: 10),
                        StretchedIconButton(
                          shadowColor: Colors.lightGreen.shade200,
                          path: "assets/images/Google.png",
                          onPressed: () {
                            Userservices().signInWithGoogle();
                          },
                          color: Colors.lightGreen.shade400,
                          width: ConfigSize.convertWidth(context, 220),
                        ),
                        SizedBox(height: 10),
                        // MaterialButton(
                        //   onPressed: () =>
                        //       context.push((context) => LoginScreen()),
                        //   child: "Use Email"
                        //       .text
                        //       .fontWeight(FontWeight.w400)
                        //       .color(Colors.blue.shade700)
                        //       .underline
                        //       .make(),
                        // ),
                        SizedBox(height: 10),
                        Container(
                          width: ConfigSize.convertWidth(context, 220),
                          child: RichText(
                            text: TextSpan(
                                text: 'By Continuing you agree',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' To Our Terms of Use',
                                      style: TextStyle(
                                          color: Colors.blue.shade700,
                                          decoration: TextDecoration.underline,
                                          fontSize: 13),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                  TextSpan(
                                    text: ' and ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline,
                                          fontSize: 13),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: ConfigSize.convertHeight(context, 150),
              width: double.infinity,
              // color: Colors.red.shade400,
              child: Image.asset(
                'assets/images/shape_2.png',
                fit: BoxFit.cover,
                height: ConfigSize.convertHeight(context, 150),
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_body_type.dart';
import 'package:pitch_app/screens/screen_education.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_body_type.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WomanHeightScreen extends StatefulWidget {
  @override
  _WomanHeightScreenState createState() => _WomanHeightScreenState();
}

class _WomanHeightScreenState extends State<WomanHeightScreen> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  void senddata() {
    firestoreInstance.collection("womenbasicinfo").doc(userid).update({
      "height": height,
    }).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WomanBodyTypeScreen()));
    });
  }

  double height = 7.7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: Column(
          children: [
            "What's Your Height?"
                .text
                .align(TextAlign.center)
                .xl
                .bold
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 50))
                .make(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.expand_less_outlined,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              height = double.parse(
                                  (height += 0.1).toStringAsFixed(2));
                            });
                          }),
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: '${height}"'.text.semiBold.white.make(),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.expand_more_outlined,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              height = double.parse(
                                  (height - 0.1).toStringAsFixed(2));
                            });
                          }),
                    ],
                  ),
                  Image.asset(
                    'assets/images/height_image.png',
                    width: ConfigSize.convertWidth(context, 120),
                    height: ConfigSize.convertHeight(context, 500),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            StretchedButton(
                text: "Save",
                onPressed: () {
                  senddata();
                })
            // PitchMailScreen
          ],
        ),
      )),
    );
  }
}

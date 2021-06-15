import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_ask_another_friend_to_pitch.dart';
import 'package:pitch_app/screens/screen_verify_photo.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/stretched_bordered_button.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../strings.dart';

class WelcomeToPitchTwoScreen extends StatefulWidget {
  @override
  _WelcomeToPitchTwoScreenState createState() => _WelcomeToPitchTwoScreenState();
}

class _WelcomeToPitchTwoScreenState extends State<WelcomeToPitchTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavigation(),
      appBar: mainAppBar(
          title: "Welcome to Pitch",
          onLeadingPressed: () {},
          onActionPressed: () {}),
      body:SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ConfigSize.blockSizeVertical*10),
              
              "Your first step is to ask a friend who knows you well to create a profile for you."
              .text
              .align(TextAlign.left)
              .sm
              .make(),
              "You will get a chance to see it and delete it if it doesn'\t reveal the real you."
              .text
              .align(TextAlign.left)
              .sm
              .make(),
              SizedBox(height: ConfigSize.blockSizeVertical*10),

              StretchedButton(
                text: "Ask a friend to pitch you",
                onPressed: () => context.push((context) => InviteAnotherFriendToPitchScreen()),
                height: 40,
              ),
              SizedBox(height: 16),
              
            ],
          ),
        ),
      ),
      );
  }
}
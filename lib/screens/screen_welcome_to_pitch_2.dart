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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  
                  [
                    SizedBox(height: 26),
                    
                    "Your first step is to ask a friend who knows you well to create a profile for you "
                        .text
                        .align(TextAlign.left)
                        .size(11)
                        .make(),
                    "You will get a chance to see it and delete it if it doesn'\t reveal the real you."
                        .text
                        .align(TextAlign.left)
                        .size(11)
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).box.alignTopCenter.make(),
              ),
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

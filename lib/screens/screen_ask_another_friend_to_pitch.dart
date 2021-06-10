import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_friend_suggestion_email.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';
import 'package:pitch_app/widgets/CustomTextField.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:pitch_app/widgets/textfield_rounded.dart';
import 'package:velocity_x/velocity_x.dart';

class InviteAnotherFriendToPitchScreen extends StatefulWidget {
  @override
  _InviteAnotherFriendToPitchScreenState createState() =>
      _InviteAnotherFriendToPitchScreenState();
}

class _InviteAnotherFriendToPitchScreenState extends State<InviteAnotherFriendToPitchScreen> {
  TextEditingController recieverController = TextEditingController();
  TextEditingController senderController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  var _reciever;
  var _sender, _subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.only(left:10,right:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ConfigSize.blockSizeVertical * 2,
              ),
              "Invited to Pitch Me"
                  .text
                  .xl
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  .alignTopCenter
                  .height(ConfigSize.convertHeight(context, 50))
                  .make(),

             
              SizedBox(
                height: ConfigSize.blockSizeVertical * 20,
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal * 80,
                // height: ConfigSize.convertHeight(context, 250),
                padding: EdgeInsets.only(left:8,right: 8),
                child: Text(
                  'Jake wants you to pitch him on dating site where friends pitch friends.'),
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal * 80,
                // height: ConfigSize.convertHeight(context, 250),
                padding: EdgeInsets.only(left:8,right: 8),
                child: Text(
                  'Help your friends find their catch by telling other world why he\'s so great.'),
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal * 80,
                padding: EdgeInsets.only(left:8,right: 8),
                child: Text(
                    "Download the App and use phone number to get started"),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 14,
              ),
              StretchedColorButton(
                color: black,
                text: 'App Store',
                width: ConfigSize.blockSizeHorizontal * 80,
                height: ConfigSize.blockSizeVertical * 5,
                onPressed: () {
                  // context.push(
                  //     (context) => PitchMailScreen());
                },
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),
              StretchedColorButton(
                color: lightBlue,
                text: 'Google Store',
                width: ConfigSize.blockSizeHorizontal * 80,
                height: ConfigSize.blockSizeVertical * 4,
                onPressed: () {
                  context.push(
                      (context) => PitchMailScreen());
                },
              ),
              // Container(
              //     width: ConfigSize.blockSizeHorizontal * 80,
              //     height: ConfigSize.blockSizeVertical * 33,
              //     padding: EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(20.0),
              //       ),
              //       border: Border.all(
              //         color: Colors.black,
              //       ),
              //     ),
              //     child: SingleChildScrollView(
              //       child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Text(
              //                 '  Congratulations! Your profile is now live on PITCH the dating site where friends pitch friends.'),
              //             Text(
              //                 "Download PITCH to browse singles, see your matches or ask other friends to pitch you."),
              //             SizedBox(
              //               height: ConfigSize.blockSizeVertical * 4,
              //             ),
              //             StretchedColorButton(
              //               color: black,
              //               text: 'App Store',
              //               width: ConfigSize.blockSizeHorizontal * 88,
              //               height: ConfigSize.blockSizeVertical * 5,
              //               onPressed: () {
                              
              //                 context.push(
              //                     (context) => PitchMailScreen());
              //               } 
              //             ),
              //             SizedBox(
              //               height: ConfigSize.blockSizeVertical * 1,
              //             ),
              //             StretchedColorButton(
              //               color: lightBlue,
              //               text: 'Google Store',
              //               width: ConfigSize.blockSizeHorizontal * 88,
              //               height: ConfigSize.blockSizeVertical * 4,
              //               onPressed: () {
                              
              //               },
              //             ),
              //             SizedBox(
              //               height: ConfigSize.blockSizeVertical * 1.5,
              //             ),
              //           ]),
              //     )),
              SizedBox(height: ConfigSize.blockSizeVertical * 1),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}

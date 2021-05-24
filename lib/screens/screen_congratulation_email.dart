import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_email_sent.dart';
import 'package:pitch_app/screens/screen_friend_suggestion_email.dart';
import 'package:pitch_app/widgets/CustomTextField.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CongratulationEmailScreen extends StatefulWidget {
  @override
  _CongratulationEmailScreenState createState() =>
      _CongratulationEmailScreenState();
}

class _CongratulationEmailScreenState extends State<CongratulationEmailScreen> {
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
              CustomAppBar(titletext: 'Congratulation Email'),
              Container(
                width: ConfigSize.blockSizeHorizontal * 70,
                height: ConfigSize.blockSizeVertical * 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'To:',
                      style: TextStyle(
                        fontFamily: defaultFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    customTextField(
                      controller: recieverController,
                      obscureText: false,
                      hintText: 'Sean Luke',
                      isPasswordField: false,
                      // textInputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      // enable:_isSigningUIn ? false : true,
                    ),
                  ],
                ),
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal * 80,
                height: ConfigSize.blockSizeVertical * 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'From:',
                      style: TextStyle(
                        fontFamily: defaultFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    customTextField(
                      controller: senderController,
                      obscureText: false,
                      hintText: 'Noreply@pitchme.com',
                      isPasswordField: false,
                      // textInputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      // enable:_isSigningUIn ? false : true,
                    ),
                  ],
                ),
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal * 80,
                height: ConfigSize.blockSizeVertical * 8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Subject:',
                      style: TextStyle(
                        fontFamily: defaultFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    customTextField(
                      controller: subjectController,
                      obscureText: false,
                      hintText: 'Welcome to Pitch!',

                      isPasswordField: false,
                      // textInputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      // enable:_isSigningUIn ? false : true,
                    ),
                  ],
                ),
              ),
              Container(
                  width: ConfigSize.blockSizeHorizontal * 80,
                  height: ConfigSize.blockSizeVertical * 33,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              '  Congratulations! Your profile is now live on PITCH the dating site where friends pitch friends.'),
                          Text(
                              "Download PITCH to browse singles, see your matches or ask other friends to pitch you."),
                          SizedBox(
                            height: ConfigSize.blockSizeVertical * 4,
                          ),
                          StretchedColorButton(
                            color: black,
                            text: 'App Store',
                            width: ConfigSize.blockSizeHorizontal * 88,
                            height: ConfigSize.blockSizeVertical * 5,
                            onPressed: () {
                              context.push(
                                  (context) => FriendSuggestionEmailScreen());
                            },
                          ),
                          SizedBox(
                            height: ConfigSize.blockSizeVertical * 1,
                          ),
                          StretchedColorButton(
                            color: lightBlue,
                            text: 'Google Store',
                            width: ConfigSize.blockSizeHorizontal * 88,
                            height: ConfigSize.blockSizeVertical * 4,
                            onPressed: () {
                              context.push(
                                  (context) => FriendSuggestionEmailScreen());
                            },
                          ),
                          SizedBox(
                            height: ConfigSize.blockSizeVertical * 1.5,
                          ),
                        ]),
                  )),
              SizedBox(height: ConfigSize.blockSizeVertical * 1),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1.5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_email_sent.dart';
import 'package:pitch_app/screens/screen_your_pitch.dart';
import 'package:pitch_app/screens/screen_your_pitches.dart';
import 'package:pitch_app/widgets/CustomTextField.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class FriendSuggestionEmailScreen extends StatefulWidget {
  @override
  _FriendSuggestionEmailScreenState createState() =>
      _FriendSuggestionEmailScreenState();
}

class _FriendSuggestionEmailScreenState
    extends State<FriendSuggestionEmailScreen> {
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
                height: ConfigSize.blockSizeVertical * 3,
              ),
              "Friends Suggestion Email"
                  .text
                  .xl
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  .alignTopCenter
                  .height(ConfigSize.convertHeight(context, 30))
                  .make(),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 3,
              ),
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
                    Expanded(
                      child: customTextField(
                        controller: recieverController,
                        obscureText: false,
                        hintText: 'Sean Luke',
                        isPasswordField: false,
                        // textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        // enable:_isSigningUIn ? false : true,
                      ),
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
                    Expanded(
                      child: customTextField(
                        controller: senderController,
                        obscureText: false,
                        hintText: 'Noreply@pitchme.com',
                        isPasswordField: false,
                        // textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        // enable:_isSigningUIn ? false : true,
                      ),
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
                    Expanded(
                      child: customTextField(
                        controller: subjectController,
                        obscureText: false,
                        hintText: 'A friend pitched you on Pitch Me!',
                        isPasswordField: false,
                        // textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        // enable:_isSigningUIn ? false : true,
                      ),
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
                          InkWell(
                              onTap: () {
                                context.push((context) => YourPitchesScreen());
                              },
                              child: Text(
                                  '  Ask another person to recommend you on PitchMe')),
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

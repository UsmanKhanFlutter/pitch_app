import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';
import 'package:pitch_app/screens/screen_your_pitches.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/CustomTextField.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/textfield_rounded.dart';
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'To:',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: defaultFontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // color: Colors.red,
                          height: ConfigSize.convertHeight(context, 26),
                          width: ConfigSize.convertHeight(context, 180),
                          // child: TextFormField()
                          child: RoundedTextField(
                            hint: "Sean Luke",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'From:',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: defaultFontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // color: Colors.red,
                          height: ConfigSize.convertHeight(context, 26),
                          width: ConfigSize.convertHeight(context, 180),
                          // child: TextFormField()
                          child: RoundedTextField(
                            hint: "Jean@email.com",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Subject:',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: defaultFontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Container(
                          // color: Colors.red,
                          height: ConfigSize.convertHeight(context, 50),
                          width: ConfigSize.convertHeight(context, 180),
                          // child: TextFormField()
                          child: RoundedTextField(
                            maxLines: 5,
                            hint: 'Message Sent! Your message has been sent to Sean Luke',
                            // hint: "A friend pitched you on Pitch Me.",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 2,
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
                    padding: EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ask another person to recommend you on Pitch Me',
                            textAlign: TextAlign.left,
                          ),
                          InkWell(
                            onTap: () {
                              context.push((context) => PitchMailScreen());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: ConfigSize.convertHeight(context, 110),
                              width: ConfigSize.convertWidth(context, 110),
                              child: Image.asset(Strings.appLogo),
                            ),
                          ),
                        ]),
                  )),
              SizedBox(height: ConfigSize.blockSizeVertical * 1),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_email_sent.dart';
import 'package:pitch_app/widgets/CustomTextField.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:pitch_app/widgets/textfield_rounded.dart';
import 'package:velocity_x/velocity_x.dart';

import '../colors.dart';

class PitchMailScreen extends StatefulWidget {
  @override
  _PitchMailScreenState createState() => _PitchMailScreenState();
}

class _PitchMailScreenState extends State<PitchMailScreen> {
  TextEditingController recieverController = TextEditingController();
  TextEditingController senderController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  var _reciever;
  var _sender, _subject;

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainAppBar(
        title: "Pitch mail",
        onLeadingPressed: () {},
        onActionPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.screenHeight - 80,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
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
                                  hint: "Noreply@pitchme.com",
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
                                  initialValue:
                                      "A friend pitched you on Pitch Me!",
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                        width: ConfigSize.blockSizeHorizontal * 80,
                        height: ConfigSize.convertHeight(context, 250),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                'Wow! Jake just recommended you on Pitch Me, the dating site where friends pitch friends '
                                    .text
                                    .size(13)
                                    .make(),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  elevation: 4.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.asset(
                                      'assets/images/girl.png',
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                ),
                                "Jane, 21".text.bold.make(),
                                SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                      text: 'Bio: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                'Love to go out and hang with friends ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              })
                                      ]),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  width: double.infinity,
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                        text: 'Sex: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Female',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // navigate to desired screen
                                                })
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: ConfigSize.blockSizeVertical * 4,
                                )
                              ]),
                        )),
                    SizedBox(height: ConfigSize.blockSizeVertical * 1),
                    Container(
                      height: ConfigSize.blockSizeVertical * 5,
                      width: ConfigSize.blockSizeHorizontal * 80,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        text: TextSpan(
                            text:
                                'By Clicking “Make it live!” you agree to allow your information and likeness to be shared on upitchme.com and agree to our',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Terms and Conditions.',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline,
                                      fontSize: 10),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to desired screen
                                    })
                            ]),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: ConfigSize.blockSizeHorizontal * 88,
                      height: ConfigSize.blockSizeVertical * 8,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buttonContainer(
                              title: "Make it live!",
                              onPressed: () {},
                              color: AppColors.lightGreen,
                              width: ConfigSize.blockSizeHorizontal * 25,
                            ),
                            _buttonContainer(
                              title: 'Send an Email to your friend',
                              onPressed: () {},
                              color: yellow,
                              width: ConfigSize.blockSizeHorizontal * 30,
                            ),
                            _buttonContainer(
                              title: 'Ask another friend to pitch',
                              onPressed: () {},
                              color: AppColors.lightGreen,
                              width: ConfigSize.blockSizeHorizontal * 30,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              StretchedColorButton(
                color: lightBlue,
                text: 'Send',
                width: ConfigSize.blockSizeHorizontal * 88,
                height: ConfigSize.blockSizeVertical * 5,
                onPressed: () {
                  context.push((context) => EmailSentScreen());
                },
              ).pOnly(bottom: 16),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }

  _buttonContainer(
      {@required String title,
      double,
      width,
      @required Function onPressed,
      @required Color color}) {
    return InkWell(
      onTap: () {},
      child: Container(
        // alignment: Alignment.center,
        height: ConfigSize.blockSizeVertical * 6,
        width: width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: color,
        ),
        child: "$title".text.white.align(TextAlign.center).make(),
      ),
    );
  }
}

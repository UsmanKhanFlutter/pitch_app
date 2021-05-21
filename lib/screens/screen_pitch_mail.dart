import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_email_sent.dart';
import 'package:pitch_app/widgets/CustomTextField.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.only(left:10,right:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(titletext: 'Pitch Mail'),
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
                    CustomizableTextField(
                      controller: recieverController,
                      obsecuretext: false,
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
                    CustomizableTextField(
                      controller: senderController,
                      obsecuretext: false,
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
                    CustomizableTextField(
                      controller: subjectController,
                      obsecuretext: false,
                      hintText: 'A friend pitched you on Pitch Me!',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Wow! Jake just recommended you on PITCH ME, the dating site where friends pitch friends ',
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 4.0,
                            child: Image.asset(
                              'assets/images/girl.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Jane, 21'),
                          Text(
                            'Bio: Love to go out and hang with friends ',
                          ),
                          Text(
                            'Sex: Female',
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
                child: RichText(
                  text: TextSpan(
                      text:
                          'By Clicking “Make it live!” you agree to allow your information and likeness to be shared on upitchme.com and agree to our',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Terms and Conditions.',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 10),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              })
                      ]),
                ),
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal * 88,
                height: ConfigSize.blockSizeVertical * 7,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: ConfigSize.blockSizeHorizontal * 25,
                        height: ConfigSize.blockSizeVertical * 5,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: lightGreen,
                        ),
                        child: Text(
                          'Make it live!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: ConfigSize.blockSizeHorizontal * 30,
                          height: ConfigSize.blockSizeVertical * 5,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: yellow,
                          ),
                          child: Text(
                            'Send an Emai to your friend',
                            style: TextStyle(fontSize: 12),
                          )),
                      Container(
                          alignment: Alignment.center,
                          width: ConfigSize.blockSizeHorizontal * 30,
                          height: ConfigSize.blockSizeVertical * 5,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: lightGreen,
                          ),
                          child: Text(
                            'Ask a friend to pitch',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          )),
                    ]),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1.5,
              ),
              StretchedColorButton(
                color: lightBlue,
                text: 'Send',
                width: ConfigSize.blockSizeHorizontal * 88,
                height: ConfigSize.blockSizeVertical * 5,
                onPressed: () {
                  context.push((context) => EmailSentScreen());
                },
              ),
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

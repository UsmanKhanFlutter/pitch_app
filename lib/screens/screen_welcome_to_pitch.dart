
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_find_a_match.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeToPitchScreen extends StatefulWidget {
  @override
  _WelcomeToPitchScreenState createState() => _WelcomeToPitchScreenState();
}

class _WelcomeToPitchScreenState extends State<WelcomeToPitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavigation(),
      appBar: mainAppBar(
          title: "Welcome to Pitch",
          onLeadingPressed: () {},
          onActionPressed: () {}),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        // padding: EdgeInsets.only(left:10,right:10),
        child: Column(children: [
          SizedBox(
            height: ConfigSize.blockSizeVertical * 7,
          ),
          Container(
            width: ConfigSize.blockSizeHorizontal * 75,
            child: Text(
              'Congratulations, PitchMe is the best way to find that perfect catch',
              style: TextStyle(
                  color: Vx.black, fontSize: 16, fontFamily: defaultFontFamily),
            ),
          ),
          SizedBox(
            height: ConfigSize.blockSizeVertical * 5,
          ),
          Container(
            width: ConfigSize.blockSizeHorizontal * 75,
            child: Text(
              '''PitchMe works by having a female friend "pitch you" by creating your profile.\n\nBy Clicking below you agree to allow your friends to post information about you.\n\nYou cannot edit the information they write, although you can delete it or cancel your account and delete the information at any time. ''',
              textAlign: TextAlign.start,
              textScaleFactor: 0.96,
            ),
          ),
          SizedBox(
            height: ConfigSize.blockSizeVertical * 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      context.push((context) => FindAMatchScreen());
                    },
                    // context.push((contsext) => AgreementScreen()),
                    elevation: 0,
                    child: "Accept".text.white.maxFontSize(12).make(),
                    color: red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      context.push((context) => FindAMatchScreen());
                    },
                    elevation: 0,
                    color: Colors.white,
                    child: "Edit Account Info".text.maxFontSize(12).make(),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: red),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ConfigSize.blockSizeVertical * 3,
          ),
          Container(
              child: Text(
            'But my friend aready pitched me',
            style: TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
                fontSize: 12),
            // recognizer: TapGestureRecognizer()
            // ..onTap = () {
            //             // navigate to desired screen
            //     }
          )),
          SizedBox(
            height: ConfigSize.blockSizeVertical * 3,
          ),
          Container(
            child: Text(
              'Detailed Terms and Conditions',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}

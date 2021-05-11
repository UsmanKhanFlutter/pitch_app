import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_suggest_a_friend.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeToPitchScreen extends StatefulWidget {
  @override
  _WelcomeToPitchScreenState createState() => _WelcomeToPitchScreenState();
}

class _WelcomeToPitchScreenState extends State<WelcomeToPitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.only(left:10,right:10),
          child: Column(
            children: [

              CustomAppBar(titletext:'Welcome to Pitch'),
              SizedBox(
                height: ConfigSize.blockSizeVertical*7,
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal*75,
                child: Text(
                  'Congratulations, PitchMe is the best way to find that perfect catch',
                  style: TextStyle(
                    color: Vx.black,
                    fontSize: 16,
                    fontFamily: defaultFontFamily

                  ),
                ),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical*5,
              ),
              Container(
                width: ConfigSize.blockSizeHorizontal*75,

                child: Text(
                  '''
                  PitchMe works by having a female friends Pitch You by creating your profile.

                  By Clicking below you agree to allow your friends to post information about you.

                  You cannot edit the information they write, although you can delete it or cancel your account or delete the information at any time. ''',
                  textAlign: TextAlign.start,
                ),
              ),

              SizedBox(
                height: ConfigSize.blockSizeVertical*5,
              ),

              Container(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        context.push((context) => SuggestAFriendScreen());
                      },
                          // context.push((contsext) => AgreementScreen()),
                      elevation: 0,
                      child: "Accept".text.white.maxFontSize(12).make(),
                      color: red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                      ),
                  ) ,
                  SizedBox(width: 16),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        context.push((context) => SuggestAFriendScreen());
                      },
                      elevation: 0,
                      color: Colors.white,
                      child: "Edit your Account info".text.color(red).maxFontSize(12) .make(),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: red),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),
                ],
              ),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical*3,
              ),
              Container(
                child: Text(
                  'But my friend aready pitched me',
                  style: TextStyle(
                    color: Colors.blueAccent, 
                    fontSize: 12),
                    // recognizer: TapGestureRecognizer()
                    // ..onTap = () {
                    //             // navigate to desired screen
                    //     }
                  )
                ),
                
              
              SizedBox(
                height: ConfigSize.blockSizeVertical*3,
              ),
              Container(child: Text('Detailed Terms and Conditions',
              style: TextStyle(
                color: Colors.black, 
                fontSize: 12,
                fontWeight: FontWeight.bold
                ),),)
            ]
          ),
        ),
      ),
    );
  }
}
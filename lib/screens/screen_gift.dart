import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_birthday.dart';
import 'package:pitch_app/screens/screen_your_pitch.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/bottomsheet_gift.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:pitch_app/widgets/stretched_bordered_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //App bar
            Positioned(
                top: ConfigSize.blockSizeVertical * 0.01,
                left: ConfigSize.blockSizeHorizontal * 0.01,
                right: ConfigSize.blockSizeHorizontal * 0.01,
                child: CustomAppBar(titletext: 'Notification')),

            Positioned(
              left: ConfigSize.blockSizeHorizontal * 50,
              child: Container(
                child: Image.asset(
                  "assets/images/top_ellipse.png",
                  width: ConfigSize.blockSizeHorizontal * 60,
                  height: ConfigSize.blockSizeVertical * 26,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: ConfigSize.blockSizeVertical * 0.001,
              right: ConfigSize.blockSizeHorizontal * 64,
              left: ConfigSize.blockSizeHorizontal * 0.001,
              child: Container(
                child: Image.asset(
                  "assets/images/bottom_ellipse.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                top: ConfigSize.blockSizeVertical * 10,
                left: ConfigSize.blockSizeHorizontal * 0.5,
                right: ConfigSize.blockSizeHorizontal * 0.01,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Wow!"
                          .text
                          .red500
                          .bold
                          .size(20)
                          .make()
                          .box
                          // .height(ConfigSize.convertWidth(context, 90))
                          .alignCenter
                          .make(),
                      "You just recieve a gift from:"
                          .text
                          .size(16)
                          .make()
                          .box
                          .height(ConfigSize.convertWidth(context, 90))
                          .alignCenter
                          .make(),
                    ],
                  ),
                )),
            Positioned(
              top: ConfigSize.blockSizeVertical * 25,
              left: ConfigSize.blockSizeHorizontal * 0.5,
              right: ConfigSize.blockSizeHorizontal * 0.01,
              child: Container(
                width: ConfigSize.blockSizeVertical * 40,
                height: ConfigSize.blockSizeHorizontal * 35,
                decoration: new BoxDecoration(
                  color: red.withAlpha(80),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 26,
              left: ConfigSize.blockSizeHorizontal * 0.5,
              right: ConfigSize.blockSizeHorizontal * 0.01,
              child: Container(
                width: ConfigSize.blockSizeVertical * 35,
                height: ConfigSize.blockSizeHorizontal * 31,
                decoration: new BoxDecoration(
                  color: red.withAlpha(60),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 26.5,
              left: ConfigSize.blockSizeHorizontal * 0.5,
              right: ConfigSize.blockSizeHorizontal * 0.01,
              child: Container(
                width: ConfigSize.blockSizeVertical * 33,
                height: ConfigSize.blockSizeHorizontal * 28,
                decoration: new BoxDecoration(
                  color: red.withAlpha(60),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 27,
              left: ConfigSize.blockSizeHorizontal * 0.5,
              right: ConfigSize.blockSizeHorizontal * 0.01,
              child: Container(
                width: ConfigSize.blockSizeVertical * 29,
                height: ConfigSize.blockSizeHorizontal * 26,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'assets/images/girl.png',
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),

            Positioned(
              top: ConfigSize.blockSizeVertical * 47,
              left: ConfigSize.blockSizeHorizontal * 5,
              child: circleShape(
                radius: 8,
              ),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 43,
              left: ConfigSize.blockSizeHorizontal * 3,
              child: circleShape(radius: 13),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 45,
              left: ConfigSize.blockSizeHorizontal * 9,
              child: circleShape(
                radius: 12,
              ),
            ),

            Positioned(
              top: ConfigSize.blockSizeVertical * 27,
              right: ConfigSize.blockSizeHorizontal * 11,
              child: circleShape(
                radius: 8,
              ),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 29,
              right: ConfigSize.blockSizeHorizontal * 7,
              child: circleShape(radius: 13),
            ),
            Positioned(
              top: ConfigSize.blockSizeVertical * 25,
              right: ConfigSize.blockSizeHorizontal * 5,
              child: circleShape(
                radius: 12,
              ),
            ),

            Positioned(
                top: ConfigSize.blockSizeVertical * 49,
                left: ConfigSize.blockSizeHorizontal * 0.5,
                right: ConfigSize.blockSizeHorizontal * 0.01,
                child: Container(
                  height: ConfigSize.blockSizeVertical * 20,
                  width: ConfigSize.blockSizeHorizontal * 70,
                  child: Column(
                    children: [
                      "Keren"
                          .text
                          .black
                          .bold
                          .size(20)
                          .make()
                          .box
                          .height(ConfigSize.convertWidth(context, 30))
                          .alignCenter
                          .make(),
                      // "Added extra"
                      //     .text
                      //     .black
                      //     .bold
                      //     .size(20)
                      //     .make()
                      //     .box
                      //     .height(ConfigSize.convertWidth(context, 30))
                      //     .alignCenter
                      //     .make(),
                    ],
                  ),
                )),
            Positioned(
                bottom: ConfigSize.blockSizeVertical * 20,
                left: ConfigSize.blockSizeHorizontal * 15,
                right: ConfigSize.blockSizeHorizontal * 15,
                child: StretchedColorButton(
                  color: red,
                  width: ConfigSize.blockSizeHorizontal * 70,
                  height: ConfigSize.blockSizeVertical * 5,
                  text: 'Recieve the Gift',
                  onPressed: () {
                    context.push((context) => BirthdayScreen());
                  },
                )),
            Positioned(
                bottom: ConfigSize.blockSizeVertical * 13,
                left: ConfigSize.blockSizeHorizontal * 15,
                right: ConfigSize.blockSizeHorizontal * 15,
                child: StretchedBorderedButton(
                  width: ConfigSize.blockSizeHorizontal * 70,
                  height: ConfigSize.blockSizeVertical * 5,
                  text: 'Reject',
                  onPressed: () => _scaffoldKey.currentState.showBottomSheet(
                    (context) => GiftBottomSheet(
                      context.screenHeight * 0.6,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  CircleAvatar circleShape({double radius}) {
    return CircleAvatar(radius: radius, backgroundColor: red);
  }
}

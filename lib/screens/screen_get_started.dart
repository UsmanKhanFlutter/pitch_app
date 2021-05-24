import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_signin_method.dart';
import 'package:pitch_app/widgets/dialog_location_notification.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/pitch_me.png",
                    height: ConfigSize.convertHeight(context, 220),
                    fit: BoxFit.cover,
                  ),
                  "Friends Pitching Friends"
                      .text
                      .xl
                      .color(Colors.red.shade400)
                      .make(),
                  SizedBox(height: 24),
                  StretchedButton(
                    text: "Get Started",
                    onPressed: () {
                      context.push((context) => SignInMethodScreen());
                    },
                    height: 36,
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                  MaterialButton(
                    onPressed: () async => locationDialog(context),
                    child: "Login"
                        .text
                        .size(16)
                        .color(Colors.red.shade400)
                        .underline
                        .make(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: ConfigSize.convertHeight(context, 230),
            width: double.infinity,
            // color: Colors.red.shade400,
            child: Image.asset(
              'assets/images/shape_1.png',
              fit: BoxFit.cover,
              height: ConfigSize.convertHeight(context, 230),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

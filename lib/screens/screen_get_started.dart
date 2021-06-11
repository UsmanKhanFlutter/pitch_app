import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_signin_method.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/dialog_location_notification.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../colors.dart';

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    Strings.appLogo,
                    height: ConfigSize.convertHeight(context, 160),
                    fit: BoxFit.cover,
                  ),
                  "PitchMe".text.bold.xl.make(),
                  SizedBox(height: 16),
                  "Friends Pitching Friends"
                  .text
                  .xl2
                  .fontFamily("Calligraffiti")
                  .color(AppColors.mainColor)
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
                    child: Column(
                      children: [
                        "Login".text.size(16).color(AppColors.mainColor).make(),
                        Container(
                          height: 1,
                          width: 42,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ConfigSize.convertHeight(context, 20),
                  )
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

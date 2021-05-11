import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_main.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CongratulationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  [
                    Container(
                      alignment: Alignment.topCenter,
                      height: ConfigSize.convertHeight(context, 200),
                      width: ConfigSize.convertWidth(context, 200),
                      child: Image.asset(
                        "assets/images/pitch_me.png",
                        height: ConfigSize.convertHeight(context, 90),
                        width: ConfigSize.convertWidth(context, 90),
                      ),
                    ),
                    "Congratulations!"
                        .text
                        .bold
                        .color(Colors.lightGreen.shade400)
                        .make()
                        .box
                        .height(ConfigSize.convertWidth(context, 60))
                        .alignCenter
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedButton(text: "Proceed", onPressed: () {
                context.push((context) => MainScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

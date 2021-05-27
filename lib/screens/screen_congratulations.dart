import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_main.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CongratulationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: Column(
                        children: [
                          Image.asset(
                            Strings.appLogo,
                            height: ConfigSize.convertHeight(context, 70),
                            fit: BoxFit.cover,
                          ),
                          "PitchMe".text.size(11).bold.make(),
                        ],
                      ),
                    ),
                    "Congratulations!"
                        .text
                        .size(16)
                        .bold
                        .color(AppColors.lightGreen)
                        .make()
                        .box
                        .height(ConfigSize.convertWidth(context, 60))
                        .alignCenter
                        .make(),
                    "Your Account has been verified.".text.make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedButton(
                  text: "Proceed",
                  onPressed: () => context.push((context) => MainScreen())),
            ],
          ),
        ),
      ),
    );
  }
}

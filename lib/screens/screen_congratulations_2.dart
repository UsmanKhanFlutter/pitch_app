import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/screens/screen_wohoo.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CongratulationsTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue.shade100,
                          spreadRadius: 0,
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.lightBlue.shade300,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(height: 8),
                "Congratulations!"
                    .text
                    .xl
                    .bold
                    .color(AppColors.mainColor)
                    .make(),
                SizedBox(height: 16),
                "Your pitch has been sent to your guy friend. If he declines it, you will get notification asking you to modify it"
                    .text
                    .align(TextAlign.center)
                    .color(Colors.grey)
                    .size(13)
                    .make(),
                SizedBox(height: 16),
                "In the Mean Time".text.black.bold.make(),
                SizedBox(height: 8),
                "Why don't you pitch another great guy"
                    .text
                    .color(Colors.grey)
                    .size(13)
                    .make(),
              ],
            ),
          ),
          StretchedButton(
            onPressed: () => context.push((context) => WohooScreen()),
            text: "Continue",
          )
        ],
      ).pSymmetric(h: 16, v: 16),
    );
  }
}

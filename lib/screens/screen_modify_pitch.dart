import 'package:flutter/material.dart';
import 'package:pitch_app/screens/screen_about_you.dart';
import 'package:pitch_app/screens/screen_wohoo.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ModifyPitchScreen extends StatelessWidget {
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
                          color: Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 10,
                        ),
                      ],
                      color: Vx.gray400,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(height: 8),
                "Pitch Declined".text.xl.bold.gray400.make(),
                SizedBox(height: 16),
                "Sorry, your pitch has been declined by\nJake, 23"
                    .text
                    .align(TextAlign.center)
                    .color(Colors.grey)
                    .size(13)
                    .make(),
                SizedBox(height: 16),
                "But you can still modify it!"
                    .text
                    .color(Colors.grey)
                    .size(13)
                    .make(),
              ],
            ),
          ),
          StretchedButton(
            onPressed: () => context.push((context) => AboutYouScreen()),
            text: "Modify Pitch",
          )
        ],
      ).pSymmetric(h: 16, v: 16),
    );
  }
}

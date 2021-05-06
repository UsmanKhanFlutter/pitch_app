import 'package:flutter/material.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WohooScreen extends StatelessWidget {
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
                "Wohoo!".text.xl2.bold.color(Colors.red.shade400).make(),
                SizedBox(height: 8),
                "Someone has pitched you. Check it out now!"
                    .text
                    .size(13)
                    .make(),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  color: Colors.white,
                  child: "Not Now".text.color(Colors.grey).make(),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  child: "Go".text.white.make(),
                  color: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              )
            ],
          ),
        ],
      ).pSymmetric(h: 16, v: 16),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_modify_pitch.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          "Notification"
              .text
              .black
              .bold
              .xl
              .make()
              .box
              .height(50)
              .alignBottomCenter
              .make(),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: ConfigSize.convertHeight(context, 150)),
                "Do you want Alexa to Pitch on\nyour behalf?"
                    .text
                    .align(TextAlign.center)
                    .xl
                    .make()
                    .pSymmetric(h: 24),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Edit Account info"
                          .text
                          .lightBlue300
                          .underline
                          .size(13)
                          .make(),
                      Icon(
                        Icons.edit,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ],
            ).box.alignBottomCenter.make(),
          ),
          MaterialButton(
            onPressed: () {},
            child: "Our Terms & Conditions"
                .text
                .lightBlue300
                .underline
                .size(13)
                .make(),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () =>
                      context.push((context) => ModifyPitchScreen()),
                  elevation: 0,
                  child: "Accept".text.white.make(),
                  color: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  color: Colors.white,
                  child: "Decline".text.color(Colors.grey).make(),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ).pSymmetric(h: 16, v: 16),
    );
  }
}
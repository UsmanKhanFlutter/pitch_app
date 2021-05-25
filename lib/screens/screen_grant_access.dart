import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_message_back_to_friend.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class GrantAccessScreen extends StatefulWidget {
  @override
  _GrantAccessScreenState createState() => _GrantAccessScreenState();
}

class _GrantAccessScreenState extends State<GrantAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            "Grant Access"
                .text
                .xl
                .fontWeight(FontWeight.bold)
                .make()
                .box
                .alignCenter
                .height(ConfigSize.convertHeight(context, 50))
                .make(),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 40,
            ),
            "In order to upload from your camera, PitchMe needs access to your camera. Go to Settings to enable."
                .text
                .align(TextAlign.center)
                .make()
                .box
                .alignTopCenter
                .make()
                .pSymmetric(h: 24, v: 1),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 35,
            ),
            Center(
              child: StretchedColorButton(
                  text: "Go to Settings",
                  onPressed: () {
                    context.push((context) => MessageBackToFriendScreen());
                  },
                  height: 36,
                  width: ConfigSize.convertWidth(context, 300),
                  color: red),
            ),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 1,
            ),
          ],
        )));
  }
}

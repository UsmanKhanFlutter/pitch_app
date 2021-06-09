import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_helpful_ratings.dart';
import 'package:pitch_app/screens/screen_your_pitch.dart';
import 'package:pitch_app/screens/write_your_pitch.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WritePitchOrProvideRatingsScreen extends StatefulWidget {
  @override
  _WritePitchOrProvideRatingsScreenState createState() =>
      _WritePitchOrProvideRatingsScreenState();
}

class _WritePitchOrProvideRatingsScreenState
    extends State<WritePitchOrProvideRatingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ConfigSize.blockSizeVertical * 25,
              ),
              "You’ve finished the first step of your pitch! Next step is to write your pitch! or click to provide some more helpful ratings of his personality!"
                  .text
                  .align(TextAlign.left)
                  .xl
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  // .alignCenter
                  // .height(ConfigSize.convertHeight(context, 60))
                  .width(ConfigSize.blockSizeHorizontal * 85)
                  .make(),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 25,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                StretchedButton(
                  text: "Write your pitch",
                  onPressed: () {
                    context.push((context) => WriteYourPitchScreen());
                  },
                  height: 36,
                  width: ConfigSize.convertWidth(context, 180),
                ),
                SizedBox(width: ConfigSize.blockSizeHorizontal * 3),
                StretchedButton(
                    text: "Provide helpful rating",
                    onPressed: () {
                      context.push((context) => HelpfulRatingsScreen());
                    },
                    height: 36,
                    width: ConfigSize.convertWidth(context, 180)),
              ]),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_photos_wordfile.dart';
import 'package:pitch_app/widgets/app_bar_back.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class AgreeContinueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          backAppBar(title: "Be Kind And Respectful", onLeadingPressed: () {}),
      body: VStack([
        SizedBox(height: ConfigSize.convertHeight(context, 40)),
        "I commit to being kind and respectful towards myself and other members of PitchMe. I understand that PitchMe is an app designed for authenticity, enabling members to find meaningful relationships"
            .text
            .size(13)
            .align(TextAlign.center)
            .make(),
        SizedBox(height: ConfigSize.convertHeight(context, 40)),
        StretchedButton(
          text: "Agree & Continue",
          onPressed: () => context.push((context) => PhotosWordFileScreen()),
          height: 36,
        ),
      ]).pSymmetric(h: 36),
    );
  }
}
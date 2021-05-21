import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_education.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class HeightScreen extends StatefulWidget {
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: Column(
          children: [
            "What's His Height?"
                .text
                .align(TextAlign.center)
                .xl
                .bold
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 50))
                .make(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.expand_less_outlined,
                            size: 30,
                          ),
                          onPressed: () {}),
                      Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: '7.7"'.text.semiBold.white.make(),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.expand_more_outlined,
                            size: 30,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  Image.asset(
                    'assets/images/height_image.png',
                    width: ConfigSize.convertWidth(context, 120),
                    height: ConfigSize.convertHeight(context, 500),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            StretchedButton(
                text: "Save",
                onPressed: () => context.push((context) => PitchMailScreen()))
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/profile/screen_profile.dart';
import 'package:pitch_app/screens/screen_ethnicity.dart';
import 'package:pitch_app/screens/screen_height.dart';
import 'package:pitch_app/screens/screen_name.dart';
import 'package:pitch_app/screens/screen_whats_your_pitch.dart';
import 'package:pitch_app/screens/screen_your_pitch.dart';
import 'package:pitch_app/screens/screen_your_pitches.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_height.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WomanInterestScreen extends StatefulWidget {
  @override
  _WomanInterestScreenState createState() => _WomanInterestScreenState();
}

class _WomanInterestScreenState extends State<WomanInterestScreen> {
  List<String> itemValue = [
    'Single',
    'Married, but Separated',
    'Married',
    'Divorced'
  ];
  List<String> itemValue2 = [
    'Relationship',
    'Something Casual',
    'Don\'t know yet',
    'Marriage'
  ];

  String selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: VStack(
                [
                  "What's Your relationship status?"
                      .text
                      .align(TextAlign.center)
                      .xl
                      .bold
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  SizedBox(height: ConfigSize.convertHeight(context, 40)),
                  Container(
                    child: VStack(itemValue
                        .map(
                          (e) => _selectionContainer(
                              onPressed: () =>
                                  setState(() => selectedValue = e),
                              title: "$e",
                              textColor: selectedValue == e
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedValue == e
                                  ? AppColors.mainColor
                                  : Colors.white),
                        )
                        .cast<Widget>()
                        .toList()),
                  ),
                  SizedBox(height: ConfigSize.convertHeight(context, 60)),
                  "What are you interested in?"
                      .text
                      .align(TextAlign.center)
                      .xl
                      .bold
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  Container(
                    child: VStack(itemValue2
                        .map(
                          (e) => _selectionContainer(
                              onPressed: () =>
                                  setState(() => selectedValue = e),
                              title: "$e",
                              textColor: selectedValue == e
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedValue == e
                                  ? AppColors.mainColor
                                  : Colors.white),
                        )
                        .cast<Widget>()
                        .toList()),
                  ),
                ],
                crossAlignment: CrossAxisAlignment.center,
              ),
            ),
            StretchedButton(
                text: "Save",
                onPressed: () => context.push((context) => WomanHeightScreen()))
                // ProfileScreen
                // YourPitchScreen()))
          ],
        ),
      )),
    );
  }

  _selectionContainer(
      {@required Function onPressed,
      @required title,
      @required textColor,
      @required backgroundColor}) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: InkWell(
              onTap: onPressed,
              child: '$title'
                  .text
                  .size(14)
                  .color(textColor)
                  .make()
                  .box
                  .withDecoration(BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8)))
                  .padding(EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 4,
                    top: 3,
                  ))
                  .make()),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  _titleTextField(String title) {
    return HStack([
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      SizedBox(width: 8),
      "$title".text.make(),
      SizedBox(width: 36),
      Container(
        height: 30,
        width: 40,
        alignment: Alignment.center,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
          ),
        ),
      ),
    ]);
  }
}
import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_phone_number.dart';
import 'package:pitch_app/screens/screen_your_pitches.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_basic_information.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class GettingStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GettingStartedBottomNavigation(),

      body: SafeArea(
        child: VStack(
          [
            "Getting Started"
                .text
                .xl
                .fontWeight(FontWeight.w400)
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 50))
                .make(),
            "What would you like to do today?"
                .text
                .xl
                .make()
                .pSymmetric(h: 24, v: 16),
            Expanded(
              child: VxBox(
                child: VxBox(
                        child: VStack(
                  [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/girl.png",
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(height: 16),
                    StretchedColorButton(
                        text: "Pitch Someone",
                        onPressed: () {
                      context.push((context) => PhoneNumberScreen());
                    },
                        height: 36,
                        width: ConfigSize.convertWidth(context, 250),
                        color: AppColors.lightGreen),
                    MaterialButton(
                      onPressed: () {
                        context.push((context) => YourPitchesScreen());
                      },
                      child: "Edit your pitches".text.gray500.underline.make(),
                    ),
                    "OR".text.xl.gray700.bold.align(TextAlign.center).make(),
                    SizedBox(height: 16),
                    StretchedColorButton(
                      text: "Find a match",
                      height: 36,
                      width: ConfigSize.convertWidth(context, 250),
                      onPressed: () {
                        context.push((context) => WomanBasicInformationScreen());//FindAMatchScreen
                      },
                      color: AppColors.mainColor,
                    ),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).pSymmetric(h: 24, v: 16))
                    .height(ConfigSize.convertHeight(context, 250))
                    .width(double.infinity)
                    .rounded
                    .alignCenter
                    .shadow2xl
                    .white
                    .make()
                    .pSymmetric(h: 24, v: 16),
              ).alignCenter.make(),
            )
          ],
          crossAlignment: CrossAxisAlignment.start,
        ).box.make().pSymmetric(v: 16, h: 16),
      ),
    );
  }
}

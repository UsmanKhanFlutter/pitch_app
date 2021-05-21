import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_notification.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class PitchYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: ConfigSize.convertHeight(context, 80)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      'assets/images/girl_2x.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                "Kylie, 25".text.bold.make(),
                "Houston, TX".text.size(15).make(),
                SizedBox(height: 16),
                "Pitched You"
                    .text
                    .bold
                    .size(15)
                    .color(AppColors.mainColor)
                    .make(),
                SizedBox(height: 16),
                "If you send a message that someone pitched a guy, shouldn't the actions be"
                    .text
                    .align(TextAlign.center)
                    .size(13)
                    .make(),
                SizedBox(height: 16),
                HStack([
                  "a.".text.bold.make(),
                  InkWell(
                    onTap: () {},
                    child: "Check it out"
                        .text
                        .bold
                        .color(AppColors.mainColor)
                        .underline
                        .make(),
                  )
                ]),
                SizedBox(height: 16),
                HStack([
                  "b.".text.bold.make(),
                  InkWell(
                    onTap: () {},
                    child: "Not Now"
                        .text
                        .bold
                        .color(AppColors.mainColor)
                        .underline
                        .make(),
                  )
                ])
              ],
            ).box.alignBottomCenter.make(),
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
                  onPressed: () =>
                      context.push((context) => NotificationScreen()),
                  elevation: 0,
                  child: "Send Message".text.white.make(),
                  color: AppColors.mainColor,
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

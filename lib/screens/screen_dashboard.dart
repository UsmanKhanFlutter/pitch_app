import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/dialog_message_notification.dart';
import 'package:pitch_app/widgets/dialog_pitch_notification.dart';
import 'package:pitch_app/widgets/dialog_rate_notification.dart';
import 'package:pitch_app/widgets/dialog_suggestion_notification.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainAppBar(
        title: "Dashboard",
        onLeadingPressed: () => suggestionNotificationDialog(context),
        onActionPressed: () => pitchNotificationDialog(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: VStack(
            [
              Container(
                height: ConfigSize.convertHeight(context, 60),
                width: double.infinity,
                child: HStack(
                  [
                    VStack([
                      "Welcome,".text.make(),
                      "John. D".text.bold.make(),
                    ]),
                  ],
                  alignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Container(
                height: ConfigSize.convertHeight(context, 80),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: VStack(
                  [
                    "Statistics"
                        .text
                        .size(12)
                        .white
                        .make()
                        .box
                        .height(ConfigSize.convertHeight(context, 30))
                        .alignCenterLeft
                        .make()
                        .pOnly(left: 8),
                    Image.asset(
                      "assets/images/wave.png",
                      width: double.infinity,
                      height: ConfigSize.convertHeight(context, 50),
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              "Your recent pitches".text.size(12).bold.make(),
              SizedBox(height: 10),
              Container(
                height: ConfigSize.convertHeight(context, 120),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: _imageContainer(context),
                      );
                    }),
              ),
              SizedBox(height: 16),
              Container(
                height: ConfigSize.convertHeight(context, 40),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.mainColor,
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(16)),
                child: HStack(
                  [
                    "Notifications".text.white.size(13).make(),
                    Container(
                      alignment: Alignment.center,
                      height: ConfigSize.convertHeight(context, 25),
                      width: ConfigSize.convertHeight(context, 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            ConfigSize.convertHeight(context, 15),
                          )),
                      child:
                          "1".text.size(13).color(Colors.red.shade400).make(),
                    )
                  ],
                  alignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(height: 16),
              "People Visited:".text.size(13).bold.make(),
              SizedBox(height: 10),
              HStack(
                [
                  "120".text.size(13).make(),
                  Icon(
                    CupertinoIcons.arrow_up,
                    color: Colors.green.shade400,
                    size: 15,
                  )
                ],
                crossAlignment: CrossAxisAlignment.center,
              ),
              SizedBox(height: 20),
              Container(
                child: VStack([
                  "Who Viewed your profile:".text.bold.make(),
                  SizedBox(height: 20),
                  Container(
                    height: ConfigSize.convertHeight(context, 120),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainColor,
                          spreadRadius: 0,
                          blurRadius: 10,
                        ),
                      ],
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: "Unlock our Premium Feature"
                        .text
                        .bold
                        .white
                        .makeCentered(),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _imageContainer(BuildContext context) {
    return Container(
      height: ConfigSize.convertHeight(context, 120),
      width: ConfigSize.convertWidth(context, 110),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          "assets/images/girl.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

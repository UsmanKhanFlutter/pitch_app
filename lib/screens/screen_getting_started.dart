import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:velocity_x/velocity_x.dart';

class GettingStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            "What would you like to do today?".text.xl.make(),
            Expanded(
              child: VxBox(
                child: VxBox(
                  child: VStack([
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/girl.png",
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      )),
                ]))
                    .height(ConfigSize.convertHeight(context, 230))
                    .width(double.infinity)
                    .rounded
                    .shadow2xl
                    .white
                    .p16
                    .make(),
              ).alignCenter.make(),
            )
          ],
          crossAlignment: CrossAxisAlignment.start,
        ).box.make().pSymmetric(v: 16, h: 24),
      ),
    );
  }
}

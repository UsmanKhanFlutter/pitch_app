import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_upload_photo.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class AgreementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  [
                    Container(
                      height: ConfigSize.convertHeight(context, 90),
                      width: ConfigSize.convertWidth(context, 90),
                      child: Column(
                        children: [
                          Image.asset(Strings.appLogo),
                          "PitchMe".text.size(11).bold.make(),
                        ],
                      ),
                    ),
                    "I agree to"
                        .text
                        .bold
                        .size(14)
                        .make()
                        .box
                        .height(ConfigSize.convertWidth(context, 90))
                        .alignCenter
                        .make(),
                    "Be Kind"
                        .text
                        .xl
                        .bold
                        .make()
                        .box
                        .alignCenter
                        .height(ConfigSize.convertWidth(context, 60))
                        .make(),
                    "Be Respectful"
                        .text
                        .xl
                        .bold
                        .make()
                        .box
                        .alignCenter
                        .height(ConfigSize.convertWidth(context, 60))
                        .make(),
                    "Be looking for a real relationship"
                        .text
                        .xl
                        .bold
                        .make()
                        .box
                        .alignCenter
                        .height(ConfigSize.convertWidth(context, 60))
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).box.alignTopCenter.make(),
              ),
              StretchedButton(
                text: "Agree",
                onPressed: () => context.push((context) => UploadPhotoScreen()),
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

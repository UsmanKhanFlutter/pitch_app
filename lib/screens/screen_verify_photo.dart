import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  [
                    Container(
                      height: ConfigSize.convertHeight(context, 90),
                      width: ConfigSize.convertWidth(context, 90),
                      child: Image.asset("assets/images/pitch_me.png"),
                    ),
                    "Take a selfie for verification"
                        .text
                        .bold
                        .make()
                        .box
                        .height(ConfigSize.convertWidth(context, 60))
                        .alignCenter
                        .make(),
                    "This picture will only be used for verification purposes - it won't be shown to other Pitch Me users."
                        .text
                        .align(TextAlign.center)
                        .size(13)
                        .color(Colors.grey)
                        .make(),
                    SizedBox(height: 16),
                    "Tip: This picture will only compared to your profile photo to verify your identity, so avoid sunglasses, masks or other face coverings!"
                        .text
                        .size(13)
                        .align(TextAlign.center)
                        .color(Colors.grey)
                        .make(),
                    SizedBox(height: 16),
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          height: ConfigSize.convertHeight(context, 250),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.lightGreen.shade400,
                          ),
                          child: Icon(
                            CupertinoIcons.camera_fill,
                            color: Colors.grey.shade200,
                          ),
                        ).pOnly(bottom: 8),
                      ],
                    ),
                    SizedBox(height: 8),
                    "Please focus the camera on your face"
                        .text
                        .align(TextAlign.center)
                        .size(13)
                        .color(Colors.grey.shade700)
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedColorButton(
                  text: "Verify",
                  onPressed: () =>
                      context.push((context) => CongratulationsScreen()),
                  color: Colors.lightGreen.shade400)
            ],
          ),
        ),
      ),
    );
  }
}

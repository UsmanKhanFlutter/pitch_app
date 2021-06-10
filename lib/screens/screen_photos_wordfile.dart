import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_information.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class PhotosWordFileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
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
              Positioned(
                right: 20,
                child: Container(
                  height: 20,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Vx.green400,
                    boxShadow: [
                      BoxShadow(
                        color: Vx.green400,
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.done,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 24),
          "Tosca does really look like her picture".text.size(13).bold.make(),
          SizedBox(height: 10),
          "This photo verification badge means that PitchMe moderators have reviewed Tosca's video and it matches the photo."
              .text
              .align(TextAlign.center)
              .size(13)
              .make(),
          SizedBox(height: 24),
          "Let other members know that you look like your photo too."
              .text
              .bold
              .align(TextAlign.center)
              .size(13)
              .make(),
          SizedBox(height: 24),
          StretchedButton(
            text: "Verify your photos",
            onPressed: () => context.push((context) => PitchMailScreen()),//InformationScreen
            height: 36,
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {},
            elevation: 0,
            color: Colors.white,
            child: "Not Now".text.color(Colors.grey).make(),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)),
          ).box.width(double.infinity).make(),
        ],
      ).box.alignBottomCenter.make().pSymmetric(h: 24, v: 16),
    );
  }
}

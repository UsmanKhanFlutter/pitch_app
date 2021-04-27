import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_login.dart';
import 'package:pitch_app/widgets/profile_image.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_icon_button.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImage(
                  height: ConfigSize.convertHeight(context, 130),
                  width: ConfigSize.convertWidth(context, 130),
                  radius: ConfigSize.convertHeight(context, 65),
                ),
                SizedBox(height: 30),
                "Have an Account?".text.make(),
                MaterialButton(
                  onPressed: () => context.push((context) => LoginScreen()),
                  child: "Sign In"
                      .text
                      .color(Colors.red.shade400)
                      .underline
                      .make(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      indent: 100,
                      endIndent: 10,
                      thickness: 1,
                    )),
                    "OR".text.color(Colors.grey).make(),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 100,
                      thickness: 1,
                    )),
                  ],
                ),
                SizedBox(height: 20),
                StretchedIconButton(
                  path: "assets/images/Apple.png",
                  onPressed: () {},
                  width: ConfigSize.convertWidth(context, 220),
                ),
                SizedBox(height: 10),
                StretchedIconButton(
                  path: "assets/images/Facebook.png",
                  onPressed: () {},
                  color: Colors.blue.shade500,
                  width: ConfigSize.convertWidth(context, 220),
                ),
                SizedBox(height: 10),
                StretchedIconButton(
                  path: "assets/images/Google.png",
                  onPressed: () {},
                  color: Colors.lightGreen.shade400,
                  width: ConfigSize.convertWidth(context, 220),
                ),
              ],
            ),
          ),
          Container(
            height: ConfigSize.convertHeight(context, 150),
            color: Colors.red.shade400,
          )
        ],
      ),
    );
  }
}

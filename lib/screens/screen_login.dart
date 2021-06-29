import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_basic_information.dart';
// import 'package:pitch_app/screens/screen_agreement.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/profile_image.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 36),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileImage(
                        height: 110,
                        width: 110,
                        radius: 16,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: ConfigSize.convertHeight(context, 110),
                        width: ConfigSize.convertWidth(context, 110),
                        child: Column(
                          children: [
                            Image.asset(Strings.appLogo),
                            "PitchMe".text.bold.make(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  "Pitch Me will recieve the following into: Your Public Profile, Friend List and Email."
                      .text
                      .make(),
                  SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {},
                    child: "Edit the info you provide"
                        .text
                        .fontWeight(FontWeight.w400)
                        .color(Colors.blue)
                        .underline
                        .make(),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    color: Colors.white,
                    child: "Cancel".text.color(Colors.grey).make(),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      context.push((context) => BasicInformationScreen());
                    },
                    // AgreementScreen()),
                    elevation: 0,
                    child: "Login".text.white.make(),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

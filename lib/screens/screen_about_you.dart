import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/screens/screen_agree_continue.dart';
import 'package:pitch_app/widgets/app_bar_back.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/textfield_information.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: backAppBar(title: "About You", onLeadingPressed: () {}),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        height: MediaQuery.of(context).size.height - 30,
        child: Column(
          children: [
            TextFieldInformation(
              title: "I am a:",
              height: 30,
              controller: null,
            ).pSymmetric(h: 16),
            SizedBox(height: 8),
            TextFieldInformation(
              title: "Birthday:",
              height: 30,
              controller: null,
            ).pSymmetric(h: 16),
            SizedBox(height: 8),
            TextFieldInformation(
              title: "Email:",
              height: 30,
              controller: null,
            ).pSymmetric(h: 16),
            SizedBox(height: 30),
            StretchedButton(
                text: "Continue",
                height: 36,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => AgreeContinueScreen()));
                }),
          ],
        ),
      ),
    );
  }
}

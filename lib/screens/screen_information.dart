import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/screens/screen_get_started.dart';
import 'package:pitch_app/screens/screen_height.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/textfield_information.dart';
import 'package:velocity_x/velocity_x.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 30,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: Column(
                      children: [
                        "Input Basic Information"
                            .text
                            .xl2
                            .bold
                            .make()
                            .box
                            .height(60)
                            .make(),
                        TextFieldInformation(
                          title: "First Name:",
                          height: 44,
                        ),
                        SizedBox(height: 16),
                        TextFieldInformation(
                          title: "I am a:",
                          height: 44,
                        ),
                        SizedBox(height: 16),
                        TextFieldInformation(
                          title: "Birthday:",
                          height: 44,
                        ),
                        SizedBox(height: 16),
                        TextFieldInformation(
                          title: "Email Address:",
                          height: 44,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: StretchedButton(
                      text: "Continue",
                      onPressed: () =>
                          context.push((context) => HeightScreen())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

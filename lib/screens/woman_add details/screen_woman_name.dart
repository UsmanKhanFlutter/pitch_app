import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/screens/profile/screen_profile.dart';
import 'package:pitch_app/screens/screen_birthday.dart';
import 'package:pitch_app/screens/screen_get_started.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/textfield_information.dart';
import 'package:velocity_x/velocity_x.dart';

class WomanNameScreen extends StatelessWidget {
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
                        "What's your name?"
                            .text
                            .bold
                            .make()
                            .box
                            .height(60)
                            .make(),
                        TextFieldInformation(
                          title: "First Name:",
                          height: 44,
                          controller: null,
                        ),
                        SizedBox(height: 16),
                        TextFieldInformation(
                          title: "Last Name:",
                          height: 44,
                          controller: null,
                        ),
                        SizedBox(height: 16),
                        "Where do you live?".text.bold.make(),
                        TextFieldInformation(
                          title: "",
                          height: 44,
                          controller: null,
                        ),
                        SizedBox(height: 24),
                        "What's your email address?".text.bold.make(),
                        SizedBox(height: 16),
                        Container(
                          height: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Theme.of(context).primaryColor))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: StretchedButton(
                      text: "Save",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => BirthdayScreen()));

                        // builder: (ctx) => ProfileScreen()));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

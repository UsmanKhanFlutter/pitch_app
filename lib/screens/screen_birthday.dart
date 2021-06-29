import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_drink.dart';
import 'package:pitch_app/screens/screen_ethnicity.dart';
import 'package:pitch_app/screens/screen_relation.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class BirthdayScreen extends StatefulWidget {
  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  final firestoreinstance = FirebaseFirestore.instance;
  void senddata() {
    firestoreinstance.collection("Pitchsomeone").doc(userid).update({
      "month": monthcontroller.text,
      "day": daycontroller.text,
      "year": yearcontroller.text,
    }).then((value) {
      Get.to(RelationScreen());
    });
  }

  String selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: VStack(
                [
                  "What's his birthday?"
                      .text
                      .align(TextAlign.center)
                      .xl
                      .bold
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  HStack(
                    [
                      _titleTextField(
                        "Month",
                        monthcontroller,
                      ),
                      _titleTextField("Day", daycontroller),
                      _titleTextField("Year", yearcontroller),
                    ],
                    alignment: MainAxisAlignment.spaceBetween,
                  ).box.width(double.infinity).make(),
                ],
                crossAlignment: CrossAxisAlignment.center,
              ),
            ),
            StretchedButton(
              text: "Save",
              onPressed: () {
                senddata();
              },
            )
          ],
        ),
      )),
    );
  }

  _titleTextField(String title, TextEditingController controller) {
    return HStack([
      "$title".text.bold.make(),
      SizedBox(width: 4),
      Container(
        height: 30,
        width: 65,
        alignment: Alignment.center,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
          ),
        ),
      ),
    ]);
  }
}

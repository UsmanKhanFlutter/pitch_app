import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_children.dart';
import 'package:pitch_app/screens/screen_smoke.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class ReligionScreen extends StatefulWidget {
  @override
  _ReligionScreenState createState() => _ReligionScreenState();
}

class _ReligionScreenState extends State<ReligionScreen> {
  List<String> itemValue = [
    'Agnostic',
    'Atheist',
    'Budhist',
    'Christian',
    'Christian - Catholic',
    'Hindu',
    'Jewish',
    'Muslim',
    'Spiritual',
    'Other'
  ];
  String selectedValue;
  final firestoreinstance = FirebaseFirestore.instance;
  void senddata() {
    firestoreinstance.collection("Pitchsomeone").doc(globals.uSerIdd).update({
      "religion": selectedValue,
    }).then((value) {
      Get.to(SmokeScreen());
    });
  }

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
                  "What's his Religion?"
                      .text
                      .align(TextAlign.center)
                      .xl
                      .bold
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  SizedBox(height: ConfigSize.convertHeight(context, 80)),
                  Container(
                    child: VStack(itemValue
                        .map(
                          (e) => _selectionContainer(
                              onPressed: () =>
                                  setState(() => selectedValue = e),
                              title: "$e",
                              textColor: selectedValue == e
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedValue == e
                                  ? AppColors.mainColor
                                  : Colors.white),
                        )
                        .cast<Widget>()
                        .toList()),
                  )
                ],
                crossAlignment: CrossAxisAlignment.center,
              ),
            ),
            StretchedButton(
                text: "Save",
                onPressed: () {
                  if (selectedValue == null) {
                    return Fluttertoast.showToast(
                        msg: "Please Select Religion",
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        fontSize: 16.0);
                  } else {
                    senddata();
                  }
                })
          ],
        ),
      )),
    );
  }

  _selectionContainer(
      {@required Function onPressed,
      @required title,
      @required textColor,
      @required backgroundColor}) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: InkWell(
              onTap: onPressed,
              child: '$title'
                  .text
                  .size(14)
                  .color(textColor)
                  .make()
                  .box
                  .withDecoration(BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8)))
                  .padding(EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 4,
                    top: 3,
                  ))
                  .make()),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}

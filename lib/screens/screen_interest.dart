import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_height.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> itemValue = [
    'Single',
    'Married, but Separated',
    'Married',
    'Divorced'
  ];
  List<String> itemValue2 = [
    'Relationship',
    'Something Casual',
    'Don\'t know yet',
    'Marriage'
  ];
  final firestoreinstance = FirebaseFirestore.instance;
  void senddata() {
    firestoreinstance.collection("Pitchsomeone").doc(globals.uSerIdd).update({
      "relationshipstatus": selectedRelationshipValue,
      "interestedin": selectedValue,
    }).then((value) {
      Get.to(HeightScreen());
    });
  }

  String selectedRelationshipValue, selectedValue;
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
                  "What's his relationship status?"
                      .text
                      .align(TextAlign.center)
                      .xl
                      .bold
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  SizedBox(height: ConfigSize.convertHeight(context, 40)),
                  Container(
                    child: VStack(itemValue
                        .map(
                          (e) => _selectionContainer(
                              onPressed: () =>
                                  setState(() => selectedRelationshipValue = e),
                              title: "$e",
                              textColor: selectedRelationshipValue == e
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedRelationshipValue == e
                                  ? AppColors.mainColor
                                  : Colors.white),
                        )
                        .cast<Widget>()
                        .toList()),
                  ),
                  SizedBox(height: ConfigSize.convertHeight(context, 60)),
                  "What is he interested in?"
                      .text
                      .align(TextAlign.center)
                      .xl
                      .bold
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  Container(
                    child: VStack(itemValue2
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
                  ),
                ],
                crossAlignment: CrossAxisAlignment.center,
              ),
            ),
            StretchedButton(
                text: "Save",
                onPressed: () {
                  if (selectedRelationshipValue == null) {
                    return Fluttertoast.showToast(
                        msg: "Please Select Relationship status",
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        fontSize: 16.0);
                  }
                  if (selectedValue == null) {
                    return Fluttertoast.showToast(
                        msg: "Please Select Interest",
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        fontSize: 16.0);
                  } else {
                    senddata();
                  }
                })
            // ProfileScreen
            // YourPitchScreen()))
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

  _titleTextField(String title) {
    return HStack([
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      SizedBox(width: 8),
      "$title".text.make(),
      SizedBox(width: 36),
      Container(
        height: 30,
        width: 40,
        alignment: Alignment.center,
        child: TextFormField(
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

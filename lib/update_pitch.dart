import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_agreement.dart';
import 'package:pitch_app/screens/screen_name.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class UpdatePitch extends StatefulWidget {
  @override
  _UpdatePitchState createState() => _UpdatePitchState();
}

class _UpdatePitchState extends State<UpdatePitch> {
  final firestoreinstance = FirebaseFirestore.instance;

  TextEditingController phonenumber = TextEditingController();

  CountryCode code;

  void senddata() {
    print(globals.userid);
    firestoreinstance.collection("Pitchsomeone").doc(globals.uSerIdd).update({
      "phonenumber": code.toString() + phonenumber.text,
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NameScreen()));
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
                  "Phone Number"
                      .text
                      .xl
                      .fontWeight(FontWeight.w400)
                      .make()
                      .box
                      .alignTopCenter
                      .height(ConfigSize.convertHeight(context, 50))
                      .make(),
                  "What is his Phone Number?"
                      .text
                      .xl
                      .make()
                      .pSymmetric(h: 24, v: 16),
                  HStack([
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 2)),
                        ),
                        child: CountryCodePicker(
                          onChanged: (val) {
                            code = val;
                            print(val);
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'US',
                          favorite: ['+1', 'US'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          showFlag: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        flex: 3,
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2)),
                            ),
                            child: TextField(
                              controller: phonenumber,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0)),
                              ),
                            ))),
                  ]),
                ],
                crossAlignment: CrossAxisAlignment.center,
              ),
            ),
            StretchedButton(
              text: "Pitch them",
              onPressed: () {
                if (phonenumber.text.isEmpty) {
                  return Fluttertoast.showToast(
                      msg: "Please Enter Number",
                      backgroundColor: Colors.white,
                      textColor: Colors.red,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      fontSize: 16.0);
                } else {
                  senddata();
                }
              },
            )
          ],
        ),
      )),
    );
  }
}

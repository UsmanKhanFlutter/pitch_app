import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/screens/screen_birthday.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:pitch_app/widgets/textfield_information.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;
class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final firestoreinstance = FirebaseFirestore.instance;

  void senddata() {
    firestoreinstance.collection("Pitchsomeone").doc(globals.userid).update({
      "firstname": firstnamecontroller.text,
      "lastname": lastnamecontroller.text,
      "location": locationcontroller.text,
      "email": emailcontroller.text,
    }).then((value) {
      Get.to(BirthdayScreen());
    });
  }

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
                        "What's his name?"
                            .text
                            .bold
                            .make()
                            .box
                            .height(60)
                            .make(),
                        TextFieldInformation(
                          controller: firstnamecontroller,
                          title: "First Name:",
                          height: 44,
                        ),
                        SizedBox(height: 16),
                        TextFieldInformation(
                          controller: lastnamecontroller,
                          title: "Last Name:",
                          height: 44,
                        ),
                        SizedBox(height: 16),
                        "Where does he live?".text.bold.make(),
                        TextFieldInformation(
                          controller: locationcontroller,
                          title: "",
                          height: 44,
                        ),
                        SizedBox(height: 24),
                        "What's his email address?".text.bold.make(),
                        // SizedBox(height: 4),
                        TextFieldInformation(
                            title: "", height: 44, controller: emailcontroller)
                        // Container(
                        //   height: 44,
                        //   child: TextFormField(
                        //     decoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: Colors.grey.shade200,
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide:
                        //               BorderSide(color: Colors.grey.shade200),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //                 color:
                        //                     Theme.of(context).primaryColor))),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: StretchedButton(
                      text: "Save",
                      onPressed: () {
                        senddata();
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

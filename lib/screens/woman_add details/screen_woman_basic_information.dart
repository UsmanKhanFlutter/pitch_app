import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/Model/gender.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_agreement.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_height.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_interest.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class WomanBasicInformationScreen extends StatefulWidget {
  @override
  _WomanBasicInformationScreenState createState() =>
      _WomanBasicInformationScreenState();
}

class _WomanBasicInformationScreenState
    extends State<WomanBasicInformationScreen> {
  DateTime _chosenDateTime;
  TextEditingController namecontroller = TextEditingController();

  TextEditingController birthdaycontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  CountryCode code;
  List<Gender> genders = [];

  @override
  void initState() {
    super.initState();
    globals.interestedIn = 'Man Interested in men';
    genders.add(new Gender(name: 'Man Interested in women', isSelected: false));
    genders.add(new Gender(name: 'Woman Interested in men', isSelected: false));
    genders.add(new Gender(name: 'Man Interested in men', isSelected: true));
    genders
        .add(new Gender(name: 'Woman Interested in women', isSelected: false));
  }

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(1969, 1, 1),
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() {
                            _chosenDateTime = newDateTime;
                            print(_chosenDateTime);
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  void senddata() {
    firestoreInstance.collection("womenbasicinfo").doc(globals.userid).set({
      "name": namecontroller.text,
      "iam": globals.interestedIn,
      "birthday": birthdaycontroller.text,
      "email": emailcontroller.text,
      "phonenumber": code.toString() + phonecontroller.text,
    }).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WomanInterestScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                "Basic Information"
                    .text
                    .xl
                    .fontWeight(FontWeight.bold)
                    .make()
                    .box
                    .alignTopCenter
                    .height(ConfigSize.convertHeight(context, 50))
                    .make(),

                label("First Name"),
                infoTextField(
                    hintText: '',
                    controller: namecontroller,
                    icon: Icon(
                      Icons.near_me,
                      color: grayTextField,
                    )),
                // RoundedTextField(),
                SizedBox(
                  height: ConfigSize.blockSizeVertical * 1,
                ),

                label("I am a:"),
                // RoundedTextField(
                //   hint: globals.interestedIn,
                // ),
                infoTextField(
                    hintText: globals.interestedIn,
                    icon: Icon(
                      Icons.near_me,
                      color: grayTextField,
                    )),
                SizedBox(
                  height: ConfigSize.blockSizeVertical * 1,
                ),

                label('Birthday:'),
                // RoundedTextField(hint: 'Date of Birth'),
                infoTextField(
                  hintText: 'Date of Birth',
                  controller: birthdaycontroller,
                  icon: Icon(Icons.date_range_outlined),
                  onclick: () => _showDatePicker(context),
                ),
                SizedBox(
                  height: ConfigSize.blockSizeVertical * 1,
                ),

                label("Email Address:"),
                // RoundedTextField(hint: 'name@email.com'),
                infoTextField(
                    hintText: 'name@email.com',
                    controller: emailcontroller,
                    icon: Icon(
                      Icons.near_me,
                      color: grayTextField,
                    )),
                SizedBox(
                  height: ConfigSize.blockSizeVertical * 2,
                ),
                label("Phone Number:"),
                Container(
                  //  height: ConfigSize.blockSizeVertical*6,
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: grayTextField,
                    elevation: 0,
                    child: HStack([
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: ConfigSize.blockSizeVertical * 6,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 2)),
                          ),
                          child: CountryCodePicker(
                            onChanged: (val) {
                              code = val;
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
                              height: ConfigSize.blockSizeVertical * 6,
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey, width: 2)),
                              ),
                              child: TextField(
                                controller: phonecontroller,
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
                  ),
                ),
                SizedBox(
                  height: ConfigSize.blockSizeVertical * 2,
                ),
                StretchedButton(
                  text: "Continue",
                  onPressed: () {
                    senddata();
                  },
                  height: 40,
                ),
                SizedBox(
                  height: ConfigSize.blockSizeVertical * 2,
                ),
                Container(
                  alignment: Alignment.center,
                  height: ConfigSize.blockSizeVertical * 17,
                  // width: ConfigSize.blockSizeHorizontal * 77,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: genders.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              genders.forEach(
                                  (gender) => gender.isSelected = false);
                              genders[index].isSelected = true;
                              globals.interestedIn = genders[index].name;

                              //print
                              print(globals.interestedIn);
                            });
                          },
                          child: InterestedInCard(genders[index]),
                        );
                      }),
                  // InterestedInSelector(),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget label(String text) {
  return text.text
      .align(TextAlign.left)
      .fontWeight(FontWeight.bold)
      .make()
      .box
      .alignTopLeft
      .make()
      .pSymmetric(h: 20, v: 3);
}

Widget infoTextField(
    {String hintText,
    TextEditingController controller,
    Icon icon,
    VoidCallback onclick}) {
  return Container(
    height: ConfigSize.blockSizeVertical * 5,
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: grayTextField,
      elevation: 0,
      child: TextField(
        controller: controller,
        minLines: 2,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12),
          // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          suffixIcon: InkWell(
            child: icon,
            onTap: onclick,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

class InterestedInCard extends StatelessWidget {
  Gender _gender;
  InterestedInCard(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: _gender.isSelected ? grayTextField : null,
      elevation: 0,
      child: Text(
        _gender.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: _gender.isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

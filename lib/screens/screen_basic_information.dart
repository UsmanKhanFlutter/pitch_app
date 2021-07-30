import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/Model/gender.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_agreement.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:date_format/date_format.dart';

class BasicInformationScreen extends StatefulWidget {
  @override
  _BasicInformationScreenState createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String currentuserid;
  String interestedIn;
  TextEditingController nameController = TextEditingController();

  TextEditingController birthdaycontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  CountryCode countrycode;
  DateTime _chosenDateTime;

  List<Gender> genders = [];
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  void senddata() {
    firestoreInstance.collection("basicinfo").doc(globals.userid).set({
      "name": nameController.text,
      "iam": interestedIn,
      "birthday": _chosenDateTime.toString() + birthdaycontroller.text,
      "email": emailcontroller.text,
      "phonenumber": countrycode.toString() + numbercontroller.text,
      "urlOfImage":
          "https://www.worldfuturecouncil.org/wp-content/uploads/2020/02/dummy-profile-pic-300x300-1.png",
      "userid": currentuserid,
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AgreementScreen()));
    });
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
                        initialDateTime: DateTime(1990, 1, 1),
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

  @override
  void initState() {
    super.initState();
    readLocalData();
    interestedIn = 'Man Interested in men';
    genders.add(new Gender(name: 'Man Interested in women', isSelected: false));
    genders.add(new Gender(name: 'Woman Interested in men', isSelected: false));
    genders.add(new Gender(name: 'Man Interested in men', isSelected: true));
    genders
        .add(new Gender(name: 'Woman Interested in women', isSelected: false));
    FirebaseMessaging.instance.getToken().then((value) => {});
  }

  readLocalData() async {
    SharedPreferences sharedUserData = await SharedPreferences.getInstance();
    setState(() {
      currentuserid = sharedUserData.getString("currentUserId");
    });
    print(currentuserid);
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      controller: nameController,
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
                      hintText: interestedIn,
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
                    hintText: (_chosenDateTime != null
                        ? formatDate(_chosenDateTime, [yyyy, '-', mm, '-', dd])
                        : 'No date time picked!'),
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
                                countrycode = val;
                                print(val);
                                print(countrycode.toString());
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
                                child: TextFormField(
                                  controller: numbercontroller,
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
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
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
                      if (nameController.text.isEmpty) {
                        return Fluttertoast.showToast(
                            msg: "please enter your name",
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 16.0);
                      }
                      if (interestedIn == null) {
                        return Fluttertoast.showToast(
                            msg: "please enter your interest",
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 16.0);
                      }
                      if (_chosenDateTime == null) {
                        return Fluttertoast.showToast(
                            msg: "please enter your birthday",
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 16.0);
                      }
                      if (emailcontroller.text.isEmpty) {
                        return Fluttertoast.showToast(
                            msg: "please enter your email",
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 16.0);
                      }
                      if (numbercontroller.text.isEmpty) {
                        return Fluttertoast.showToast(
                            msg: "please enter your number",
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 16.0);
                      } else {
                        senddata();
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AgreementScreen()));
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
                                interestedIn = genders[index].name;

                                //print
                                print(interestedIn);
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
          )),
    );
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

Widget infoTextField({
  String hintText,
  TextEditingController controller,
  Icon icon,
  VoidCallback onclick,
}) {
  return Container(
    height: ConfigSize.blockSizeVertical * 5,
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: grayTextField,
      elevation: 0,
      child: TextFormField(
        controller: controller,
        minLines: 2,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12),
          // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: hintText,

          suffixIcon: InkWell(
            child: icon,
            onTap: onclick,
          ),
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

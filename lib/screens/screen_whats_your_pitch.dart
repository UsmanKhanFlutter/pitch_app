import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_bio.dart';
import 'package:pitch_app/screens/screen_grant_access.dart';
import 'package:pitch_app/screens/screen_upload_photos_of_your_guy_friend.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../colors.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class WhatsYourPitchScreen extends StatefulWidget {
  @override
  _WhatsYourPitchScreenState createState() => _WhatsYourPitchScreenState();
}

class _WhatsYourPitchScreenState extends State<WhatsYourPitchScreen> {
  List<String> suggestedTopics = [
    "Why you think he is great",
    "Energy level",
    "What he loves to do",
    "What to expect on a date with him",
    "His life style, Animal lover",
    "Desire to settle down",
    "Why you're not dating him",
    "What are some possible deal breakers",
    "What he does for living",
    "What type is he? Athletic, serious, academic,hippie, thrill. "
  ];

  TextEditingController scriptcontroller = TextEditingController();

  final firestoreinstance = FirebaseFirestore.instance;

  void senddata() {
    firestoreinstance.collection("Pitchsomeone").doc(globals.uSerIdd).update({
      "pitchscript": scriptcontroller.text,
    }).then((value) {
      Get.to(BioScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: VStack(
            [
              SizedBox(
                height: ConfigSize.blockSizeVertical * 5,
              ),
              "What’s Your Pitch?"
                  .text
                  .xl
                  .fontWeight(FontWeight.w400)
                  .make()
                  .box
                  .make()
                  .pSymmetric(h: 24, v: 16),
              "Make a pitch for your single guy friend, so other women can hear that how great he is! We suggest it to do from the heart,as if you are telling a girlfriend why she should date him and other issus that you know that other women should know about."
                  .text
                  .xs
                  .make()
                  .pSymmetric(h: 24, v: 16),
              "Suggested topics if you are getting difficulties to describe him:"
                  .text
                  .xs
                  .make()
                  .pSymmetric(h: 24, v: 1),
              Container(
                height: ConfigSize.blockSizeVertical * 30,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: ConfigSize.blockSizeVertical * 0,
                    );
                  },
                  itemCount: suggestedTopics.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: ConfigSize.blockSizeVertical * 3,
                      // color: yellow,
                      padding: new EdgeInsets.only(
                          left: ConfigSize.blockSizeHorizontal * 5),
                      child: ListTile(
                        dense: true,
                        leading: bullet(),
                        minLeadingWidth: ConfigSize.blockSizeHorizontal * 1,
                        title: suggestedTopics[index]
                            .text
                            .xs
                            .make()
                            .pSymmetric(h: 10, v: 1),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 2,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: ConfigSize.blockSizeHorizontal * 3,
                    right: ConfigSize.blockSizeHorizontal * 3),
                child: Card(
                  shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: grayborder)),
                  elevation: 0,
                  child: Scrollbar(
                    child: TextField(
                      controller: scriptcontroller,
                      minLines: 5,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Write something...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: "1500 Character Countdown"
                    .text
                    .xs
                    .make()
                    .pSymmetric(h: 24, v: 1),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 5,
              ),
              Center(
                child: StretchedColorButton(
                        text: "Save",
                        onPressed: () {
                          if (scriptcontroller.text.isEmpty) {
                            return Fluttertoast.showToast(
                                msg: "Please Write Your Script",
                                backgroundColor: Colors.white,
                                textColor: Colors.red,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                fontSize: 16.0);
                          } else {
                            senddata();
                          }
                        },
                        height: 36,
                        width: ConfigSize.convertWidth(context, 300),
                        color: AppColors.mainColor)
                    .pOnly(bottom: 16),
              )
            ],
          ),
        )));
  }

  Widget bullet() {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Vx.gray900,
        shape: BoxShape.circle,
      ),
    );
  }

  // "Why you think he is great"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "Energy level"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "What he loves to do"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "What to expct on a date with him"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "His life style, Animal lover"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "Desire to settle down"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "Why you're not dating him"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "What are some possible deal breakers"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "What he does for living"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  // "What type is he?"
  // .text
  //     .xs
  //     .make()
  //     .pSymmetric(h: 24, v: 1),

  Widget _textWithBullet(String title) {
    return Container(
      child: HStack([
        _bullet(),
        SizedBox(width: 16),
        "$title".text.size(13).make(),
      ]),
    ).pSymmetric(h: 36);
  }

  Widget _bullet() {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Vx.gray900,
        shape: BoxShape.circle,
      ),
    );
  }
}

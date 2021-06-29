import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_upload_photos.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WomanWriteYourPitchScreen extends StatefulWidget {
  @override
  _WomanWriteYourPitchScreenState createState() =>
      _WomanWriteYourPitchScreenState();
}

class _WomanWriteYourPitchScreenState extends State<WomanWriteYourPitchScreen> {
  List<String> suggestedTopics = [
    " Where you are from",
    " What activities do you like",
    " Why are you looking for in a relationship",
    " What do you do for a living?",
    " Why are you looking for in a guy?"
  ];
  TextEditingController pitchcontroller = TextEditingController();
  var firebaseUser = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  void senddata() {
    firestoreInstance.collection("womenbasicinfo").doc(userid).update({
      "yourpitch": pitchcontroller.text,
    }).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WomanUploadPhotosScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          child: SafeArea(
              child: VStack([
            SizedBox(
              height: ConfigSize.blockSizeVertical * 5,
            ),
            "what’s Your Pitch?"
                .text
                .xl
                .fontWeight(FontWeight.w400)
                .make()
                .box
                .make()
                .pSymmetric(h: 24, v: 16),
            "What should all the great guys know about you?So to get you started."
                .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 11),
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
                      leading: Icon(
                        Icons.horizontal_rule,
                        size: 10,
                      ),
                      minLeadingWidth: ConfigSize.blockSizeHorizontal * 3,
                      title: suggestedTopics[index].text.xs.make(),
                      // .pSymmetric(h: 10, v: 1),
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
                    controller: pitchcontroller,
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      hintText: '''Your Bio
                          \n I am an amazing catch because...''',
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
              height: ConfigSize.blockSizeVertical * 10,
            ),
            Center(
              child: StretchedColorButton(
                  text: "Save",
                  onPressed: () {
                    senddata();
                  },
                  height: 36,
                  width: ConfigSize.convertWidth(context, 300),
                  color: red),
            ),
          ])),
        ));
  }
}

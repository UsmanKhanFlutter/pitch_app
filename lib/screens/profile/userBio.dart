import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/screens/profile/screen_profile.dart';

class UserBioScreen extends StatefulWidget {
  String text;
  UserBioScreen(this.text);

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<UserBioScreen> {
  String bio;
  TextEditingController biocontroller;
  FirebaseFirestore instance = FirebaseFirestore.instance;

  void ftn() {
    instance.collection("basicinfo").doc(userid).update({
      "bio": bio,
    }).then((value) => {
          Get.off(ProfileScreen()),
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    biocontroller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    biocontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Bio"),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 200,
                width: 300,
                child: TextField(
                  controller: biocontroller,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8)),
                  onChanged: (val) {
                    bio = val;
                  },
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black))),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  ftn();
                },
                child: Center(
                  child: Text("Done"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

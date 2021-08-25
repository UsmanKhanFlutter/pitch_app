import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations_2.dart';
import 'package:pitch_app/screens/screen_upload_photos_of_your_guy_friend.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/dialog_bio_notification.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class BioScreen extends StatefulWidget {
  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  TextEditingController biocontroller = TextEditingController();
  final firestoreinstance = FirebaseFirestore.instance;

  void senddata() {
    firestoreinstance.collection("Pitchsomeone").doc(globals.uSerIdd).update({
      "bio": biocontroller.text,
    }).then((value) {
      Get.to(UploadPhotosScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CupertinoColors.white,
      appBar: mainAppBar(
          title: "What's your pitch?",
          onLeadingPressed: () {},
          onActionPressed: () => bioNotificationDialog(context)),
      body: VStack([
        SizedBox(height: ConfigSize.convertHeight(context, 80)),
        "Write Bio".text.bold.make().pOnly(left: 36),
        SizedBox(height: 8),
        Container(
          height: ConfigSize.convertHeight(context, 250),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              TextFormField(
                controller: biocontroller,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              StretchedColorButton(
                text: "Send",
                onPressed: () {
                  if (biocontroller.text.isEmpty) {
                    return Fluttertoast.showToast(
                        msg: "Please Write Bio",
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        fontSize: 16.0);
                  } else {
                    senddata();
                  }
                },
                color: Colors.cyan,
                height: 24,
                width: 50,
              ).pSymmetric(h: 16, v: 8)
            ],
          ),
        ),
      ]).pSymmetric(h: 20),
    );
  }
}

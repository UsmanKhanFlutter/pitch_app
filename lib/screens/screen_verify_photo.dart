import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';

import 'package:pitch_app/screens/screen_congratulations.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class VerifyPhotoScreen extends StatefulWidget {
  @override
  _VerifyPhotoScreenState createState() => _VerifyPhotoScreenState();
}

class _VerifyPhotoScreenState extends State<VerifyPhotoScreen> {
  String urlOfImage;

  final picker = ImagePicker();
  final firestoreInstance = FirebaseFirestore.instance;

  Future uploadImage() async {
    // var imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final imageFile = await picker.getImage(source: ImageSource.gallery);

    File croppedFile = await FlutterNativeImage.compressImage(imageFile.path,
        quality: 70, percentage: 70);

    String fileName = globals.userid;
    firebase_storage.Reference reference =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);
    firebase_storage.UploadTask uploadTask = reference.putFile(croppedFile);
    firebase_storage.TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => print('upload complete'));
    urlOfImage = await storageTaskSnapshot.ref.getDownloadURL();

    addUserImageToFirestore(urlOfImage: urlOfImage);

    // String id = await globals.functionUserId();
    // print("????????????????????????????????????????????????????");
    // print(id.toString());
  }

  Future<bool> addUserImageToFirestore({String urlOfImage}) async {
    //use firebase to store user information
    FirebaseFirestore.instance
        .collection('basicinfo')
        .doc(globals.userid)
        .update(
      {
        'urlOfImage': urlOfImage,
      },
    ).then((value) {
      Get.to(CongratulationsScreen());
      return true;
    });

    return true;
    //return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  [
                    Container(
                      height: ConfigSize.convertHeight(context, 90),
                      width: ConfigSize.convertWidth(context, 90),
                      child: Column(
                        children: [
                          Image.asset(Strings.appLogo),
                          "PitchMe".text.size(11).bold.make(),
                        ],
                      ),
                    ),
                    "Take a selfie for verification"
                        .text
                        .bold
                        .make()
                        .box
                        .height(ConfigSize.convertWidth(context, 60))
                        .alignCenter
                        .make(),
                    "This picture will only be used for verification purposes - it won't be shown to other Pitch Me users."
                        .text
                        .align(TextAlign.center)
                        .size(13)
                        .color(Colors.grey)
                        .make(),
                    SizedBox(height: 16),
                    "Tip: This picture will be compared to your profile photo to verify your identity, so avoid sunglasses, masks or other face coverings!"
                        .text
                        .size(13)
                        .align(TextAlign.center)
                        .color(Colors.grey)
                        .make(),
                    SizedBox(height: 16),
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          height: ConfigSize.convertHeight(context, 250),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        InkWell(
                          onTap: () {
                            uploadImage();
                          },
                          child: Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.lightGreen.shade400,
                            ),
                            child: Icon(
                              CupertinoIcons.camera_fill,
                              color: Colors.grey.shade200,
                            ),
                          ).pOnly(bottom: 8),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    "Please focus the camera on your face"
                        .text
                        .align(TextAlign.center)
                        .size(13)
                        .color(Colors.grey.shade700)
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedColorButton(
                  text: "Verify",
                  onPressed: () =>
                      context.push((context) => CongratulationsScreen()),
                  color: Colors.lightGreen.shade400)
            ],
          ),
        ),
      ),
    );
  }
}

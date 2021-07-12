import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations.dart';
import 'package:pitch_app/screens/screen_verify_photo.dart';
import 'package:pitch_app/widgets/stretched_bordered_button.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_picker/image_picker.dart';
import '../strings.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;
class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {

  
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
    FirebaseFirestore.instance.collection('basicinfo').doc(globals.userid).update(
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
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
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
                    "Upload your Profile Photo:"
                        .text
                        .bold
                        .make()
                        .box
                        .height(ConfigSize.convertWidth(context, 90))
                        .alignCenter
                        .make(),
                    "Tips:".text.bold.size(11).make(),
                    "Smile! You'll get more likes!\nThis photo will also be used to verify your identity, so avoid sunglasses, masks or other face coverings"
                        .text
                        .align(TextAlign.center)
                        .size(11)
                        .make(),
                    "[You can change your profile photo later]"
                        .text
                        .color(Colors.grey)
                        .size(11)
                        .make()
                        .box
                        .height(60)
                        .alignCenter
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).box.alignTopCenter.make(),
              ),
              StretchedButton(
                text: "Take a Selfie",
                onPressed: () => context.push((context) => VerifyPhotoScreen()),
                height: 40,
              ),
              SizedBox(height: 16),
              StretchedBorderedButton(
                  text: "Upload from Gallery",
                  onPressed: () {
                    uploadImage();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

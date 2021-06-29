import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations.dart';
import 'package:pitch_app/screens/screen_verify_photo.dart';
import 'package:pitch_app/widgets/stretched_bordered_button.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_picker/image_picker.dart';
import '../strings.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  String imageUrl;
  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    PickedFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _imagePicker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase

        var snapshot = await _firebaseStorage
            .ref()
            .child('images/imageName')
            .putFile(file)
            .whenComplete(() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CongratulationsScreen())));
        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Image Path Received');
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
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

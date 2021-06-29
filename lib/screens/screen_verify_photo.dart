import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pitch_app/helpers/size_config.dart';

import 'package:pitch_app/screens/screen_congratulations.dart';
import 'package:pitch_app/strings.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyPhotoScreen extends StatefulWidget {
  @override
  _VerifyPhotoScreenState createState() => _VerifyPhotoScreenState();
}

class _VerifyPhotoScreenState extends State<VerifyPhotoScreen> {
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
      image = await _imagePicker.getImage(source: ImageSource.camera);
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

import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations_2.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart' as Path;

class UploadPhotosScreen extends StatefulWidget {
  @override
  _UploadPhotosScreenState createState() => _UploadPhotosScreenState();
}

class _UploadPhotosScreenState extends State<UploadPhotosScreen> {
  bool uploading = false;
  double val = 0;
  CollectionReference imgRef;
  firebase_storage.Reference ref;
  bool isuploaded = false;

  List<File> _image = [];
  final picker = ImagePicker();
  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile?.path));
    });
    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;
    List<String> li = [];
    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('guyimages/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          li.add(value);
          if (_image.length < 2) {
            setState(() {
              isuploaded = false;
            });
            return Fluttertoast.showToast(
                msg: "Please Upload Minimum 2 pictures");
          } else {
            //
            i++;
            Get.off(CongratulationsTwoScreen());
          }
        });
      });
    }
    imgRef.doc(uSerIdd).set({'urls': li.toList()});
  }

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Navigation bar
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //App bar
            "Upload photos"
                .text
                .xl
                .fontWeight(FontWeight.bold)
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 30))
                .make(),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 2,
            ),
            'Upload photos of your guy friend.'
                .text
                .bold
                .make()
                .box
                .height(ConfigSize.convertWidth(context, 30))
                .alignCenter
                .make(),

            '(Minimum 2)'
                .text
                .bold
                .make()
                .box
                .height(ConfigSize.convertWidth(context, 30))
                .alignCenter
                .make(),

            SizedBox(
              height: ConfigSize.blockSizeVertical * 3,
            ),

            Container(
              height: ConfigSize.blockSizeVertical * 50,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: _image.length + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? UploadPhotoCard(() => !uploading ? chooseImage() : null)
                      : Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: grayUploadPhotoborder),
                              image: DecorationImage(
                                  image: FileImage(_image[index - 1]),
                                  fit: BoxFit.cover)),
                        );
                },
                shrinkWrap: true,

                // childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 5),
              ),
            ),
            isuploaded == true
                ? Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          child: Text(
                        'uploading...' "",
                        style: TextStyle(fontSize: 20),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ))
                : Container(),

            StretchedColorButton(
              color: red,
              text: 'Submit',
              width: ConfigSize.blockSizeHorizontal * 88,
              height: ConfigSize.blockSizeVertical * 6,
              onPressed: () {
                setState(() {
                  isuploaded = true;
                });
                uploadFile();
              },
            ),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 1,
            ),
          ]),
        ),
      ),
    );
  }
}

class UploadPhotoCard extends StatelessWidget {
  VoidCallback ontap;
  UploadPhotoCard(this.ontap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: ConfigSize.blockSizeVertical * 20,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: grayUploadPhotoborder)),
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              color: grayAddIcon,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoUploadedCard extends StatelessWidget {
  File image;
  PhotoUploadedCard({this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Image.asset(
          'assets/images/girl.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

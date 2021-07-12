import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/messaging/components/bottom_sheet_safety_toolkit.dart';
import 'package:pitch_app/screens/screen_settings.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_upload_photos.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isimage = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> titleList = [
    "Bio:",
    "Interested In:",
    "Email:",
    // "Hobbies/Interests:",
    // "Advance Settings",
  ];

  final List<String> subList = [
    "I am who I am, You will find out if we talk",
    "women",
    globals.email,
    // "Pets",
    // "Advance Settings",
  ];

  String urlOfImage;

  final picker = ImagePicker();

  final firestoreInstance = FirebaseFirestore.instance;

  Future getProfileImage() async {
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
      print("Saved the user Image to Firestore");
      return true;
    });

    return true;
    //return false;
  }

// getData()async{
//   SharedP
// }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(globals.userid);
    print('lllllllllllllllll');

    // getData();
  }

  // firebaseimage() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();

  //   imageurl = _prefs.getString("image");
  //   return imageurl;
  // }
  // readLocalData() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userid = _prefs.getString("uid");
  //     imageurl = _prefs.getString("image");
  //   });
  //   print(userid);
  // }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('basicinfo')
                .doc(globals.userid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);

                return VStack(
                  [
                    SizedBox(
                      height: ConfigSize.blockSizeVertical * 3,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  NetworkImage(snapshot.data["urlOfImage"])),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: new CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: new IconButton(
                                icon: Icon(Icons.edit,
                                    color: Colors.blueGrey.shade400),
                                onPressed: () {
                                  getProfileImage();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ConfigSize.blockSizeVertical * 1,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        snapshot.data["name"],
                        style: TextStyle(
                          color: Vx.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ConfigSize.blockSizeVertical * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            RawMaterialButton(
                              onPressed: () =>
                                  context.push((context) => SettingsScreen()),
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.settings,
                                  color: Colors.blueGrey.shade200),
                              shape: CircleBorder(),
                              fillColor: Colors.white,
                              elevation: 1.4,
                            ),
                            SizedBox(height: ConfigSize.blockSizeVertical * 1),
                            Text(
                              'SETTINGS',
                              style: TextStyle(
                                color: Vx.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                RawMaterialButton(
                                  onPressed: () => context.push(
                                      (context) => WomanUploadPhotosScreen()),
                                  padding: EdgeInsets.all(18),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 29,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Colors.red,
                                  elevation: 1.4,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: new CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: new IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.red,
                                          size: 16,
                                        ),
                                        onPressed: () {
                                          context.push((context) =>
                                              WomanUploadPhotosScreen());
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ConfigSize.blockSizeVertical * 1),
                            Text(
                              'ADD MEDIA',
                              style: TextStyle(
                                color: Vx.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                _scaffoldKey.currentState.showBottomSheet(
                                    (context) => SafetyToolkitBottomSheet(
                                          context.screenHeight * 0.4,
                                        ));
                              },
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.security,
                                color: Colors.blueGrey.shade200,
                              ),
                              shape: CircleBorder(),
                              fillColor: Colors.white,
                              elevation: 1.4,
                            ),
                            SizedBox(height: ConfigSize.blockSizeVertical * 1),
                            Text(
                              'SAFETY',
                              style: TextStyle(
                                color: Vx.black,
                                fontSize: 11.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConfigSize.blockSizeVertical * 2,
                    ),
                    Container(
                      height: 2,
                      child: Divider(
                        indent: 24,
                        color: Colors.grey.shade300,
                        endIndent: 24,
                      ),
                    ),
                    SizedBox(
                      height: ConfigSize.blockSizeVertical * 4,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bio",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(child: Icon(Icons.edit))
                              ],
                            ),
                            SizedBox(height: 7),
                            Text("Your Bio"),
                            Divider(),
                            Text(
                              "Interested In",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 7),
                            Text(snapshot.data["iam"]),
                            Divider(),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 7),
                            Text(snapshot.data["email"]),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}

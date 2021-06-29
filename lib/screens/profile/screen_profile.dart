import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/catalog/screen_catalog.dart';
import 'package:pitch_app/screens/messaging/components/bottom_sheet_safety_toolkit.dart';
import 'package:pitch_app/screens/screen_settings.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_upload_photos.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
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
    email,
    // "Pets",
    // "Advance Settings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: VStack(
          [
            SizedBox(
              height: ConfigSize.blockSizeVertical * 3,
            ),
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                      radius: 80, backgroundImage: NetworkImage(imageurl)),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: new CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: new IconButton(
                        icon: Icon(Icons.edit, color: Colors.blueGrey.shade400),
                        onPressed: () {
                          print('Add Photo');
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
                name,
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
                      child:
                          Icon(Icons.settings, color: Colors.blueGrey.shade200),
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
                          onPressed: () => context
                              .push((context) => WomanUploadPhotosScreen()),
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
                                  context.push(
                                      (context) => WomanUploadPhotosScreen());
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
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) {
                  // if (index == 4) {
                  //   return Padding(
                  //     padding:
                  //         const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                  //     child: Container(
                  //       height: 50,
                  //       alignment: Alignment.center,
                  //       child: ListTile(
                  //         title: "Advance Settings".text.make(),
                  //         trailing: IconButton(
                  //             icon: Icon(
                  //               CupertinoIcons.back,
                  //               color: Colors.black,
                  //             ),
                  //             onPressed: () =>
                  //                 _scaffoldKey.currentState.showBottomSheet(
                  //                   (context) => ProfileBottomSheet(
                  //                     context.screenHeight * 0.7,
                  //                   ),
                  //                 )
                  //             // profileBottomSheet(context, context.screenHeight),
                  //             ),
                  //       ),
                  //     ),
                  //   );
                  // }
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(titleList[index]),
                        subtitle: '${subList[index]}'
                            .text
                            .color(Colors.grey.shade400)
                            .make(),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 2,
                    child: Divider(
                      indent: 24,
                      color: Colors.grey.shade300,
                      endIndent: 24,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_phone_number.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../update_pitch.dart';

class YourPitchesScreen extends StatefulWidget {
  @override
  _YourPitchesScreenState createState() => _YourPitchesScreenState();
}

class _YourPitchesScreenState extends State<YourPitchesScreen> {
  int _radioValue;
  String _view;
  bool isgirl = false;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _view = 'first';
          print('first');
          break;
        case 1:
          _view = 'second';
          print('second');
          break;
      }
    });
  }

  FirebaseFirestore instance = FirebaseFirestore.instance;

  String iam;
  String userID;
  String firstname;
  String lastname;
  String image = "";
  bool isempty = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('lllllllllllllllll');
    readLocalData();
    // instance
    //     .collection("basicinfo")
    //     .where(
    //       "iam",
    //       isEqualTo: 'Woman Interested in men',
    //     )
    //     .get()
    //     .then((value) => {
    //           setState(() {
    //             isgirl = true;
    //           }),
    //         });

    // print(iam);
    // getData();
  }

  readLocalData() async {
    SharedPreferences sharedUserData = await SharedPreferences.getInstance();
    setState(() {
      userID = sharedUserData.getString("currentUserId");
    });
    print(userID);
    instance.collection("basicinfo").doc(userID).get().then((value) => {
          print(value.data()['iam']),
          print('kkkkkkkkkkkkkkkkkkkk'),
          if (value.data()['iam'] == 'Man Interested in women' ||
              value.data()['iam'] == 'Man Interested in men')
            {
              setState(() {
                isgirl = false;
              }),
            }
          else // if(value.data()['iam'] == 'Woman Interested in men' || value.data()['iam'] == 'Woman Interested in women')
            {
              setState(() {
                isgirl = true;
              })
            }
        });
    instance.collection("Pitchsomeone").doc(userID).get().then((value) => {
          setState(() {
            firstname = value.data()["firstname"].toString();
            lastname = value.data()["lastname"].toString();
            isempty = false;
          })
        });

    instance.collection("imageURLs").doc(userID).get().then((value) => {
          {
            setState(() {
              image = value.data()["urls"][0].toString();
              isempty = false;
              print(value.data()["urls"][0]);
            })
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigation(),
        body: SafeArea(
          child: VStack(
            [
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),
              "Your Pitches"
                  .text
                  .xl
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  .alignTopCenter
                  .height(ConfigSize.convertHeight(context, 30))
                  .make(),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),
              isgirl == true
                  ? Column(
                      children: [
                        "Girl View"
                            .text
                            .align(TextAlign.left)
                            .fontWeight(FontWeight.bold)
                            .make()
                            .box
                            .alignTopLeft
                            .make()
                            .pSymmetric(h: 24, v: 11),
                        Container(
                          height: ConfigSize.blockSizeVertical * 31,
                          padding: EdgeInsets.only(
                              left: ConfigSize.blockSizeHorizontal * 4,
                              right: ConfigSize.blockSizeHorizontal * 4,
                              bottom: ConfigSize.blockSizeVertical * 1),
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      isempty
                                          ? Container()
                                          : buildProfileViewCard(
                                              name: firstname,
                                              imageurl: image,
                                              lastname: lastname),
                                      isempty
                                          ? Container()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                isempty
                                                    ? Container()
                                                    : InkWell(
                                                        onTap: () {
                                                          Get.to(UpdatePitch());
                                                        },
                                                        child: Row(
                                                          children: [
                                                            'Edit'
                                                                .text
                                                                .xl
                                                                .color(
                                                                    lightBlue)
                                                                .align(TextAlign
                                                                    .right)
                                                                .underline
                                                                .make()
                                                                .box
                                                                .make()
                                                                .pSymmetric(
                                                                    h: 11,
                                                                    v: 11),
                                                          ],
                                                        ),
                                                      ),
                                                index == 0
                                                    ? Icon(
                                                        Icons.circle,
                                                        size: 30,
                                                        color: AppColors
                                                            .lightGreen,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        size: 30,
                                                        color: Colors.grey,
                                                      )
                                              ],
                                            ),
                                    ]),
                              ); // GirlViewListItem(),
                            },
                          ),
                        ),
                        Center(
                          child: StretchedColorButton(
                              text: "Pitch another friend",
                              onPressed: () {
                                Get.to(PhoneNumberScreen());
                              },
                              height: 36,
                              width: ConfigSize.convertWidth(context, 300),
                              color: red),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        "Guy View"
                            .text
                            .align(TextAlign.left)
                            .fontWeight(FontWeight.bold)
                            .make()
                            .box
                            .alignTopLeft
                            .make()
                            .pSymmetric(h: 24, v: 11),
                        Container(
                          height: ConfigSize.blockSizeVertical * 31,
                          padding: EdgeInsets.only(
                              left: ConfigSize.blockSizeHorizontal * 4,
                              right: ConfigSize.blockSizeHorizontal * 4,
                              bottom: ConfigSize.blockSizeVertical * 1),
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  // GuyViewListItem(),
                                ],
                              );
                            },
                          ),
                        ),
                        Center(
                          child: StretchedColorButton(
                              text: "Ask another friend to pitch you",
                              onPressed: () {
                                // context.push((context) => InviteAnotherFriendToPitchScreen());
                              },
                              height: 36,
                              width: ConfigSize.convertWidth(context, 300),
                              color: red),
                        ),
                      ],
                    )
            ],
            alignment: MainAxisAlignment.center,
          ),
        ));
  }
}

// class GirlViewListItem extends StatelessWidget {
//   GirlViewListItem({int radioValue});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children:[
//           buildProfileViewCard(name: 'Fred Jones'),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               'Edit'
//               .text
//               .align(TextAlign.right)
//               .underline
//               .make()
//               .box
//               .make(),
//               Radio(
//                 value: radioValue,
//                 groupValue: _groupValue,
//                 onChanged: _handleRadioValueChange1,
//               ),
//             ],
//           ),
//         ]
//       ),
//     );
//   }
// }

class GuyViewListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileViewCard(
              name: 'Mary Janes',
              imageurl:
                  'https://www.worldfuturecouncil.org/wp-content/uploads/2020/02/dummy-profile-pic-300x300-1.png',
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: red,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'View',
                      style: TextStyle(color: Vx.white),
                    ))),
          ]),
    );
  }
}

Widget buildProfileViewCard({String name, String lastname, String imageurl}) {
  return Stack(children: <Widget>[
    //Card with a blurred background image
    Container(
      height: ConfigSize.blockSizeVertical * 15,
      width: ConfigSize.blockSizeVertical * 14,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: 4.0,
          child: Image.network(
            imageurl,
            fit: BoxFit.fill,
          )),
    ),

    //position the container(name and age) over the card.
    Positioned(
      bottom: ConfigSize.blockSizeVertical * 1,
      left: ConfigSize.blockSizeHorizontal * 1,
      right: ConfigSize.blockSizeHorizontal * 1,
      child: Container(
        // width: SizeConfig.blockSizeHorizontal*10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          // color: mateGray,
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              name ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              lastname ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    ),
  ]);
}

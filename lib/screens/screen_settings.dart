import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/location.dart';
import 'package:pitch_app/screens/screen_get_started.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String number;
  String email;
  var facebookLogin = FacebookLogin();

  FirebaseFirestore instance = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _user = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  void clearingPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear().then((value) => {Get.off(GetStartedScreen())});
  }

  Future<void> fbsignOut() async {
    await facebookLogin.logOut();
    await _auth.signOut();
    _user = null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    instance.collection("basicinfo").doc(uSerIdd).get().then((value) => {
          setState(() {
            number = value.data()["phonenumber"];
            email = value.data()["email"];
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F2F7),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //____________APP BAR______________//
            settingAppBar(),

            //___________Text Area Container_____//
            textAreaContainer(),

            SizedBox(height: ConfigSize.blockSizeVertical * 2),

            label(text: 'ACCOUNT SETTINGS'),
            // SizedBox(height: ConfigSize.blockSizeVertical*2),
            settingContainer(label: 'Phone number', details: '$number'),
            // SizedBox(height: ConfigSize.blockSizeVertical*1),
            settingContainer(label: 'Connected Accounts', details: ''),
            // SizedBox(height: ConfigSize.blockSizeVertical*1),
            settingContainer(label: 'Email', details: '$email'),
            SizedBox(height: ConfigSize.blockSizeVertical * 5),
            settingContainer(
                label: 'Location',
                details: 'My Current Location',
                onpress: () {
                  Get.to(MyCurrentLocation());
                }),
            // SizedBox(height: ConfigSize.blockSizeVertical*3),
            DistanceContainer(
              labelText: 'Maximum Distance',
              isAge: false,
            ),
            showMeContainer(interestedIn: 'Women'),
            DistanceContainer(
              labelText: 'Age Range',
              isAge: true,
            ),
            textAreaContainer(),
            ShowMeOnPitchContainer(label: "Show Me on Pitch"),
            SizedBox(height: ConfigSize.blockSizeVertical * 5),
            textAreaContainer(),
            SizedBox(height: ConfigSize.blockSizeVertical * 3),
            settingContainer(
                label: 'Manage Read Receipts', details: 'Settings'),
            textAreaContainer(),
            label(text: 'NOTIFICATIONS'),
            // SizedBox(height: ConfigSize.blockSizeVertical*2),
            settingContainer(label: 'Email', details: ''),
            // SizedBox(height: ConfigSize.blockSizeVertical*1),
            settingContainer(label: 'Push Notification', details: ''),
            textAreaContainer(),
            SizedBox(height: ConfigSize.blockSizeVertical * 3),

            sharePitchContainer(),

            label(text: 'CONTACT US'),
            settingContainer(label: 'Help and support', details: ''),

            label(text: 'COMMUNITY'),
            settingContainer(label: 'Community Guidelines', details: ''),
            settingContainer(label: 'Safety Center', details: ''),
            SizedBox(height: ConfigSize.blockSizeVertical * 3),
            label(text: 'PRIVACY POLICY'),
            settingContainer(label: 'Privacy Policy', details: ''),
            settingContainer(label: 'Terms of Service', details: ''),
            settingContainer(label: 'Licenses', details: ''),
            settingContainer(label: 'Privacy Preferences', details: ''),

            SizedBox(height: ConfigSize.blockSizeVertical * 3),
            texttContainer(
                text: 'Logout',
                onpress: () {
                  fbsignOut().whenComplete(() => {clearingPrefs()});
                  _signOut().whenComplete(() => {clearingPrefs()});
                }),
            SizedBox(height: ConfigSize.blockSizeVertical * 3),
            texttContainer(text: 'Delete Account'),
          ],
        ),
      )),
    );
  }
}

Widget settingAppBar() {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 20),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 1,
          child: "Settings"
              .text
              .bold
              .xl
              .make()
              .box
              .height(ConfigSize.blockSizeVertical * 6)
              .alignCenter
              .make(),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: "Done"
                .text
                .red600
                .xl
                .make()
                .box
                .height(ConfigSize.blockSizeVertical * 6)
                .alignCenterRight
                .make(),
          ),
        ),
      ],
    ),
  );
}

Widget label({String text}) {
  return Container(
    // height:ConfigSize.blockSizeVertical*3,
    padding: EdgeInsets.only(left: 10),
    child: text.text.normal.sm
        .color(Color(0xffBBBBBB))
        .make()
        .box
        .height(ConfigSize.blockSizeVertical * 3)
        .alignCenterLeft
        .make(),
  );
}

Widget settingContainer({String label, String details, VoidCallback onpress}) {
  return InkWell(
    onTap: onpress,
    child: Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label.text.bold.sm
                .make()
                .box
                .height(ConfigSize.blockSizeVertical * 3)
                .alignCenterLeft
                .make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                details.text
                    .color(Color(0xffBBBBBB))
                    .normal
                    .sm
                    .make()
                    .box
                    .height(ConfigSize.blockSizeVertical * 3)
                    .alignCenterLeft
                    .make(),
                SizedBox(
                  width: ConfigSize.blockSizeHorizontal * 2,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffBBBBBB),
                  size: 15,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class DistanceContainer extends StatefulWidget {
  String labelText;
  bool isAge;
  DistanceContainer({this.labelText, this.isAge});

  @override
  _DistanceContainerState createState() => _DistanceContainerState();
}

class _DistanceContainerState extends State<DistanceContainer> {
  double _myValue = 50;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            widget.labelText.text.bold.sm
                .make()
                .box
                .height(ConfigSize.blockSizeVertical * 3)
                .alignCenterLeft
                .make(),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Vx.red500,
                  inactiveTrackColor: Vx.blueGray200,
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: Vx.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: !widget.isAge
                    ? Slider(
                        value: _myValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        onChanged: (value) {
                          setState(() {
                            _myValue = value;
                          });
                        })
                    : RangeSlider(
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
                        divisions: 5,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      )),
          ],
        ),
      ),
    );
  }
}

Widget showMeContainer({String interestedIn}) {
  return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        'Show Me'
            .text
            .bold
            .sm
            .make()
            .box
            .height(ConfigSize.blockSizeVertical * 3)
            .alignCenterLeft
            .make(),
        interestedIn.text
            .color(Color(0xffBBBBBB))
            .normal
            .sm
            .make()
            .box
            .height(ConfigSize.blockSizeVertical * 3)
            .alignCenterLeft
            .make(),
      ]));
}

Widget textAreaContainer() {
  return Container(
    padding: EdgeInsets.only(left: 3, right: 3),
    child: Card(
      shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Color(0xffBBBBBB))),
      elevation: 0,
      child: Scrollbar(
        child: TextField(
          onChanged: (value) {
            //Do something with the user input.
          },
          minLines: 5,
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: ConfigSize.blockSizeVertical * 3, horizontal: 7.0),
            hintText: '',
            hintStyle: TextStyle(
              fontSize: 12,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}

class ShowMeOnPitchContainer extends StatefulWidget {
  String label;
  ShowMeOnPitchContainer({this.label});

  @override
  _ShowMeOnPitchContainerState createState() => _ShowMeOnPitchContainerState();
}

class _ShowMeOnPitchContainerState extends State<ShowMeOnPitchContainer> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.label.text.normal.sm
                .make()
                .box
                .height(ConfigSize.blockSizeVertical * 3)
                .alignCenterLeft
                .make(),
            Switch(
              activeColor: red,
              inactiveTrackColor: viewGrayBorder,
              inactiveThumbColor: viewGrayBorder,
              value: switchValue,
              onChanged: (bool newValue) {
                setState(() {
                  switchValue = newValue;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

sharePitchContainer() {
  return Card(
      child: Container(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    child: 'Share Pitch'
        .text
        .bold
        .lg
        .make()
        .box
        .height(ConfigSize.blockSizeVertical * 3)
        .alignCenter
        .make(),
  ));
}

texttContainer({String text, VoidCallback onpress}) {
  return InkWell(
    onTap: onpress,
    child: Card(
        child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: text.text.normal.sm
          .make()
          .box
          .height(ConfigSize.blockSizeVertical * 3)
          .alignCenter
          .make(),
    )),
  );
}

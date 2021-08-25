import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_phone_number.dart';
import 'package:pitch_app/screens/screen_your_pitches.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_basic_information.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  pushMessagingToken() async {
    print(uSerIdd);
    FirebaseMessaging.instance.getToken().then((token) {
      print(token);
      FirebaseFirestore.instance.collection('basicinfo').doc(uSerIdd).set(
        {'userToken': token},
      ).then((value) {
        print("user token saved........");
      });
    });
  }

  void configLocalNotification() {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/logo');
    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void registerNotification() {
    print('requesting permission');
    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage: $message');
      if (message.notification != null) {
        showNotification(message.notification);
      }
      return;
    });

    FirebaseMessaging.instance.getToken().then((token) {
      print('token: $token');
      FirebaseFirestore.instance
          .collection('basicinfo')
          .doc(uSerIdd)
          .update({'pushToken': token});
    }).catchError((err) {
      showErrorToastMessage(msg: err.message.toString());
    });
  }

  void showNotification(RemoteNotification remoteNotification) async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'com.imwasil.pitch_app',
      'PitchApp',
      'your channel description',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    print(remoteNotification);

    await flutterLocalNotificationsPlugin.show(
      0,
      remoteNotification.title,
      remoteNotification.body,
      platformChannelSpecifics,
      payload: null,
    );
  }

  FirebaseFirestore instance = FirebaseFirestore.instance;
  bool isgirl = false;
  readLocalData() async {
    SharedPreferences sharedUserData = await SharedPreferences.getInstance();
    setState(() {
      uSerIdd = sharedUserData.getString("currentUserId");
    });
    print(uSerIdd);
    instance.collection("basicinfo").doc(uSerIdd).get().then((value) => {
          print(value.data()['iam']),
          print('kkkkkkkkkkkkkkkkkkkk'),
          if (value.data()['iam'] == 'Man Interested in women' ||
              value.data()['iam'] == 'Man Interested in man')
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
  }

  Future showErrorToastMessage({String msg}) {
    return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
        msg: msg);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    configLocalNotification();
    registerNotification();
    readLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: VStack(
          [
            "Getting Started"
                .text
                .xl
                .fontWeight(FontWeight.w400)
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 50))
                .make(),
            "What would you like to do today?"
                .text
                .xl
                .make()
                .pSymmetric(h: 24, v: 16),
            Expanded(
              // flex: 2,
              child: VxBox(
                child: VxBox(
                        child: VStack(
                  [
                    isgirl
                        ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                alignment: Alignment.topLeft,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      "assets/images/girl.png",
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(height: 16),
                              StretchedColorButton(
                                  text: "Pitch Someone",
                                  onPressed: () {
                                    context
                                        .push((context) => PhoneNumberScreen());
                                  },
                                  height: 36,
                                  width: ConfigSize.convertWidth(context, 250),
                                  color: AppColors.lightGreen),
                              MaterialButton(
                                onPressed: () {
                                  context
                                      .push((context) => YourPitchesScreen());
                                },
                                child: "Edit your pitches"
                                    .text
                                    .gray500
                                    .underline
                                    .make(),
                              ),
                              "OR"
                                  .text
                                  .xl
                                  .gray700
                                  .bold
                                  .align(TextAlign.center)
                                  .make(),
                            ],
                          )
                        : SizedBox(height: 16),
                    StretchedColorButton(
                      text: "Find a match",
                      height: 36,
                      width: ConfigSize.convertWidth(context, 250),
                      onPressed: () {
                        context.push((context) =>
                            WomanBasicInformationScreen()); //FindAMatchScreen
                      },
                      color: AppColors.mainColor,
                    ),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).pSymmetric(h: 24, v: 16))
                    .height(ConfigSize.convertHeight(context, 350))
                    .width(double.infinity)
                    .rounded
                    .alignCenter
                    .shadow2xl
                    .white
                    .make()
                    .pSymmetric(h: 24, v: 16),
              ).alignCenter.make(),
            )
          ],
          crossAlignment: CrossAxisAlignment.start,
        ).box.make().pSymmetric(v: 16, h: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pitch_app/screens/catalog/screen_catalog.dart';
import 'package:pitch_app/screens/screen_about_you.dart';
import 'package:pitch_app/screens/screen_agree_continue.dart';
import 'package:pitch_app/screens/screen_bio.dart';
import 'package:pitch_app/screens/screen_information.dart';
import 'package:pitch_app/screens/screen_modify_pitch.dart';
import 'package:pitch_app/screens/screen_notification.dart';
import 'package:pitch_app/screens/screen_pitch_you.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: AgreeContinueScreen(),
    );
  }
}

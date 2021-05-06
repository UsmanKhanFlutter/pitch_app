import 'package:flutter/material.dart';
import 'package:pitch_app/screens/screen_catalog.dart';
import 'package:pitch_app/screens/screen_get_started.dart';
import 'package:pitch_app/screens/screen_information.dart';
import 'package:pitch_app/screens/screen_main.dart';
import 'package:pitch_app/screens/profile/screen_profile.dart';
import 'package:pitch_app/widgets/profile_image.dart';

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
      home: GetStartedScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pitch_app/screens/catalog/screen_catalog.dart';
import 'package:pitch_app/screens/screen_dashboard.dart';
import 'package:pitch_app/screens/screen_get_started.dart';
import 'package:pitch_app/screens/screen_gift.dart';
import 'package:pitch_app/screens/screen_height.dart';
import 'package:pitch_app/screens/screen_photos_wordfile.dart';
import 'package:pitch_app/screens/screen_pitch_mail.dart';

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
      home: PitchMailScreen(),
    );
  }
}

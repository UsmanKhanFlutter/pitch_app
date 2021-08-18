import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/screens/screen_basic_information.dart';
import 'package:pitch_app/screens/screen_get_started.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: GetStartedScreen(),
      // home: MessagingScreen(),
    );
  }
}

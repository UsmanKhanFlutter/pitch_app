import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_welcome_to_pitch.dart';
import 'package:pitch_app/widgets/app_bar_back_security.dart';
import 'package:velocity_x/velocity_x.dart';

class EmailSentScreen extends StatefulWidget {
  @override
  _EmailSentScreenState createState() => _EmailSentScreenState();
}

class _EmailSentScreenState extends State<EmailSentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //     child: Text(
                //   'added extra',
                //   style: TextStyle(fontSize: 20),
                // )),
                // SizedBox(height: ConfigSize.blockSizeVertical * 8),
                Container(
                  width: ConfigSize.blockSizeHorizontal * 80,
                  height: ConfigSize.blockSizeVertical * 33,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Your Email has been Sent!',
                              style: TextStyle(
                                  color: Vx.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.done,
                                color: lightBlue,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.push((context) => WelcomeToPitchScreen());
                        },
                        child: Container(
                          width: ConfigSize.blockSizeHorizontal * 55,
                          height: ConfigSize.blockSizeVertical * 4.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Vx.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0,
                                blurRadius: 10,
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Ok',
                            style: TextStyle(color: lightBlue, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

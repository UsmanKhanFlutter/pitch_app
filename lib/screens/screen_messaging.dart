import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_upload_photos.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../colors.dart';

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // Navigation bar
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //App bar
            CustomAppBar(titletext: 'Message'),

            SizedBox(
              height: ConfigSize.blockSizeVertical * 2,
            ),

            Container(
              height: ConfigSize.blockSizeVertical * 57,
              width: ConfigSize.blockSizeHorizontal * 80,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      recievedMessageContainer(message: 'Hi! How are you??'),
                      sentMessageContainer(message: 'I am good. Whats up??'),
                      recievedMessageContainer(
                          message:
                              'Not much just bored. Wondering if we can hang out somewhere?'),
                      sentMessageContainer(
                          message: 'Sounds fun! Where and when? '),
                    ],
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: ConfigSize.blockSizeVertical*2,
            // ),
            textArea(),
            Container(
              child: sendButton(),
              alignment: Alignment.topRight,
            ),
          ]),
        ),
      ),
    );
  }
}

Widget textArea() {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        side: BorderSide(color: grayborder)),
    elevation: 0,
    child: Scrollbar(
      child: TextField(
        onChanged: (value) {
          //Do something with the user input.
        },
        minLines: 2,
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        decoration: InputDecoration(
          // suffix: SendButton(),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: 'Write something...',
          hintStyle: TextStyle(
            fontSize: 12,
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget recievedMessageContainer({String message}) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
          backgroundColor: Vx.white,
          radius: 20.0,
          backgroundImage: AssetImage(
            'assets/images/girl.png',
          )),
      Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: lightGray)),
        color: lightGray,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          alignment: Alignment.centerLeft,
          height: 40,
          width: ConfigSize.blockSizeHorizontal * 50,
          child: Text(
            message,
            style: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 12,
              color: black,
            ),
          ),
        ),
      ),
    ],
  ));
}

Widget sentMessageContainer({String message}) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Card(
        color: red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: grayborder)),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          alignment: Alignment.centerLeft,
          // height: 40,
          child: Text(
            message,
            style: TextStyle(
                color: Vx.white, fontSize: 12, fontFamily: defaultFontFamily),
          ),
        ),
      ),
      CircleAvatar(
          backgroundColor: Vx.white,
          radius: 20.0,
          backgroundImage: AssetImage(
            'assets/images/girl.png',
          )),
    ],
  ));
}

Widget sendButton() {
  return Container(
      width: ConfigSize.blockSizeHorizontal * 23,
      height: ConfigSize.blockSizeVertical * 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: AppColors.lightGreen),
      child: Builder(builder: (BuildContext context) {
        return MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0))),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Send',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: defaultFontFamily,
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            onPressed: () {
              context.push((context) => UploadPhotosScreen());
            });
      }));
}

class SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ConfigSize.blockSizeHorizontal * 16,
        height: ConfigSize.blockSizeVertical * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: AppColors.lightGreen),
        child: Builder(builder: (BuildContext context) {
          return MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(90.0))),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Send',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: defaultFontFamily,
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onPressed: () {
                context.push((context) => UploadPhotosScreen());
              });
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/messaging/components/bottom_sheet_safety_toolkit.dart';
import 'package:pitch_app/screens/screen_upload_photos.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ConfigSize configSize = ConfigSize();
  @override
  Widget build(BuildContext context) {
    configSize.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "Message".text.fontWeight(FontWeight.w400).black.make(),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                _scaffoldKey.currentState.showBottomSheet(
                  (context) => SafetyToolkitBottomSheet(
                    context.screenHeight * 0.4,
                  ),
                );
              })
        ],
      ),

      // Navigation bar
      // bottomNavigationBar: BottomNavigation(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //App bar

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
          MessageTextArea(),
        ]),
      ),
    );
  }
}

class MessageTextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        side: BorderSide(color: grayborder),
      ),
      elevation: 0,
      child: Scrollbar(
        child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
          Container(
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              minLines: 2,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              decoration: InputDecoration(
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
          StretchedColorButton(
            text: "Send",
            color: AppColors.lightGreen,
            width: ConfigSize.blockSizeHorizontal * 15,
            height: ConfigSize.blockSizeVertical * 4,
            onPressed: () {
              context.push((context) => UploadPhotosScreen());
            },
          ).pSymmetric(h: 16, v: 8),
        ]),
      ),
    );
  }
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
          // side: BorderSide(color: lightGray),
        ),
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
          // side: BorderSide(color: grayborder),
        ),
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

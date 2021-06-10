import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations_2.dart';
import 'package:pitch_app/screens/screen_find_a_match.dart';
import 'package:pitch_app/screens/screen_grant_access.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_grant_access.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WomanUploadPhotosScreen extends StatefulWidget {
  @override
  _WomanUploadPhotosScreenState createState() => _WomanUploadPhotosScreenState();
}

class _WomanUploadPhotosScreenState extends State<WomanUploadPhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Navigation bar
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //App bar
            "Upload photos"
                .text
                .xl
                .fontWeight(FontWeight.bold)
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 30))
                .make(),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 2,
            ),
            'Upload photos of you.'
                .text
                .bold
                .make()
                .box
                .height(ConfigSize.convertWidth(context, 30))
                .alignCenter
                .make(),

            '(Minimum 2)'
                .text
                .bold
                .make()
                .box
                .height(ConfigSize.convertWidth(context, 30))
                .alignCenter
                .make(),

            SizedBox(
              height: ConfigSize.blockSizeVertical * 3,
            ),

            Container(
              height: ConfigSize.blockSizeVertical * 50,
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 29,
                // childAspectRatio: MediaQuery.of(context).size.width /(MediaQuery.of(context).size.height / 5),
                scrollDirection: Axis.vertical,
                children: List.generate(
                  6,
                  (index) {
                    if (index == 0 || index == 1)
                      return PhotoUploadedCard();
                    else
                      return UploadPhotoCard();
                  },
                ),
              ),
            ),

            StretchedColorButton(
              color: red,
              text: 'Submit',
              width: ConfigSize.blockSizeHorizontal * 88,
              height: ConfigSize.blockSizeVertical * 6,
              onPressed: () {
                context.push((context) => FindAMatchScreen());
              },
            ),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 1,
            ),
          ]),
        ),
      ),
    );
  }
}

class UploadPhotoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push((context) => WomanGrantAccessScreen());
      },
      child: Container(
        height: ConfigSize.blockSizeVertical * 20,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: grayUploadPhotoborder)),
          child: Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              color: grayAddIcon,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoUploadedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Image.asset(
          'assets/images/girl.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

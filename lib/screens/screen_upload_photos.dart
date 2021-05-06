import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';

import 'package:velocity_x/velocity_x.dart';

class UploadPhotosScreen extends StatefulWidget {
  @override
  _UploadPhotosScreenState createState() => _UploadPhotosScreenState();
}

class _UploadPhotosScreenState extends State<UploadPhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      // Navigation bar
      bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left:20,top:10,right:20),
            child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
              children: [
                //App bar
                CustomAppBar(titletext:'Upload photos'),

                SizedBox(
                  height: ConfigSize.blockSizeVertical*2,
                ),
                'Upload photos of your guy friend.'
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
                    height: ConfigSize.blockSizeVertical*3,
                  ),

                  Container(
                    height: ConfigSize.blockSizeVertical*47,
                    width: ConfigSize.blockSizeHorizontal*80,
                    // child: GridView.builder(
                    //   itemCount: 6,
                    //   itemBuilder: (context, index) {
                    //     return Text('upload');
                    //   },
                    //   ),
                    ),
                  SizedBox(
                    height: ConfigSize.blockSizeVertical*3,
                  ),
                  StretchedColorButton(
                    color: red, 
                    text:'Submit', 
                    width: ConfigSize.blockSizeHorizontal*88,
                    height:ConfigSize.blockSizeVertical*6, 
                    onPressed:() {
                      // context.push((context) => EmailSentScreen());
                    },
                  ),
                  

                ]
              ),
            ),
          ),
    );
  }
}
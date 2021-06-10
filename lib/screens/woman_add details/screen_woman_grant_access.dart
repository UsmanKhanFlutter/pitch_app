import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_upload_photos_of_your_guy_friend.dart';
import 'package:pitch_app/screens/woman_add%20details/screen_woman_upload_photos.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WomanGrantAccessScreen extends StatefulWidget {
  @override
  _WomanGrantAccessScreenState createState() => _WomanGrantAccessScreenState();
}

class _WomanGrantAccessScreenState extends State<WomanGrantAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            SizedBox(
                height: ConfigSize.blockSizeVertical*1,
              ),
            "Grant Access"
              .text
              .xl
              .fontWeight(FontWeight.bold)
              .make()
              .box
              .alignTopCenter
              .height(ConfigSize.convertHeight(context, 30))
              .make(),
              
            // Container(
            //   height: 120,
            //   width: 120,
            //   decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.circular(60),
            //       border: Border.all(color: Colors.grey,)
            //       ),
            //   child: Center(
            //     child:Container(
            //       height: 63,
            //       width: 60,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade500,
            //         borderRadius: BorderRadius.circular(16),
            //         border: Border.all(color: Colors.grey, width: 2)
            //         ),
            //       child: Icon(
            //         Icons.camera_alt,
            //         color: black,
            //         size: 45,
            //       ),
            //     ),
            //   ),
            // ),
            // "In order to upload from your camera, Pitch Me needs access to your camera. Go to Settings to enable."
            //     .text
            //     .align(TextAlign.center)
            //     .make()
            //     .box
            //     .alignTopCenter
            //     .make()
            //     .pSymmetric(h: 24, v: 1),
            // SizedBox(
            //     height: ConfigSize.blockSizeVertical*3,
            //   ),
            // "Grant Access"
            //   .text
            //   .xl
            //   .fontWeight(FontWeight.bold)
            //   .make()
            //   .box
            //   .alignTopCenter
            //   .height(ConfigSize.convertHeight(context, 30))
            //   .make(),

              SizedBox(
                height: ConfigSize.blockSizeVertical*33,
              ),

              Container(
                height: ConfigSize.blockSizeVertical*5,
                width: ConfigSize.blockSizeHorizontal*78,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:'In order to upload from your Camera,',
                      style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12,
                        ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Pitch Me',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                      ),
                      TextSpan(
                          text: ' needs access to your camera. Go to Settings to enable.',
                      style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 12,
                        ),
                      )
                    ],

                  )  ,
                ),
              ),
                 
              SizedBox(
                height: ConfigSize.blockSizeVertical*35,
              ),
              Center(
                child: StretchedColorButton(
                text: "Go to Settings",
                onPressed: () {
                  context.push((context) => WomanUploadPhotosScreen());
                },
                height: 36,
                width: ConfigSize.convertWidth(context, 300),
                color: red),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical*1,
              ),
            ],
          )
      ));
  }
    
  }


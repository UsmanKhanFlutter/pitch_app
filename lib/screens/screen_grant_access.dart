import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_message_back_to_friend.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class GrantAccessScreen extends StatefulWidget {
  @override
  _GrantAccessScreenState createState() => _GrantAccessScreenState();
}

class _GrantAccessScreenState extends State<GrantAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: Colors.grey,)
                  ),
              child: Center(
                child:Container(
                  height: 63,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey, width: 2)
                    ),
                  child: Icon(
                    Icons.camera_alt,
                    color: black,
                    size: 45,
                  ),
                ),
              ),
            ),
            SizedBox(
                height: ConfigSize.blockSizeVertical*3,
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

              SizedBox(
                height: ConfigSize.blockSizeVertical*3,
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
                  context.push((context) => MessageBackToFriendScreen());
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

import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_grant_access.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class WhatsYourPitchScreen extends StatefulWidget {
  @override
  _WhatsYourPitchScreenState createState() => _WhatsYourPitchScreenState();
}

class _WhatsYourPitchScreenState extends State<WhatsYourPitchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: VStack(
          [
            "what’s your pitch?"
                .text
                .xl
                .fontWeight(FontWeight.w400)
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 50))
                .make(),
            "Make a pitch for your single guy friend, so other women can hear that how great he is! We suggest it to do from the heart,as if you are telling a girlfriend why she should date him and other issus that you know that other women should know about."
                .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 16),
                 "Suggested topics if you are getting difficulties to describe him:"
                .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
            
            "Why you think he is great"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "Energy level"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "What he love to do"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "What he love to do"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "What to expct on a date with him"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "His life style, Animal lover"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "Desired to settle down"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "What are some possible deal breaker"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
                
            "Why you are not dating him"
            .text
                .xs
                .make()
                .pSymmetric(h: 24, v: 1),
            SizedBox(
              height: ConfigSize.blockSizeVertical*20,
            ),
            Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side:BorderSide(color:grayborder)),
        elevation: 0,
        child: Scrollbar(
          child: TextField(
            onChanged: (value) {
            //Do something with the user input.
            },
            minLines: 5, 
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
              
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Write something...',
              hintStyle: TextStyle(
                fontSize: 12,
                ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      Container(
        alignment: Alignment.topRight,
        child: "1500 Character Countdown"
              .text
                  .xs
                  .make()
                  .pSymmetric(h: 24, v: 1),
      ),

SizedBox(
              height: ConfigSize.blockSizeVertical*10,
            ),
                  Center(
                    child: StretchedColorButton(
              text: "Save",
              onPressed: () {
                context.push((context) => GrantAccessScreen());
              },
              height: 36,
              width: ConfigSize.convertWidth(context, 300),
              color: red),
                  )
                ]
                
            )
            ));
  }
    
  }


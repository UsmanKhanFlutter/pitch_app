import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulation_email.dart';
import 'package:pitch_app/screens/screen_write_pitch_or_provide_ratings.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class BasicInformationScreen extends StatefulWidget {
  @override
  _BasicInformationScreenState createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              "Basic Information"
              .text
              .xl
              .fontWeight(FontWeight.bold)
              .make()
              .box
              .alignTopCenter
              .height(ConfigSize.convertHeight(context, 50))
              .make(),
              

              label("First Name"),
              infoTextField(),
              
              
              label("I am a:"),
              infoTextField(),

              
              label('Birthday:'),
              infoTextField(),

              
              label("Email Address:"),
              infoTextField(),
              SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),

              Center(
                child: StretchedColorButton(
                  text: "Continue",
                  onPressed: () {
                    context.push((context) => WritePitchOrProvideRatingsScreen());
                  },
                  height: 36,
                  width: ConfigSize.convertWidth(context, 300),
                  color: red
                ),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),
             interestedIn('Man Interested in Man'),
             interestedIn('Man Interested in Women'),
             interestedIn('Women Interested in Man'),
             interestedIn('Women Interested in Women'),
            ],
          ),
        ),
      )
    );
  }
}
Widget label(String text)
{
  return text
  .text
  .align(TextAlign.left)                
  .fontWeight(FontWeight.bold)
  .make()
  .box
  .alignTopLeft
  .make()
  .pSymmetric(h: 24, v: 1);
            
}


Widget interestedIn(String text){
  return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
        color: grayTextField,
        elevation: 0,
          child:text
            .text
            .align(TextAlign.center)                
            .fontWeight(FontWeight.normal)
            .make()
            .box
            .alignCenter
            .make()
            .pSymmetric(h: 24, v: 1)
  );
}
Widget infoTextField(){
  return Container(
    height: ConfigSize.blockSizeVertical*5,
        padding: EdgeInsets.only(left:20, right:20),
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
        color: grayTextField,
        elevation: 0,
          child: TextField(
              onChanged: (value) {
              //Do something with the user input.
              },
              minLines: 2, 
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: '',
                hintStyle: TextStyle(
                  fontSize: 12,
                  ),
                border: InputBorder.none,
              ),
            ),
        ),
      );
}
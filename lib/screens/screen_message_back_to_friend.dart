import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulation_email.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class MessageBackToFriendScreen extends StatefulWidget {
  @override
  _MessageBackToFriendScreenState createState() => _MessageBackToFriendScreenState();
}

class _MessageBackToFriendScreenState extends State<MessageBackToFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: VStack(
          [
            SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),
            "Message Back to Friend"
                .text
                .xl
                .fontWeight(FontWeight.bold)
                .make()
                .box
                .alignTopCenter
                .height(ConfigSize.convertHeight(context, 30))
                .make(),
                SizedBox(
                height: ConfigSize.blockSizeVertical*28,
              ),
            "Thanks for pitching me on PitchMe the dating site where friends pitch friends. Before the profile goes live, I have some questions."
                .text
                .align(TextAlign.center)                
                .make()
                .box
                .alignTopCenter
                .make()
                .pSymmetric(h: 24, v: 17),

                
            "[ is there incorrect information?"
            .text
            .align(TextAlign.center)   
                .make()
                .box
                .alignTopCenter
                .make()
                .pSymmetric(h: 24, v: 1),
                
          "Something to be added?"
          .text
          .align(TextAlign.center)                
          .make()
          .box
          .alignTopCenter
          .make()
          .pSymmetric(h: 24, v: 1),
          
          "Offer a different photo?]"
          .text
          .align(TextAlign.center)                
          .make()
          .box
          .alignTopCenter
          .make()
          .pSymmetric(h: 24, v: 1),
SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),
          "MyPitch/Profile"
          .text
          .align(TextAlign.center)    
          .underline            
          .lightBlue500
          .make()
          .box
          .alignTopCenter
          .make()
          .pSymmetric(h: 24, v: 1),
                 
              SizedBox(
                height: ConfigSize.blockSizeVertical*27,
              ),
              Center(
                child: StretchedColorButton(
                text: "Ask another friend to pitch you",
                onPressed: () {
                  context.push((context) => CongratulationEmailScreen());
                },
                height: 36,
                width: ConfigSize.convertWidth(context, 300),
                color: red),
              )
            ],
            alignment: MainAxisAlignment.center,

          ),
          

      ));
  }
}
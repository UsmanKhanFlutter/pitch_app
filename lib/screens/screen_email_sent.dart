import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_welcome_to_pitch.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class EmailSentScreen extends StatefulWidget {
  @override
  _EmailSentScreenState createState() => _EmailSentScreenState();
}

class _EmailSentScreenState extends State<EmailSentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          
          padding: EdgeInsets.only(left:20,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Text('added extra',
              style: TextStyle(
                fontSize: 20
                ),
              )),
              SizedBox(
                height:ConfigSize.blockSizeVertical*8
                ),
               Container(
                width: ConfigSize.blockSizeHorizontal*80,
                height:ConfigSize.blockSizeVertical*33,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                    
                  ),
                  
                  border: Border.all(color:Colors.black,),
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                  Text('Your Email has been sent',style: TextStyle(
                    color: Vx.white,
                    fontSize: 20
                    ), ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Vx.white,
                    child:Icon(
                      Icons.check,
                      color: lightBlue,
                  )),
                  InkWell(
                    onTap: (){
                      context.push((context) => WelcomeToPitchScreen());
                    },
                    child: Container(
                      width: ConfigSize.blockSizeHorizontal*55,
                      height:ConfigSize.blockSizeVertical*4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                      color: Vx.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                      
                    ),
                      child: Text('Ok',
                      style: TextStyle(
                        color: lightBlue,
                        fontSize: 20
                        ),  
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
    );
  }
}
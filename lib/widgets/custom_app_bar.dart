import 'package:flutter/material.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_suggest_a_friend.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget {
  final String titletext;
  CustomAppBar({this.titletext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:ConfigSize.blockSizeVertical*7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 18,
              color: Color(0xFF3a3737),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),

          Text(titletext, 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.normal
            ),
          ),


          IconButton(
            icon: new Icon(
              Icons.multiple_stop,
              color: Color(0xFF3a3737),
            size: 28,),
            onPressed: () {
              context.push((context) => CustomDialogBox());
              
            }
          ),


        ]
      ),
    );
  }
}
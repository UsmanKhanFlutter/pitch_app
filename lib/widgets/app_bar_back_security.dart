import 'package:flutter/material.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
  
  Widget AppBarBackSecurity({
    @required String title,
    @required Function onLeadingPressed,
    @required Function onActionPressed})
    {
    return Container(
      height: ConfigSize.blockSizeVertical * 7,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            // size: 18,
            color: Color(0xFF3a3737),
          ),
          onPressed: onLeadingPressed,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.normal),
        ),
        IconButton(
          icon: Icon(
            Icons.security,
            size: 18,
            color: Colors.black//Color(0xFF3a3737),
          ),
            // icon: Image.asset("assets/images/toggle.png").pSymmetric(h: 2),
            onPressed: onActionPressed
            ),
      ]),
    );
  }


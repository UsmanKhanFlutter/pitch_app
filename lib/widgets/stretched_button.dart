import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';

class StretchedButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPressed;

  StretchedButton({
    Key key,
    @required this.text,
    this.width = double.infinity,
    this.height = 40.0,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: AppColors.mainColor,
        elevation: 1.4,
        shadowColor: Colors.red.shade300,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }
}

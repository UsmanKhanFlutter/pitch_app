import 'dart:ui';

import 'package:flutter/material.dart';

class StretchedColorButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;

  StretchedColorButton(
      {Key key,
      @required this.text,
      this.width = double.infinity,
      this.height = 44.0,
      @required this.onPressed,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: color,
        elevation: 1.4,
        shadowColor: color,
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

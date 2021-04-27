import 'dart:ui';

import 'package:flutter/material.dart';

class StretchedBorderedButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPressed;

  StretchedBorderedButton({
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
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red.shade400)),
        color: Colors.white,
        elevation: 1.4,
        shadowColor: Colors.red.shade300,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.red.shade400,
                ),
              ),
            )),
      ),
    );
  }
}

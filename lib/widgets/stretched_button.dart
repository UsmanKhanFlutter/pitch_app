import 'dart:ui';

import 'package:flutter/material.dart';

class StretchedButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPressed;

  StretchedButton({
    Key key,
    @required this.text,
    this.width = double.infinity,
    this.height = 44.0,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.red.shade400,
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

import 'dart:ui';

import 'package:flutter/material.dart';

class StretchedIconButton extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;

  StretchedIconButton({
    Key key,
    this.path,
    this.width = double.infinity,
    this.height = 30,
    this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: color,
        elevation: 1.4,
        shadowColor: color,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Image.asset(
                path,
              ),
            )),
      ),
    );
  }
}

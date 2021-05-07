import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar backAppBar(
    {@required String title, @required Function onLeadingPressed}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: "$title".text.xl.black.bold.make(),
    leading: IconButton(
      icon: Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      onPressed: onLeadingPressed,
    ),
  );
}

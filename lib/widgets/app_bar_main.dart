import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar mainAppBar(
    {@required String title,
    @required Function onLeadingPressed,
    @required Function onActionPressed}) {
  return AppBar(
    title: "$title".text.fontWeight(FontWeight.w400).black.make(),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.favorite_border_outlined,
        color: Colors.black,
      ),
      onPressed: onLeadingPressed,
    ),
    actions: [
      IconButton(
        icon: Image.asset("assets/images/toggle.png").pSymmetric(h: 2),
        onPressed: onActionPressed,
      )
    ],
  );
}

AppBar appBarFilterIcon(
    {@required String title, @required Function onActionPressed}) {
  return AppBar(
    title: "$title".text.fontWeight(FontWeight.w400).black.make(),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
          icon: Image.asset("assets/images/toggle.png").pSymmetric(h: 2),
          onPressed: onActionPressed)
    ],
  );
}

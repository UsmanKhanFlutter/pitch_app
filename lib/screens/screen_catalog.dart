import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainAppBar(
          title: "Catalog", onLeadingPressed: () {}, onActionPressed: () {}),
      body: VStack(
        [
          Container(
            height: 26,
            width: context.screenWidth / 2.5,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: HStack(
              [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )),
                RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    )
                        .box
                        .height(30)
                        .withDecoration(BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red.shade400))
                        .make()),
              ],
            ),
          ).box.alignTopCenter.make()
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}

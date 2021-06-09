import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:velocity_x/velocity_x.dart';

class SafetyToolkitBottomSheet extends StatelessWidget {
  final height;
  SafetyToolkitBottomSheet(this.height);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        color: Colors.white,
      ),
      child: VStack(
        [
          Container(
            width: 80,
            height: 1,
            color: Colors.grey,
          ).box.width(double.infinity).alignCenter.make(),
          SizedBox(height: 36),
          "Safetly Tool Kit"
              .text
              .align(TextAlign.end)
              .bold
              .make()
              .box
              .width(100)
              .make(),
          SizedBox(height: 36),
          _rowContainer(path: "assets/images/flag.png", text: 'Report'),
          SizedBox(height: 16),
          _rowContainer(path: "assets/images/cross.png", text: 'Unmatch'),
          SizedBox(height: 16),
          _rowContainer(path: "assets/images/shield.png", text: ''),
          SizedBox(height: 16),
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).pOnly(top: 8, left: 16, right: 16),
    );
  }

  _rowContainer({String path, String text}) {
    return HStack(
      [
        Image.asset(
          path,
          height: 24,
          width: 24,
        ),
        SizedBox(width: 24),
        '$text'.text.size(13).make()
      ],
      alignment: MainAxisAlignment.spaceBetween,
    );
  }
}

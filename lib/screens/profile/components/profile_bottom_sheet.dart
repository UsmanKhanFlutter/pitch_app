import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileBottomSheet extends StatelessWidget {
  final height;
  ProfileBottomSheet(this.height);
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
          _rowContainer(title: "Height:", text: '5.5"'),
          SizedBox(height: 16),
          _rowContainer(title: "Age:", text: '25'),
          SizedBox(height: 16),
          Divider(indent: 16, endIndent: 16),
          SizedBox(height: 10),
          _rowContainer(
              title: "Interest:", text: 'Shopping,Going out,Hang out'),
          SizedBox(height: 10),
          Divider(indent: 16, endIndent: 16),
          SizedBox(height: 10),
          _rowContainer(title: "Hobby:", text: 'Sports'),
          SizedBox(height: 10),
          Divider(indent: 16, endIndent: 16),
          SizedBox(height: 10),
          _rowContainer(title: "Smoker:", text: 'No'),
          SizedBox(height: 10),
          Divider(indent: 16, endIndent: 16),
          SizedBox(height: 10),
          _rowContainer(title: "Religion:", text: 'Not Specified'),
          SizedBox(height: 10),
          Divider(indent: 16, endIndent: 16),
          SizedBox(height: 10),
          _rowContainer(title: "Political Interest:", text: 'Not Specified'),
          SizedBox(height: 10),
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).pOnly(top: 8, left: 16, right: 16),
    );
  }

  _rowContainer({String title, String text}) {
    return HStack(
      [
        "$title".text.align(TextAlign.end).bold.make().box.width(100).make(),
        SizedBox(width: 24),
        '$text'.text.size(13).make()
      ],
      alignment: MainAxisAlignment.spaceBetween,
    );
  }
}

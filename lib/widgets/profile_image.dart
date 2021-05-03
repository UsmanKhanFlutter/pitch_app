import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';

class ProfileImage extends StatelessWidget {
  final double height, width;
  final double radius;
  ProfileImage({this.height, this.width, this.radius});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey, width: 2)),
          ),
          SizedBox(height: 10),
          Container(
            height: 35,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                border: Border.all(color: Colors.grey, width: 2)),
          )
        ],
      ),
    );
  }
}

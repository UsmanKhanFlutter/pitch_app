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
            height: ConfigSize.convertHeight(context, 44),
            width: ConfigSize.convertWidth(context, 44),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                    ConfigSize.convertHeight(context, 24)),
                border: Border.all(color: Colors.grey, width: 2)),
          ),
          SizedBox(height: 10),
          Container(
            height: ConfigSize.convertHeight(context, 35),
            width: ConfigSize.convertWidth(context, 60),
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

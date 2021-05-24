import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class GiftBottomSheet extends StatelessWidget {
  final height;
  GiftBottomSheet(this.height);
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
      child: Column(
        children: [
          Expanded(
            child: VStack(
              [
                Container(
                  width: 80,
                  height: 2,
                  color: Colors.grey,
                ).box.width(double.infinity).alignCenter.make(),
                SizedBox(height: 36),
                "Choose a gift".text.size(16).bold.make(),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return _textContainer(title: "Flower");
                      }).pSymmetric(h: 24),
                ),
              ],
              crossAlignment: CrossAxisAlignment.center,
            ).pOnly(top: 8, left: 16, right: 16),
          ),
          StretchedButton(
            text: "Select",
            onPressed: () {},
            width: context.screenWidth * 0.75,
          ).pSymmetric(h: 36, v: 16),
        ],
      ),
    );
  }

  _textContainer({@required String title}) {
    return FittedBox(
      fit: BoxFit.contain,
      alignment: AlignmentDirectional.topCenter,
      child: VStack(
        [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: 8),
          "$title".text.align(TextAlign.center).size(13).make(),
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}

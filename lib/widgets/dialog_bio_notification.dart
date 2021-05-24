import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class BioNotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: VStack(
          [
            'Notification'.text.align(TextAlign.center).bold.make(),
            'Pitch is based on Phone Numbers'
                .text
                .size(13)
                .make()
                .pSymmetric(h: 16),
            StretchedButton(
              text: "OK",
              onPressed: () {},
              height: 30,
            )
          ],
          crossAlignment: CrossAxisAlignment.center,
          alignment: MainAxisAlignment.spaceBetween,
        ),
      ).p16(),
    );
  }
}

Future<Widget> bioNotificationDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: BioNotificationDialog(),
        );
      });
}

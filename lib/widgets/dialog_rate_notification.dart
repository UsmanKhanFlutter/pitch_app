import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/stretched_bordered_button.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class RateNotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              'Would you like to rate our app?'
                  .text
                  .align(TextAlign.center)
                  .white
                  .size(13)
                  .bold
                  .make(),
              Expanded(
                child: VStack(
                  [
                    'Let us know what you think of\nPitchMe'
                        .text
                        .align(TextAlign.center)
                        .size(13)
                        .white
                        .make()
                        .pSymmetric(h: 16),
                    SizedBox(height: 20),
                    Container(
                      height: 36,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: VxRating(
                        onRatingUpdate: (String value) {},
                        count: 5,
                        selectionColor: Colors.amber,
                        size: 24,
                      ),
                    ),
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedButton(
                text: "Submit",
                onPressed: () {},
                height: 36,
              ),
              SizedBox(height: 4),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  child: "Not Now".text.color(Colors.grey.shade500).make(),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ).p16(),
      ),
    );
  }
}

Future<Widget> rateNotificationDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.grey.withOpacity(0.1),
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: RateNotificationDialog(),
        );
      });
}

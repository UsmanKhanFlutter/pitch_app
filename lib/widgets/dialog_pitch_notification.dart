import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/stretched_bordered_button.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class PitchNotificationDialog extends StatelessWidget {
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
              'Notification'
                  .text
                  .align(TextAlign.center)
                  .bold
                  .white
                  .make()
                  .pSymmetric(v: 24),
              Expanded(
                child: VStack(
                  [
                    'You were recently pitched by:'
                        .text
                        .size(13)
                        .white
                        .make()
                        .pSymmetric(h: 16),
                    SizedBox(height: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            spreadRadius: 0,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/girl_2x.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    "Keren".text.white.size(13).make(),
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedButton(
                text: "Start Conversation",
                onPressed: () {},
                height: 36,
              ),
              SizedBox(height: 4),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  child: "Decline".text.color(Colors.grey.shade500).make(),
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

Future<Widget> pitchNotificationDialog(BuildContext context) {
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
          child: PitchNotificationDialog(),
        );
      });
}

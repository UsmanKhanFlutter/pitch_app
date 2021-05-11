import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class MessageNotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  [
                    'Notification'
                        .text
                        .align(TextAlign.center)
                        .bold
                        .white
                        .make()
                        .pSymmetric(v: 24),
                    'You\'ve received a notification from'
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
                    "James".text.white.size(13).make()
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedButton(
                text: "Go to Inbox",
                onPressed: () {},
                height: 36,
              )
            ],
          ),
        ).p16(),
      ),
    );
  }
}

Future<Widget> messageNotificationDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.white.withOpacity(0.3),
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: MessageNotificationDialog(),
        );
      });
}
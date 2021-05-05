import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:velocity_x/velocity_x.dart';

class LocationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: VStack(
            [
              'Allow "PitchMe" use your\n location'
                  .text
                  .align(TextAlign.center)
                  .bold
                  .make()
                  .pSymmetric(v: 24),
              'PitchMe uses your location to introduce you to singles in your area'
                  .text
                  .size(13)
                  .color(Colors.grey.shade700)
                  .make()
                  .pSymmetric(h: 16),
              SizedBox(height: 16),
              Container(
                height: ConfigSize.convertHeight(context, 180),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/map.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16),
              _dialogButton(text: 'Allow Once', onPressed: () {}),
              SizedBox(height: 8),
              _dialogButton(text: 'Allow while using app', onPressed: () {}),
              SizedBox(height: 8),
              _dialogButton(text: "Don't Allow", onPressed: () {}),
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

_dialogButton({@required String text, @required Function onPressed}) {
  return Container(
    width: double.infinity,
    height: 34,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: "$text".text.make(),
      color: Colors.grey.shade200,
      elevation: 0,
    ),
  ).pSymmetric(h: 16);
}

Future<Widget> locationDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.white60,
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: LocationDialog(),
        );
      });
}

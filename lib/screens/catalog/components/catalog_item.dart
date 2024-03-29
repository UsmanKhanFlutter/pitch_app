import 'package:flutter/material.dart';
import 'package:pitch_app/screens/messaging/screen_messaging.dart';
import 'package:pitch_app/widgets/dialog_message_notification.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;

class CatalogItem extends StatelessWidget {
  bool _loaded = false;
  final Function onPitchPressed;
  String image;
  String name;
  CatalogItem({@required this.onPitchPressed, this.image, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(_loaded ? globals.imageurl : image),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VStack([
            name.text.white.size(13).bold.make(),
            "California".text.white.size(13).make(),
          ]),
          StretchedButton(
            onPressed: onPitchPressed,
            text: 'Pitch',
            height: 20,
          )
        ],
      ),
    );
  }
}

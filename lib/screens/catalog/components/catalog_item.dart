import 'package:flutter/material.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Function onPitchPressed;
  CatalogItem({@required this.onPitchPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/images/girl_2x.png'),
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
            "Jackson, 21".text.white.size(13).bold.make(),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_congratulations_2.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/dialog_bio_notification.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class BioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: mainAppBar(
          title: "What's your pitch?",
          onLeadingPressed: () {},
          onActionPressed: () => bioNotificationDialog(context)),
      body: VStack([
        SizedBox(height: ConfigSize.convertHeight(context, 80)),
        "Write Bio".text.bold.make().pOnly(left: 36),
        SizedBox(height: 8),
        Container(
          height: ConfigSize.convertHeight(context, 250),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              TextFormField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              StretchedColorButton(
                text: "Send",
                onPressed: () =>
                    context.push((context) => CongratulationsTwoScreen()),
                color: Colors.cyan,
                height: 24,
                width: 50,
              ).pSymmetric(h: 16, v: 8)
            ],
          ),
        ),
      ]).pSymmetric(h: 20),
    );
  }
}

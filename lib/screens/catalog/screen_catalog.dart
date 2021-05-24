import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/screens/catalog/components/catalog_item.dart';
import 'package:pitch_app/screens/screen_bio.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/dialog_message_notification.dart';
import 'package:pitch_app/widgets/dialog_rate_notification.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainAppBar(
          title: "Catalog",
          onLeadingPressed: () => context.push((context) => BioScreen()),
          onActionPressed: () => rateNotificationDialog(context)),
      body: VStack(
        [
          Container(
            height: 26,
            width: context.screenWidth / 2.5,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: HStack(
              [
                Expanded(
                    child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )),
                RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    )
                        .box
                        .height(30)
                        .withDecoration(BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor))
                        .make()),
              ],
            ),
          ).box.alignTopCenter.make(),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 6 / 7),
              itemBuilder: (context, index) {
                return CatalogItem(
                  onPitchPressed: () => messageNotificationDialog(context),
                );
              },
              itemCount: 15,
            ).p16(),
          )
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}

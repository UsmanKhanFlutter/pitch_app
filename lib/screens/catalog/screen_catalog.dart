import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/backend/UserServices.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/screens/catalog/components/catalog_item.dart';
import 'package:pitch_app/screens/screen_bio.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/dialog_message_notification.dart';
import 'package:pitch_app/widgets/dialog_rate_notification.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("basicinfo")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainAppBar(
          title: "Catalog",
          onLeadingPressed: () {},
          onActionPressed: () => rateNotificationDialog(context)),
      bottomNavigationBar: BottomNavigation(),
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
              child: FutureBuilder<QuerySnapshot>(
                  // <2> Pass `Future<QuerySnapshot>` to future
                  future:
                      FirebaseFirestore.instance.collection('basicinfo').get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                      final List<DocumentSnapshot> documents =
                          snapshot.data.docs;
                      return GridView(
                          padding: EdgeInsets.only(left: 8, top: 10, right: 8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.5,
                          ),
                          children: documents
                              .map((doc) => CatalogItem(
                                    onPitchPressed: () =>
                                        messageNotificationDialog(
                                            context,
                                            doc["name"],
                                            doc["urlOfImage"],
                                            doc["userid"]),
                                    name: doc["name"],
                                    image: doc["urlOfImage"],
                                  ))
                              .toList());
                    } else if (snapshot.hasError) {
                      return Text("loading");
                    }
                    return Text("loading");
                  }))
        ],
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/catalog/screen_catalog.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> titleList = [
    "Bio:",
    "Interested In:",
    "Email:",
    // "Hobbies/Interests:",
    // "Advance Settings",
  ];
  final List<String> subList = [
    "I am who I am, You will find out if we talk",
    "Men",
    "UX/UI@gmail.com",
    // "Pets",
    // "Advance Settings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),

      body: VStack(
        [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: ConfigSize.convertHeight(context, 320),
                width: double.infinity,
                child: Container(
                  height: ConfigSize.convertHeight(context, 300),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          spreadRadius: 0,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/girl_2x.png"),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      )),
                  child: VStack(
                    [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                      ).box.height(70).width(60).alignBottomCenter.make(),
                      VStack([
                        "Tosca, 25".text.white.bold.make(),
                        SizedBox(height: 4),
                        "California".text.white.make(),
                      ]).pOnly(left: 24, bottom: 16),
                    ],
                    alignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () => context.push((context) => CatalogScreen()),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  "assets/images/Edit.png",
                  height: 24,
                ),
                shape: CircleBorder(),
                fillColor: Colors.white,
                elevation: 1.4,
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                // if (index == 4) {
                //   return Padding(
                //     padding:
                //         const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                //     child: Container(
                //       height: 50,
                //       alignment: Alignment.center,
                //       child: ListTile(
                //         title: "Advance Settings".text.make(),
                //         trailing: IconButton(
                //             icon: Icon(
                //               CupertinoIcons.back,
                //               color: Colors.black,
                //             ),
                //             onPressed: () =>
                //                 _scaffoldKey.currentState.showBottomSheet(
                //                   (context) => ProfileBottomSheet(
                //                     context.screenHeight * 0.7,
                //                   ),
                //                 )
                //             // profileBottomSheet(context, context.screenHeight),
                //             ),
                //       ),
                //     ),
                //   );
                // }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(titleList[index]),
                      subtitle: '${subList[index]}'
                          .text
                          .color(Colors.grey.shade400)
                          .make(),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 2,
                  child: Divider(
                    indent: 24,
                    color: Colors.grey.shade300,
                    endIndent: 24,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

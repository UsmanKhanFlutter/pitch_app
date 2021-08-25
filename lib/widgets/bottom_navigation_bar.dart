import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/catalog/screen_catalog.dart';
import 'package:pitch_app/screens/messaging/components/screen_chat.dart';
import 'package:pitch_app/screens/profile/screen_profile.dart';
import 'package:pitch_app/screens/screen_dashboard.dart';
import 'package:pitch_app/screens/screen_your_pitches.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Container(
        height: ConfigSize.convertHeight(context, 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()),
                            (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        CupertinoIcons.person_fill,
                        color:
                            pageIndex == 0 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => YourPitchesScreen()),
                            (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        CupertinoIcons.hand_thumbsup_fill,
                        color:
                            pageIndex == 1 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => CatalogScreen()),
                            (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color:
                            pageIndex == 2 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()),
                            (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                        color:
                            pageIndex == 3 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BtnExpanded extends StatelessWidget {
  Function onPress;
  IconData icon;
  Color iconColor;
  BtnExpanded({this.icon, this.iconColor, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      child: IconButton(
        onPressed: onPress(),
        icon: Icon(
          icon,
          color: iconColor,
          size: 25,
        ),
      ),
    );
  }
}

class GettingStartedBottomNavigation extends StatefulWidget {
  @override
  _GettingStartedBottomNavigationState createState() =>
      _GettingStartedBottomNavigationState();
}

class _GettingStartedBottomNavigationState
    extends State<GettingStartedBottomNavigation> {
  int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Container(
        height: ConfigSize.convertHeight(context, 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      icon: Icon(
                        CupertinoIcons.person_fill,
                        color:
                            pageIndex == 0 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => DashboardScreen()));
                      },
                      icon: Icon(
                        Icons.home,
                        color:
                            pageIndex == 1 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => YourPitchesScreen()));
                      },
                      icon: Icon(
                        CupertinoIcons.hand_thumbsup_fill,
                        color:
                            pageIndex == 2 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      icon: Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                        color:
                            pageIndex == 3 ? Colors.red.shade400 : Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







// class BottomNavigation extends StatefulWidget {
//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
  
//   int pageIndex = 0;
//   var _pageController;

//   @override
//   void initState() {
//     _pageController = PageController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   onPageChanged(int pageIndex) {
//     setState(() {
//       this.pageIndex = pageIndex;
//     });
//   }

//   onTap(int pageIndex) {
//     _pageController.animateToPage(
//       pageIndex,
//       duration: Duration(milliseconds: 50),
//       curve: Curves.easeInOut,
      
//     );
//   }

// // final tabs = [
// //     ProfileScreen(),
// //     YourPitchesScreen(),
// //     CatalogScreen(),
// //     FindAMatchScreen(),
// //   ];
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
//         child: Container(
//           height: ConfigSize.convertHeight(context, 50),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(30),
//               topLeft: Radius.circular(30),
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade500,
//                 spreadRadius: 0,
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: ClipRRect(
//             clipBehavior: Clip.antiAlias,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//             child: Container(
//               child: Row(
//                 children: [
//                   btnExpanded(
//                     icon: CupertinoIcons.person_fill,
//                     iconColor:pageIndex == 0 ? Colors.red.shade400 : Colors.black,
//                     onPress: () {
//                       // setState(() {
//                       //   pageIndex = 0;
//                       // });
//                       // onTap(pageIndex);

//                     },
//                   ),
//                   btnExpanded(
//                     icon: CupertinoIcons.hand_thumbsup_fill,
//                     iconColor:
//                         pageIndex == 1 ? Colors.red.shade400 : Colors.black,
//                     onPress: () {
//                       // setState(() {
//                       //   pageIndex = 1;
//                       // });
//                       // onTap(pageIndex);
//                     },
//                   ),
//                   btnExpanded(
//                     icon: Icons.favorite,
//                     iconColor:
//                         pageIndex == 2 ? Colors.red.shade400 : Colors.black,
//                     onPress: () {
                      
//                       // setState(() {
//                       //   pageIndex = 2;
//                       // });
//                       // onTap(pageIndex);
                      
//                     },
//                   ),
//                   btnExpanded(
//                     icon: CupertinoIcons.chat_bubble_2_fill,
//                     iconColor:
//                         pageIndex == 3 ? Colors.red.shade400 : Colors.black,
//                     onPress: () {
//                       // setState(() {
//                       //   pageIndex = 3;
//                       // });
//                       // onTap(pageIndex);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//   }
//   Widget btnExpanded({
//     @required IconData icon,
//     Color iconColor,
//     @required Function onPress,
//   }) =>
//       Expanded(
//         flex: 1,
//         child: Container(
//           height: MediaQuery.of(context).size.height / 15,
//           child: IconButton(
//             onPressed: onPress(),
//             icon: Icon(
//               icon,
//               color: iconColor,
//               size: 25,
//             ),
//           ),
//         ),
//       );
// }

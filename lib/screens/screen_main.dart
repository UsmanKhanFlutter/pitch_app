import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_agreement.dart';
import 'package:pitch_app/screens/screen_dashboard.dart';
import 'package:pitch_app/screens/screen_getting_started.dart';
import 'package:pitch_app/screens/screen_login.dart';
import 'package:pitch_app/screens/screen_verify_photo.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  var _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged(pageIndex),
        children: [
          DashboardScreen(),
          GettingStartedScreen(),
          VerifyPhotoScreen(),
          LoginScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Padding(
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
                  btnExpanded(
                    icon: CupertinoIcons.person_fill,
                    iconColor:
                        pageIndex == 0 ? Colors.red.shade400 : Colors.black,
                    onPress: () {
                      setState(() {
                        pageIndex = 0;
                      });
                      onTap(pageIndex);
                    },
                  ),
                  btnExpanded(
                    icon: CupertinoIcons.hand_thumbsup_fill,
                    iconColor:
                        pageIndex == 1 ? Colors.red.shade400 : Colors.black,
                    onPress: () {
                      setState(() {
                        pageIndex = 1;
                      });
                      onTap(pageIndex);
                    },
                  ),
                  btnExpanded(
                    icon: Icons.favorite,
                    iconColor:
                        pageIndex == 2 ? Colors.red.shade400 : Colors.black,
                    onPress: () {
                      setState(() {
                        pageIndex = 2;
                      });
                      onTap(pageIndex);
                    },
                  ),
                  btnExpanded(
                    icon: CupertinoIcons.chat_bubble_2_fill,
                    iconColor:
                        pageIndex == 3 ? Colors.red.shade400 : Colors.black,
                    onPress: () {
                      setState(() {
                        pageIndex = 3;
                      });
                      onTap(pageIndex);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget btnExpanded({
    @required IconData icon,
    Color iconColor,
    @required Function onPress,
  }) =>
      Expanded(
        flex: 1,
        child: Container(
          height: MediaQuery.of(context).size.height / 15,
          child: IconButton(
            onPressed: onPress,
            icon: Icon(
              icon,
              color: iconColor,
              size: 25,
            ),
          ),
        ),
      );
}

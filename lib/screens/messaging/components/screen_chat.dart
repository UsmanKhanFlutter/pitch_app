import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/messaging/screen_messaging.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/dialog_message_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isloading = false;
  List<String> message = [
    "Recently active, match now",
    "Hi, there!",
    "We have recently seen your profile.",
    "Hi, there!",
    "We have recently seen your profile.",
    "Hi, there!",
    "We have recently seen your profile.",
  ];
  List<String> name = [
    "Lissa",
    "Simon",
    "Team Tinder",
    "Mr. Green",
    "Lissa",
    "Simon",
    "Team Tinder",
  ];

  List<String> time = [
    "25 Min ago",
    "45 Min ago",
    "5:11 PM",
    "4:00 PM",
    "Yesterday",
    "Yesterday",
    "29/4/2021",
    "29/3/2021",
    "30/3/2021",
    "30/3/2021",
    "29/3/2021",
    "30/3/2021",
    "30/3/2021",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readlocaldata();
  }

  readlocaldata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userid = prefs.getString("currentUserId");
    });
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);

    final navigatorKey = GlobalObjectKey<NavigatorState>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: mainAppBar(
            title: "Chat", onLeadingPressed: () {}, onActionPressed: () {}),
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ConfigSize.blockSizeVertical * 2,
              ),
              searchBarContainer(),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 2,
              ),
              Container(
                child: Text(
                  "New Matches",
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //App Bar
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),

              Container(
                  height: ConfigSize.blockSizeVertical * 10.5,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      shrinkWrap: true,
                      // padding: EdgeInsets.only(left: 10,right: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(left: 10, right: 8),
                          child: Column(children: <Widget>[
                            CircleAvatar(
                              backgroundImage: ExactAssetImage(
                                  'assets/images/girl.png'), //images[index]),
                              maxRadius: 26,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              child: Text(
                                "Lauren",
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                        );
                      })),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),
              Container(
                child: Text(
                  "Messages",
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: ConfigSize.blockSizeVertical * 2,
              ),

              // List of conversation
              Container(
                  height: ConfigSize.blockSizeVertical * 50,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('messageslist')
                          .doc(userid)
                          .collection("contacts")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<DocumentSnapshot> documents =
                              snapshot.data.docs;
                          // <3> Retrieve `List<DocumentSnapshot>` from snapshot

                          return ListView(
                              padding:
                                  EdgeInsets.only(left: 8, top: 10, right: 8),
                              children: documents
                                  .map(
                                    (doc) => InkWell(
                                      onTap: () {
                                        Get.to(MessagingScreen(
                                            doc["chatroomid"],
                                            doc["currentuserid"],
                                            doc["name"],
                                            doc["imageurl"],
                                            doc["otheruserid"]));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                //profle image
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      doc["imageurl"]), //images[index]),
                                                  maxRadius: 26,
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),

                                                Container(
                                                  width: ConfigSize
                                                          .blockSizeHorizontal *
                                                      55,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      // Name
                                                      Container(
                                                        child: Text(
                                                          doc["name"],
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade900,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),

                                                      //message
                                                    ],
                                                  ),
                                                ),

                                                //time
                                              ],
                                            ),
                                            Divider(),
                                            SizedBox(
                                              height: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList());
                        } else if (snapshot.hasError) {
                          return Text("loading");
                        }
                        return Text("loading");
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

Widget searchBarContainer() {
  return Center(
    child: Container(
      width: ConfigSize.blockSizeHorizontal * 70,
      height: ConfigSize.blockSizeVertical * 4,
      child: TextField(
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 16,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            hintText: "Search Conversation",
            hintStyle: TextStyle(color: Colors.black54, fontSize: 14.0)),
      ),
    ),
  );
}

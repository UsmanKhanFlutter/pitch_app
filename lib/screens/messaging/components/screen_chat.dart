import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/messaging/screen_messaging.dart';
import 'package:pitch_app/widgets/app_bar_main.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  List<String> message = [
    "Recently active, match now",
    "Hi, there!",
    "We have recently seen your profile.",
    "Hi, there!",
    "We have recently seen your profile.",
    "Hi, there!",
    "We have recently seen your profile.",

    
  ];
  List<String>name = [
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
  Widget build(BuildContext context) {
    
    final navigatorKey = GlobalObjectKey<NavigatorState>(context);
    return SafeArea(
      child: Scaffold(
         backgroundColor: Colors.white,
        appBar: mainAppBar(
          title: "Chat",
          onLeadingPressed: () {},
          onActionPressed: () {}),
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left:20,top:10,right:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
            SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),
            searchBarContainer(),
            SizedBox(
                height: ConfigSize.blockSizeVertical*2,
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
                height: ConfigSize.blockSizeVertical*1,
              ),
              

              Container(
                height: ConfigSize.blockSizeVertical*10.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, 
                  itemCount: 3,
                  shrinkWrap: true,
                  // padding: EdgeInsets.only(left: 10,right: 8),
                  itemBuilder: (context, index){
                    return Container(
                      padding:EdgeInsets.only(left: 10,right: 8),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: ExactAssetImage('assets/images/girl.png'),//images[index]),
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

                        ]
                        ),
                    );
                    }
                )
              ),
               SizedBox(
                height: ConfigSize.blockSizeVertical*1,
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
                height: ConfigSize.blockSizeVertical*2,
              ),

              // List of conversation
              Container(
                height: ConfigSize.blockSizeVertical*50,
                child: ListView.builder(
                  itemCount: name.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 10,right: 8),
                  itemBuilder: (context, index){
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Get.to(MessagingScreen());
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[

                                //profle image
                                CircleAvatar(
                                  backgroundImage: ExactAssetImage('assets/images/girl.png'),//images[index]),
                                  maxRadius: 26,
                                ),
                                SizedBox(
                                width: 16,
                                ),

                                
                                Container(
                                  width: ConfigSize.blockSizeHorizontal*55,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      // Name
                                      Container(
                                        child: Text(
                                          name[index],
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),

                                      //message
                                      Container(
                                        child: Text(
                                          message[index],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600,
                                              height: 1.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //time
                                Container(
                                  child: Text(
                                    time[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600),),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4
                          ),
                        Divider(color: Colors.grey.shade700,height: 1,),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  },//itemBuilder
                ),
              ),
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

          style: TextStyle(
            fontSize: 16.0, 
            color: Colors.black),
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
                borderSide: BorderSide(width: 1,color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey),
              ),               
              hintText: "Search Conversation",
              hintStyle: TextStyle(color: Colors.black54, fontSize: 14.0)
            ),
        ),
      ),
    );
  }

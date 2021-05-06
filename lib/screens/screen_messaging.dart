import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/widgets/bottom_navigation_bar.dart';
import 'package:pitch_app/widgets/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            

    // Navigation bar
      bottomNavigationBar: BottomNavigation(),
            backgroundColor: Color(0xffE5E5E5),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(left:20,top:10,right:20),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  //App bar
                  CustomAppBar(titletext:'Message'),

                  SizedBox(
                    height: ConfigSize.blockSizeVertical*2,
                  ),

                  Container(
                    height: ConfigSize.blockSizeVertical*57,
                    width: ConfigSize.blockSizeHorizontal*80,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            recievedMessageContainer(message:'Lets Meet up at townhall, 6  p.m?'),
                            sentMessageContainer(message:'Sure!! Cant wait. ;)'),
                            recievedMessageContainer(message:'Dont be late. ;)'),
                             sentMessageContainer(message:'Ofcourse!!'),

                          ],
                        );
                       },
                      ),
                    ),
                    textArea(),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: sendButton()),


                ]
              ),
            ),
          ),
    );
  }

  Widget textArea() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side:BorderSide(color:Vx.white)),
      child: TextField(
        onChanged: (value) {
          //Do something with the user input.
        },
        minLines: 2, 
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: 'Write something...',
          hintStyle: TextStyle(
            fontSize: 12,
            ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

Widget recievedMessageContainer({String message}){
  return Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    CircleAvatar(
      backgroundColor: Vx.white,
      radius: 20.0,
      backgroundImage: AssetImage('assets/images/girl.png',)
    ),
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side:BorderSide(color:lightGray)),
        color: lightGray,
      child: Container(
        padding: EdgeInsets.only(left:10,right: 10,),
        alignment: Alignment.centerLeft,
        height: 40,
        child: Text(
          message,
          style: TextStyle(
            fontFamily: defaultFontFamily,
            fontSize: 12,
            color: black,
            ),
          ),
        ),
    ),
  ],)
);

}


Widget sentMessageContainer({String message}){
  return Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Card(
      color: grayborder,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side:BorderSide(color:grayborder)),
      child: Container(
        padding: EdgeInsets.only(left:10,right: 10),
        alignment: Alignment.centerLeft,
        height: 40,
        child: Text(
          message,
          style: TextStyle(
            color: Vx.white,
            fontSize: 12,
            fontFamily: defaultFontFamily
          ),
        ),
      ),
    ),
    CircleAvatar(
      backgroundColor: Vx.white,
      radius: 20.0,
      backgroundImage: AssetImage('assets/images/profile.jpg',)
    ),
  ],)
);
}

Widget sendButton(){
  return Container(
    width: ConfigSize.blockSizeHorizontal * 23,
    height: ConfigSize.blockSizeVertical*4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: lightGreen
    ),
    child: Builder(builder: (BuildContext context) {
      return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0)
            )
          ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Send',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: defaultFontFamily,
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
          onPressed: (){
            // Get.to(GetPremiumPlusScreen());

          }
        );
        }  
      )
    );
  }
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_basic_information.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class HelpfulRatingsScreen extends StatefulWidget {
  @override
  _HelpfulRatingsScreenState createState() => _HelpfulRatingsScreenState();
}

class _HelpfulRatingsScreenState extends State<HelpfulRatingsScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left:10,top:10,right:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              "Helpful Ratings"
              .text
              .xl
              .fontWeight(FontWeight.bold)
              .make()
              .box
              .alignTopCenter
              .height(ConfigSize.convertHeight(context, 50))
              .make(),


              
              RatingsItems("What’s his energy level?",'Chilling on the couch',),
              RatingsItems('Sense of humor?','Stand-up comedy',),
              RatingsItems('What’s his outlook on life?','Views the world through rose coloured Glasses',),
              RatingsItems('What does he feel about money?','Money is meant for fun',),
              RatingsItems('Desire to settle down?','Playing the field',),
              RatingsItems('Desire for new experiences (food, travel, etc)','Love try new things',),
              RatingsItems('is he reliable/dependent?','You can count on him',),
              RatingsItems('How does he act, relative to his age?','Father figure',),
              RatingsItems('How emotional is he?','Steady Eddy',),
              RatingsItems('Emotional Availablity','Need some time to let someone in',),

              RatingsItems('What is he energized by?',"Hanging out with close friends"),
               "In your opinion, describe wrong type of person to date him:"
              .text
              .align(TextAlign.left)  
              .fontWeight(FontWeight.normal)              
              .make()
              .box
              .alignTopLeft
              .make()
              .pSymmetric(h: 24, v: 17),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  ),
                  color: grayTextField,
                  elevation: 0,
                  child: Scrollbar(
                    child: TextField(
                      onChanged: (value) {
                      //Do something with the user input.
                      },
                      minLines: 2, 
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      decoration: InputDecoration(
                        // suffix: SendButton(),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),


              "In your opinion, describe wrong type of person to date him:"
              .text
              .align(TextAlign.left)  
              .fontWeight(FontWeight.normal)              
              .make()
              .box
              .alignTopLeft
              .make()
              .pSymmetric(h: 24, v: 17),

               Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  ),
                  color: grayTextField,
                  elevation: 0,
                  child: Scrollbar(
                    child: TextField(
                      onChanged: (value) {
                      //Do something with the user input.
                      },
                      minLines: 2, 
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      decoration: InputDecoration(
                        // suffix: SendButton(),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: ConfigSize.blockSizeVertical*4,
                ),


              

            ],
          ),
        ),
      )
    );
  }
}

SizedBox dividerLine() {
    return SizedBox(
      height: ConfigSize.blockSizeVertical*2,
      // width: ConfigSize.blockSizeHorizontal*80,
      child: Container(
        padding: EdgeInsets.only(left:10),
        child: Divider(
          color: Colors.black54,
          thickness: 1.5,
        ),
      ),
    );
  }
  
Widget RatingsItems(String text1, String text2){
    return Column(
      children: [
        text1
        .text
        .align(TextAlign.left)  
        .fontWeight(FontWeight.bold)              
        .make()
        .box
        .alignTopLeft
        .make()
        .pSymmetric(h: 10, v: 10),
        dividerLine(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              child: text2
              .text
              .align(TextAlign.left)  
              .fontWeight(FontWeight.normal)              
              .make()
              .box
              .alignTopLeft
              .make()
              .pSymmetric(h: 10, v: 10),
            ),
            Container(
              child: CircularProgressIndicator()
              ),
          ],
        ),
          
        
        
        
      ],
    );
}

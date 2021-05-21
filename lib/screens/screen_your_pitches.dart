import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_basic_information.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class YourPitchesScreen extends StatefulWidget {
  @override
  _YourPitchesScreenState createState() => _YourPitchesScreenState();
}

class _YourPitchesScreenState extends State<YourPitchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: VStack(
          [

            "Your Pitches"
            .text
            .xl
            .fontWeight(FontWeight.bold)
            .make()
            .box
            .alignTopCenter
            .height(ConfigSize.convertHeight(context, 50))
            .make(),
            SizedBox(
              height: ConfigSize.blockSizeVertical*3,
            ),
            
            "Girl View"
            .text
            .align(TextAlign.left)                
            .fontWeight(FontWeight.bold)
            .make()
            .box
            .alignTopLeft
            .make()
            .pSymmetric(h: 24, v: 17),

            Container(
              height: ConfigSize.blockSizeVertical*27,
              width: ConfigSize.blockSizeHorizontal*80,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GirlViewListItem(),
                    ],
                  );
                  },
                ),
            ),
            Center(
              child: StretchedColorButton(
                text: "Pitch another friend",
                onPressed: () {
                  context.push((context) => BasicInformationScreen());
                },
                height: 36,
                width: ConfigSize.convertWidth(context, 300),
                color: red
              ),
            ),

            "Guy View"
            .text
            .align(TextAlign.left)  
            .fontWeight(FontWeight.bold)              
            .make()
            .box
            .alignTopLeft
            .make()
            .pSymmetric(h: 24, v: 17),

            Container(
              height: ConfigSize.blockSizeVertical*27,
              width: ConfigSize.blockSizeHorizontal*80,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GuyViewListItem(),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: StretchedColorButton(
                text: "Ask another friend to pitch you",
                onPressed: () {
                  context.push((context) => BasicInformationScreen());
                },
                height: 36,
                width: ConfigSize.convertWidth(context, 300),
                color: red
              ),
            )
          ],
          alignment: MainAxisAlignment.center,
        ),
      )
    );
  }
}

class GirlViewListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child:Image.asset(
              'assets/images/girl.png',
              fit: BoxFit.fill,
            ),
          ),

          'Edit'
          .text
          .align(TextAlign.right)
          .underline            
          .make()
          .box
          .alignTopLeft
          .make()
          .pSymmetric(h: 24, v: 17),

          Radio(
            value: 0, 
            groupValue: 1, 
          ),

        ]
      ),
    );
  }
}


class GuyViewListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child:Image.asset(
              'assets/images/girl.png',
              fit: BoxFit.fill,
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: red,
            child:Container(
              padding: EdgeInsets.all(8),
              child: Text('View',
              style: TextStyle(color: Vx.white),)
              )
          ),
        ]
      ),
    );
  }
}
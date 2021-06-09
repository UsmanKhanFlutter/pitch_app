import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_basic_information.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

class YourPitchesScreen extends StatefulWidget {
  @override
  _YourPitchesScreenState createState() => _YourPitchesScreenState();
}

class _YourPitchesScreenState extends State<YourPitchesScreen> {
  int _radioValue;
  String _view;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _view = 'first';
          print('first');
          break;
        case 1:
          _view = 'second';
          print('second');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: VStack(
            [
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),
              "Your Pitches"
                  .text
                  .xl
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  .alignTopCenter
                  .height(ConfigSize.convertHeight(context, 30))
                  .make(),
              SizedBox(
                height: ConfigSize.blockSizeVertical * 1,
              ),
              "Girl View"
                  .text
                  .align(TextAlign.left)
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  .alignTopLeft
                  .make()
                  .pSymmetric(h: 24, v: 11),
              Container(
                height: ConfigSize.blockSizeVertical * 31,
                padding: EdgeInsets.only(
                    left: ConfigSize.blockSizeHorizontal * 4,
                    right: ConfigSize.blockSizeHorizontal * 4,
                    bottom: ConfigSize.blockSizeVertical * 1),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      child:
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            buildProfileViewCard(name: 'Fred Jones'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                'Edit'
                                    .text
                                    .xl
                                    .color(lightBlue)
                                    .align(TextAlign.right)
                                    .underline
                                    .make()
                                    .box
                                    .make()
                                    .pSymmetric(h: 11, v: 11),
                                index == 0
                                    ? Icon(
                                        Icons.circle,
                                        size: 30,
                                        color: AppColors.lightGreen,
                                      )
                                    : Icon(
                                        Icons.add_circle_outline,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                              ],
                            ),
                          ]),
                    ); // GirlViewListItem(),
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
                    color: red),
              ),
              "Guy View"
                  .text
                  .align(TextAlign.left)
                  .fontWeight(FontWeight.bold)
                  .make()
                  .box
                  .alignTopLeft
                  .make()
                  .pSymmetric(h: 24, v: 11),
              Container(
                height: ConfigSize.blockSizeVertical * 31,
                padding: EdgeInsets.only(
                    left: ConfigSize.blockSizeHorizontal * 4,
                    right: ConfigSize.blockSizeHorizontal * 4,
                    bottom: ConfigSize.blockSizeVertical * 1),
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
                    color: red),
              )
            ],
            alignment: MainAxisAlignment.center,
          ),
        ));
  }
}

// class GirlViewListItem extends StatelessWidget {
//   GirlViewListItem({int radioValue});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children:[
//           buildProfileViewCard(name: 'Fred Jones'),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               'Edit'
//               .text
//               .align(TextAlign.right)
//               .underline
//               .make()
//               .box
//               .make(),
//               Radio(
//                 value: radioValue,
//                 groupValue: _groupValue,
//                 onChanged: _handleRadioValueChange1,
//               ),
//             ],
//           ),
//         ]
//       ),
//     );
//   }
// }

class GuyViewListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfileViewCard(name: 'Mary Janes'),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: red,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'View',
                      style: TextStyle(color: Vx.white),
                    ))),
          ]),
    );
  }
}

Widget buildProfileViewCard({String name}) {
  return Stack(children: <Widget>[
    //Card with a blurred background image
    Container(
      height: ConfigSize.blockSizeVertical * 15,
      width: ConfigSize.blockSizeVertical * 12,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 4.0,
        child: Image.asset(
          'assets/images/girl.png',
          fit: BoxFit.fill,
        ),
      ),
    ),

    //position the container(name and age) over the card.
    Positioned(
      bottom: ConfigSize.blockSizeVertical * 1,
      left: ConfigSize.blockSizeHorizontal * 1,
      right: ConfigSize.blockSizeHorizontal * 1,
      child: Container(
        // width: SizeConfig.blockSizeHorizontal*10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          // color: mateGray,
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    ),
  ]);
}

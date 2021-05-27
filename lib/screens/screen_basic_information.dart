import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/Model/gender.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_write_pitch_or_provide_ratings.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:pitch_app/widgets/textfield_rounded.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart' as globals;
class BasicInformationScreen extends StatefulWidget {
  @override
  _BasicInformationScreenState createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  
  List<Gender> genders = [];

  
  @override
  void initState() {
    super.initState();
    globals.interestedIn='Man Interested in men';
    genders.add(
        new Gender(name:  'Man Interested in women', isSelected: false));
     genders.add(
        new Gender(name:  'Woman Interested in men', isSelected: false));
         genders.add(
        new Gender(name:  'Man Interested in men', isSelected: true));
         genders.add(
        new Gender(name:  'Woman Interested in women', isSelected: false));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left:10,right:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              "Basic Information"
              .text
              .xl
              .fontWeight(FontWeight.bold)
              .make()
              .box
              .alignTopCenter
              .height(ConfigSize.convertHeight(context, 50))
              .make(),
              

              label("First Name"),
              // infoTextField(),
              RoundedTextField(),
              SizedBox(
                height: ConfigSize.blockSizeVertical*1,
              ),
              
              label("I am a:"),
              RoundedTextField(
                hint: globals.interestedIn,
              ),
              // infoTextField(),
              SizedBox(
                height: ConfigSize.blockSizeVertical*1,
              ),

              
              label('Birthday:'),
              RoundedTextField(hint: 'Date of Birth'),
              // infoTextField(),
              SizedBox(
                height: ConfigSize.blockSizeVertical*1,
              ),

              
              label("Email Address:"),
              RoundedTextField(hint: 'name@email.com'),

              SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),

              Center(
                child: StretchedColorButton(
                  text: "Continue",
                  onPressed: () {
                    context.push((context) => WritePitchOrProvideRatingsScreen());
                  },
                  height: 36,
                  width: ConfigSize.convertWidth(context, 300),
                  color: Colors.blue
                ),
              ),
              SizedBox(
                height: ConfigSize.blockSizeVertical*2,
              ),
              Container(
                alignment: Alignment.center,
                height: ConfigSize.blockSizeVertical*17,
                // width: ConfigSize.blockSizeHorizontal * 77,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: genders.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          genders.forEach((gender) => gender.isSelected = false);
                          genders[index].isSelected = true;
                          globals.interestedIn=genders[index].name;

                          //print
                          print(globals.interestedIn);
                        });
                      },
                      child: InterestedInCard(genders[index]),
                    );
                  }),
                // InterestedInSelector(),
              ),
            ],
          ),
        ),
      )
    );
  }
}
Widget label(String text)
{
  return text
  .text
  .align(TextAlign.left)                
  .fontWeight(FontWeight.bold)
  .make()
  .box
  .alignTopLeft
  .make()
  .pSymmetric(h: 10, v: 3);
            
}



Widget infoTextField({String hintText}){
  return Container(
    height: ConfigSize.blockSizeVertical*5,
        padding: EdgeInsets.only(left:20, right:20),
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
        color: grayTextField,
        elevation: 0,
          child: TextField(
            onChanged: (value) {
            //Do something with the user input.
            },
            minLines: 2, 
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left:12),
              // contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText:hintText,
              hintStyle: TextStyle(
                fontSize: 12,
                ),
              border: InputBorder.none,
            ),
          ),
        ),
      );
}


class InterestedInCard extends StatelessWidget {
  Gender _gender;
  InterestedInCard(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
        color: _gender.isSelected?grayTextField:null,
        elevation: 0,
        child:Text(_gender.name,
        textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: _gender.isSelected?FontWeight.bold:FontWeight.normal,
        ),
      ),
    );
  }
}



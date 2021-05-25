import 'package:flutter/material.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_grant_access.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../colors.dart';

class WhatsYourPitchScreen extends StatefulWidget {
  @override
  _WhatsYourPitchScreenState createState() => _WhatsYourPitchScreenState();
}

class _WhatsYourPitchScreenState extends State<WhatsYourPitchScreen> {
  ConfigSize configSize = ConfigSize();
  List<String> suggestedTopics = [
    "Why you think he's great",
    "Energy level",
    "What he loves to do",
    "What to expect on a date with him",
    "His Life style, Animal lover",
    "Desire to settle down",
    "Why you're not dating him",
    "What are some possible deal breakers",
    "What he does for a living",
    "What type is he? Athletic, serious,\nacademic,hippie, thrill etc"
  ];
  @override
  Widget build(BuildContext context) {
    configSize.init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: VStack([
                "what’s your pitch?"
                    .text
                    .xl
                    .bold
                    .make()
                    .box
                    .alignCenter
                    .height(ConfigSize.convertHeight(context, 50))
                    .make(),
                "Make a pitch for your single guy friend, so other women can hear that how great he is! We suggest it to do from the heart,as if you are telling a girlfriend why she should date him and other issus that you know that other women should know about."
                    .text
                    .size(13)
                    .make()
                    .pSymmetric(h: 24, v: 8),
                "Suggested topics if you are getting difficulties to describe him:\n"
                    .text
                    .size(13)
                    .make()
                    .pSymmetric(
                      h: 24,
                    ),
                _textWithBullet(suggestedTopics[0]),
                _textWithBullet(suggestedTopics[1]),
                _textWithBullet(suggestedTopics[2]),
                _textWithBullet(suggestedTopics[3]),
                _textWithBullet(suggestedTopics[4]),
                _textWithBullet(suggestedTopics[5]),
                _textWithBullet(suggestedTopics[6]),
                _textWithBullet(suggestedTopics[7]),
                _textWithBullet(suggestedTopics[8]),
                _textWithBullet(suggestedTopics[9]),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: ConfigSize.blockSizeHorizontal * 3,
                  right: ConfigSize.blockSizeHorizontal * 3),
              child: Card(
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: AppColors.greyColor)),
                elevation: 0,
                child: Scrollbar(
                  child: TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      hintText: 'Write something...',
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: "1500 Character Countdown"
                  .text
                  .xs
                  .make()
                  .pSymmetric(h: 24, v: 1),
            ),
            SizedBox(
              height: ConfigSize.blockSizeVertical * 5,
            ),
            StretchedColorButton(
                    text: "Save",
                    onPressed: () {
                      context.push((context) => GrantAccessScreen());
                    },
                    height: 36,
                    width: ConfigSize.convertWidth(context, 300),
                    color: AppColors.mainColor)
                .pOnly(bottom: 16)
          ],
        )));
  }
}

Widget _textWithBullet(String title) {
  return Container(
    child: HStack([
      _bullet(),
      SizedBox(width: 16),
      "$title".text.size(13).make(),
    ]),
  ).pSymmetric(h: 36);
}

Widget _bullet() {
  return new Container(
    height: 5.0,
    width: 5.0,
    decoration: new BoxDecoration(
      color: Vx.gray900,
      shape: BoxShape.circle,
    ),
  );
}

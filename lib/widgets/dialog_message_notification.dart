import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/messaging/screen_messaging.dart';
import 'package:pitch_app/widgets/stretched_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class MessageNotificationDialog extends StatefulWidget {
  String name;
  String url;
  String uid;
  MessageNotificationDialog(this.name, this.url, this.uid);

  @override
  _MessageNotificationDialogState createState() =>
      _MessageNotificationDialogState();
}

class _MessageNotificationDialogState extends State<MessageNotificationDialog> {
  String userid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readlocaldata();
  }

  readlocaldata() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    userid = _prefs.getString("currentUserId");
  }

  sendMessage(String otheruserid) {
    List<String> users = [userid, otheruserid];
    print(userid);

    String chatRoomId = getChatRoomId(userid, otheruserid);

    Map<String, dynamic> chatRoom = {
      "basicinfo": users,
      "chatRoomId": chatRoomId,
    };

    addChatRoom(chatRoom, chatRoomId);

    Get.to(MessagingScreen(chatRoomId, userid,widget.name,widget.url));
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: VStack(
                  [
                    'Notification'
                        .text
                        .align(TextAlign.center)
                        .bold
                        .white
                        .make()
                        .pSymmetric(v: 24),
                    'You\'ve received a notification from'
                        .text
                        .size(13)
                        .white
                        .make()
                        .pSymmetric(h: 16),
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.url),
                    ),
                    SizedBox(height: 10),
                    widget.name.text.white.size(13).make()
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
              StretchedButton(
                text: "Go to Inbox",
                onPressed: () {
                  sendMessage(widget.uid);
                },
                height: 36,
              )
            ],
          ),
        ).p16(),
      ),
    );
  }
}

Future<Widget> messageNotificationDialog(
    BuildContext context, String name, String url, String uid) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.grey.withOpacity(0.1),
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: MessageNotificationDialog(name, url, uid),
        );
      });
}

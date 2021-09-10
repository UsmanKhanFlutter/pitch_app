import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pitch_app/CustomColors/all_colors.dart';
import 'package:pitch_app/GlobalVariables/global_fonts.dart';
import 'package:pitch_app/GlobalVariables/globals_variable.dart';
import 'package:pitch_app/colors.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/messaging/components/bottom_sheet_safety_toolkit.dart';
import 'package:pitch_app/screens/messaging/videoplayer.dart';
import 'package:pitch_app/screens/screen_upload_photos_of_your_guy_friend.dart';
import 'package:pitch_app/widgets/stretched_color_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:video_player/video_player.dart';
import 'package:thumbnails/thumbnails.dart';

class MessagingScreen extends StatefulWidget {
  String userId;
  String chatRoomId;
  String otherusername;
  String imageUrl;
  String otheruserid;

  MessagingScreen(this.chatRoomId, this.userId, this.otherusername,
      this.imageUrl, this.otheruserid);
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  String username;
  Stream chatRooms;
  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ConfigSize configSize = ConfigSize();
  final firestoreInstance = FirebaseFirestore.instance;
  ScrollController _scrollController;
  String urlOfImage = "";
  String videoUrl = "";

  final picker = ImagePicker();
  File image;
  File video;
  ChewieController _chewieController;
  VideoPlayerController videoPlayerController;
  int imageInProgress = 0;
  int videoInProgress = 0;
  double progress = 0.0;

  Future pickimage() async {
    // var imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final imageFile = await picker.getImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    setState(() => imageInProgress = 1);
    File croppedFile = await FlutterNativeImage.compressImage(imageFile.path,
        quality: 70, percentage: 70);

    firebase_storage.Reference reference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("chatFiles/${Path.basename(imageFile.path)}");
    firebase_storage.UploadTask uploadTask = reference.putFile(croppedFile);
    firebase_storage.TaskSnapshot storageTaskSnapshot = await uploadTask
        .whenComplete(() => setState(() => imageInProgress = 2));
    // if (storageTaskSnapshot.bytesTransferred ==
    //     storageTaskSnapshot.totalBytes) {
    //   print('jjjjjjjjjjjjjjjjjjj');
    // }
    urlOfImage =
        await storageTaskSnapshot.ref.getDownloadURL().whenComplete(() {
      if (imageFile != null) {
        setState(() {
          image = File(imageFile.path);
        });
      }
    });

    // addUserImageToFirestore(urlOfImage: urlOfImage);

    // String id = await globals.functionUserId();
    // print("????????????????????????????????????????????????????");
    // print(id.toString());
    print("image uploaded");
  }

  String thumbPath;
  Future pickvideo() async {
    // var imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
    final imageFile = await picker.getVideo(source: ImageSource.gallery);

    if (imageFile == null) return;

    String path = await _getImage(imageFile.path);
    print(path);
    thumbPath = path;
    setState(() => videoInProgress = 1);
    firebase_storage.Reference reference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("chatFiles/${Path.basename(imageFile.path)}");
    firebase_storage.UploadTask uploadTask =
        reference.putFile(File(imageFile.path));
    uploadTask.snapshotEvents.listen((event) {
      double prog = (event.bytesTransferred.toDouble() /
          event.totalBytes.toDouble()); // *
      // 100;
      setState(() => progress = prog);
    });
    firebase_storage.TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => setState(() {
              progress = 0.0;
              videoInProgress = 2;
            }));

    videoUrl =
        await storageTaskSnapshot.ref.getDownloadURL().whenComplete(() async {
      if (imageFile != null) {
        setState(() {
          video = File(imageFile.path);
        });
      }
    });

    // addUserImageToFirestore(urlOfImage: urlOfImage);

    // String id = await globals.functionUserId();
    // print("????????????????????????????????????????????????????");
    // print(id.toString());
  }

  _getImage(String videoPath) async {
    String thumb = await Thumbnails.getThumbnail(
        videoFile: videoPath, imageType: ThumbFormat.PNG, quality: 30);
    return thumb;
  }

  getUserName() {
    FirebaseFirestore.instance
        .collection("basicinfo")
        .doc(widget.userId)
        .get()
        .then((doc) {
      setState(() {
        username = doc.data()["name"];
      });
      print(username);
      print("aaaaaaaaaaaaaa");
    });
  }

  void messageslist() {
    firestoreInstance
        .collection("messageslist")
        .doc(widget.userId)
        .collection("contacts")
        .doc(widget.otheruserid)
        .set({
      "name": widget.otherusername,
      "imageurl": widget.imageUrl,
      "chatroomid": widget.chatRoomId,
      "otheruserid": widget.otheruserid,
      "currentuserid": widget.userId
    });
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return snapshot.data.docs[index]["message"] != ""
                      ? MessageTile(
                          message: snapshot.data.docs[index]["message"],
                          sendByMe: widget.userId ==
                              snapshot.data.docs[index]["sendBy"],
                        )
                      : snapshot.data.docs[index]["imageurl"] != ""
                          ? Container(
                              margin: EdgeInsets.only(left: 150, bottom: 10),
                              height: 220,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data.docs[index]["imageurl"],
                                      ),
                                      fit: BoxFit.fill)),
                            )
                          : snapshot.data.docs[index]["videourl"] != ""
                              ? Container(
                                  margin: EdgeInsets.only(left: 20, bottom: 10),
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.file(
                                          File(
                                            snapshot.data.docs[index]
                                                ["thumbnail"],
                                          ),
                                          fit: BoxFit.fill),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (context) => VideoItems(
                                                            videoPlayerController:
                                                                VideoPlayerController
                                                                    .network(snapshot
                                                                            .data
                                                                            .docs[index]
                                                                        [
                                                                        "videourl"],),
                                                            autoplay: true,
                                                          )));
                                        },
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 70,
                                        ),
                                      )
                                    ],
                                  ))
                              : MessageTile(
                                  message: snapshot.data.docs[index]["message"],
                                  sendByMe: widget.userId ==
                                      snapshot.data.docs[index]["sendBy"],
                                );
                })
            : Container();
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": widget.userId,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        "revieverid": widget.otheruserid,
        "sendusername": username,
        "imageurl": urlOfImage,
        "videourl": videoUrl
      };

      addmessage(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
        urlOfImage = "";
        image = null;
        video = null;
        videoUrl = "";
      });
    } else if (image != null) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": widget.userId,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        "revieverid": widget.otheruserid,
        "sendusername": username,
        "imageurl": urlOfImage,
        "videourl": videoUrl
      };
      addmessage(widget.chatRoomId, chatMessageMap);
      setState(() {
        urlOfImage = "";
        image = null;
        video = null;
        videoUrl = "";
        imageInProgress = 0;
      });
    } else if (video != null) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": widget.userId,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        "revieverid": widget.otheruserid,
        "sendusername": username,
        "imageurl": urlOfImage,
        "videourl": videoUrl,
        "thumbnail": thumbPath
      };
      addmessage(widget.chatRoomId, chatMessageMap);
      setState(() {
        urlOfImage = "";
        image = null;
        video = null;
        videoUrl = "";
        videoInProgress = 0;
        thumbPath = null;
      });
    }
  }

  Future<void> addmessage(String chatRoomId, chatMessageData) async {
    await FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
    urlOfImage = "";
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: widget.userId)
        .snapshots();
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time', descending: true)
        .snapshots();
  }

  getUserInfogetChats() async {
    getUserChats(widget.userId).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${widget.userId}");
      });
    });
  }

  readlocaldata() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    widget.userId = _prefs.getString("currentUserId");
  }

  showAttachmentBottomSheet(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.white,
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Image'),
                    onTap: () {
                      Navigator.pop(context);
                      pickimage();
                    }),
                ListTile(
                    leading: Icon(Icons.videocam),
                    title: Text('Video'),
                    onTap: () {
                      Navigator.pop(context);

                      pickvideo();
                    }),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserInfogetChats();
    getUserName();
    readlocaldata();
    print(userid);

    getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    configSize.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: "Message".text.fontWeight(FontWeight.w400).black.make(),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            // size: 18,
            color: Color(0xFF3a3737),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.security,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {
                _scaffoldKey.currentState.showBottomSheet(
                  (context) => SafetyToolkitBottomSheet(
                    context.screenHeight * 0.4,
                  ),
                );
              })
        ],
      ),

      // Navigation bar
      // bottomNavigationBar: BottomNavigation(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //App bar

          SizedBox(
            height: ConfigSize.blockSizeVertical * 2,
          ),

          Container(
              height: ConfigSize.blockSizeVertical * 60,
              width: ConfigSize.blockSizeHorizontal * 80,
              child: chatMessages()),
          SizedBox(
            height: ConfigSize.blockSizeVertical * 5,
          ),
          MessageTextArea(
              () {
                addMessage();
                messageslist();
              },
              messageEditingController,
              () {
                showAttachmentBottomSheet(context);
              }),
          // image != null
          // videoInProgress==2?Container(

          // ):
          videoInProgress == 1 || videoInProgress == 2
              ? Container(
                  height: 70,
                  width: 90,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (thumbPath != null) Image.file(File(thumbPath)),
                      // CircularProgressIndicator(),
                      if (videoInProgress != 2)
                        CircularProgressIndicator(
                          value: progress,
                          valueColor: AlwaysStoppedAnimation(Colors.red),
                        )
                    ],
                  ))
              : Container(),

          imageInProgress == 2
              ? Container(
                  height: 70,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(image),
                    ),
                  ),
                )
              : imageInProgress == 1
                  ? CircularProgressIndicator()
                  : Container()
        ]),
      ),
    );
  }
}

getChats(String chatRoomId) async {
  return FirebaseFirestore.instance
      .collection("chatRoom")
      .doc(chatRoomId)
      .collection("chats")
      .orderBy('time')
      .snapshots();
}

class MessageTextArea extends StatefulWidget {
  VoidCallback onpressed;
  VoidCallback onpressed1;
  TextEditingController text;
  MessageTextArea(this.onpressed, this.text, this.onpressed1);

  @override
  _MessageTextAreaState createState() => _MessageTextAreaState();
}

class _MessageTextAreaState extends State<MessageTextArea> {
  // Future<bool> addUserImageToFirestore({String urlOfImage}) async {
  //   //use firebase to store user information
  //   FirebaseFirestore.instance
  //       .collection('chatRoom')
  //       .doc(MessagingScreen(null, null, null, null, null).chatRoomId)
  //       .collection("chats")
  //       .add({"imageurl": urlOfImage});

  //   //return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        side: BorderSide(color: grayborder),
      ),
      elevation: 0,
      child: Scrollbar(
        child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
          Container(
            child: TextField(
              controller: widget.text,
              minLines: 2,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: 'Write something...',
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(onTap: widget.onpressed1, child: Icon(Icons.attach_file)),
              StretchedColorButton(
                text: "Send",
                color: AppColors.lightGreen,
                width: ConfigSize.blockSizeHorizontal * 15,
                height: ConfigSize.blockSizeVertical * 4,
                onPressed: widget.onpressed,
              ).pSymmetric(h: 16, v: 8),
            ],
          ),
        ]),
      ),
    );
  }
}

Widget recievedMessageContainer({String message}) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
          backgroundColor: Vx.white,
          radius: 20.0,
          backgroundImage: AssetImage(
            'assets/images/girl.png',
          )),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(color: lightGray),
        ),
        color: lightGray,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          alignment: Alignment.centerLeft,
          height: 40,
          width: ConfigSize.blockSizeHorizontal * 50,
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
    ],
  ));
}

Widget sentMessageContainer({String message}) {
  print("presseeeedddd");
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Card(
        color: red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(color: grayborder),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          alignment: Alignment.centerLeft,
          // height: 40,
          child: Text(
            message,
            style: TextStyle(
                color: Vx.white, fontSize: 12, fontFamily: defaultFontFamily),
          ),
        ),
      ),
      CircleAvatar(
          backgroundColor: Vx.white,
          radius: 20.0,
          backgroundImage: AssetImage(
            'assets/images/girl.png',
          )),
    ],
  ));
}

Widget sendButton() {
  return Container(
      width: ConfigSize.blockSizeHorizontal * 23,
      height: ConfigSize.blockSizeVertical * 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: AppColors.lightGreen),
      child: Builder(builder: (BuildContext context) {
        return MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(90.0))),
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
            onPressed: () {
              context.push((context) => UploadPhotosScreen());
            });
      }));
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  MessageTile({@required this.message, @required this.sendByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe
                  ? [Colors.red, Colors.red]
                  : [Colors.green, Colors.green],
            )),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}

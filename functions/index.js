const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendNotification = functions.firestore.document(
    "chatRoom/{currentUserId1}/{currentUserId2}/{chats}"
).onCreate((snap, context)=> {
  console.log("----------------start function--------------------");
  
  const msgInfo = snap.data();
  console.log(msgInfo);
  
  
  const senderUserName=msgInfo.sendusername;
  const idTo = msgInfo.revieverid;
  const contentMessage = msgInfo.message;
  
  admin.firestore().collection("basicinfo").where(
      "userid", "==", idTo
  ).get().then((querySnapshot) => {
    querySnapshot.forEach((userTo) => {
      console.log(userTo.data().name);
      console.log("pushToken");
      pushToken = userTo.data().pushToken;
      console.log(pushToken);
    });
      var payload = {
        notification: {
         title:senderUserName,
          body: contentMessage,
          badge: "1",
          sound: "default",
        },
      };
      return admin.messaging().sendToDevice(pushToken, payload)
      .then((response) => {
        console.log("Successfully sent message:", response);
      });
  });
});

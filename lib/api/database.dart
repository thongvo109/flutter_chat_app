import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  updateUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  getUserByUserName(String userName) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: userName)
        .get();
  }

  createChatRoom(String chartRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chatroom")
        .doc(chartRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}

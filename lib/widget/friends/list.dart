import 'package:chatweb/api/database.dart';
import 'package:chatweb/widget/friends/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListFriends extends StatefulWidget {
  @override
  _ListFriendsState createState() => _ListFriendsState();
}

class _ListFriendsState extends State<ListFriends> {
  TextEditingController controller;
  String userName;
  DatabaseMethods databaseMethods = DatabaseMethods();
  QuerySnapshot searchSnapshot;
  @override
  void initState() {
    super.initState();
    initSearch();
    controller = TextEditingController();
    userName = '';
  }

  initSearch() async {
    await databaseMethods.getUserByUserName(userName).then((value) {
      print(value);
      setState(() {
        print(value);
        searchSnapshot = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (context, index) {
              return FriendItem(
                name: searchSnapshot.docs[index].data()['name'],
                email: searchSnapshot.docs[index].data()['email'],
                onPresed: () {},
              );
            },
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    initSearch();
                  },
                  icon: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Find user',
              ),
            ),
          ),
          Expanded(
            child: searchList(),
          ),
        ],
      ),
    );
  }
}

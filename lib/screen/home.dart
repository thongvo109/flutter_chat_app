import 'dart:html';

import 'package:chatweb/api/auth.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:chatweb/widget/chat/chat.dart';
import 'package:chatweb/widget/friends/list.dart';
import 'package:chatweb/widget/info/info.dart';
import 'package:chatweb/widget/layout/button_primary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<AuthApi>().getUser;
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthApi>().signOut();
                  Navigator.canPop(context);
                })
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: ListFriends(),
              ),
              Flexible(
                flex: 9,
                child: ChatBox(),
              ),
              Flexible(
                flex: 3,
                child: InfoChat(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text('You do not have access'),
          SizedBox(
            width: 5,
          ),
          ButtonPrimary(
            color: Colors.redAccent,
            label: 'Come back',
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}

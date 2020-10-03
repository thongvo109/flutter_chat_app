import 'package:chatweb/api/auth.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<AuthApi>().getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                context.read<AuthApi>().signOut();
              })
        ],
      ),
      body: Container(
        child: Text('${user.userId}'),
      ),
    );
  }
}

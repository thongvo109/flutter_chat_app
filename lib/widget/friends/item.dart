import 'package:chatweb/widget/layout/constant.dart';
import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  final String name;
  final String email;
  final Function onPresed;
  FriendItem({this.email, this.name, this.onPresed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$name'),
      subtitle: Text('$email'),
      trailing: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        color: kColorPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPresed,
        child: Text(
          'Message',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

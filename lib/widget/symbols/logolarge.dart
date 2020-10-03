import 'package:flutter/material.dart';

class LogoLarge extends StatelessWidget {
  final String assetString;
  LogoLarge({this.assetString = 'images/login.png'});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Image.network(assetString),
      ),
    );
  }
}

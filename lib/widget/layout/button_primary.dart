import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final double height;
  final Function onPressed;
  final String label;
  final Color color;
  final double radius;

  ButtonPrimary({
    this.height = 50,
    this.onPressed,
    this.label,
    this.color,
    this.radius = 20,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: color,
        child: Text(
          '$label',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

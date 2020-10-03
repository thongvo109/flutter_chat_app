import 'package:chatweb/widget/layout/indicator.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String text;

  LoadingDialog({
    this.text = 'Loading',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      content: Container(
        width: 250.0,
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Indicator(
              size: 16,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "OpenSans",
                color: Color(0xFF5B6978),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String text;

  SuccessDialog({
    this.text = 'Succeed.',
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
        height: 200.0,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 64,
                color: Color(0xFF52B24D),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Color(0xFF5B6978),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

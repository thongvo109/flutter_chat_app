import 'package:chatweb/widget/layout/button_primary.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String userName;
  String passWord;
  TextEditingController controllerUserName;
  TextEditingController controllerPassWord;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerUserName = TextEditingController();
    controllerPassWord = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Input Username',
            icon: Icon(Icons.account_box),
          ),
          controller: controllerUserName,
          onChanged: (value) {
            setState(() {
              userName = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: 'Input Password', icon: Icon(Icons.vpn_key)),
          controller: controllerPassWord,
          onChanged: (value) {
            setState(() {
              passWord = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        ButtonPrimary(
          color: Colors.blueAccent,
          label: 'Submit',
          onPressed: () {
            print(passWord);
          },
        ),
      ],
    );
  }
}

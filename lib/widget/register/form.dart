import 'package:chatweb/api/auth.dart';
import 'package:chatweb/api/database.dart';
import 'package:chatweb/mixins/dialog_widget.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:chatweb/repository/login_repository.dart';
import 'package:chatweb/widget/layout/button_primary.dart';
import 'package:chatweb/widget/layout/constant.dart';
import 'package:chatweb/widget/layout/indicator.dart';
import 'package:chatweb/widget/symbols/logolarge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with DialogMixin {
  TextEditingController controllerEmail;
  TextEditingController controllerUserName;
  TextEditingController controllerPassWord;
  String email;
  String userName;
  String passWord;
  UserModel user;
  Flushbar flush;
  bool isLoading;
  DatabaseMethods databaseMethods = DatabaseMethods();
  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerPassWord = TextEditingController();
    controllerUserName = TextEditingController();
    email = '';
    passWord = '';
    userName = '';
    user = null;
  }

  void doLogin() async {
    showProcessingDialog(context);
    UserModel userModel = await LoginRepository().signUp(
      email: email,
      passWord: passWord,
    );
    hideDialog(context);
    if (userModel.apiError == null) {
      Map<String, dynamic> userInfoMap = {
        "name": userName,
        "email": email,
      };
      databaseMethods.updateUserInfo(userInfoMap);
      showSuccessDialog(context);
      await Future.delayed(Duration(seconds: 1));
      hideDialog(context);
      Navigator.pushNamed(context, '/home');
    } else {
      flush = Flushbar(
          borderRadius: 8,
          margin: EdgeInsets.all(10),
          flushbarPosition: FlushbarPosition.TOP,
          title: 'Alert',
          flushbarStyle: FlushbarStyle.FLOATING,
          backgroundColor: Colors.red,
          message: '${userModel.apiError.message}',
          isDismissible: false,
          duration: Duration(
            seconds: 1,
          ),
          onTap: (Flushbar obj) {
            flush.dismiss(true);
          })
        ..show(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerPassWord.dispose();
    controllerUserName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoLarge(assetString: 'images/register.png'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Input Username',
                icon: Icon(Icons.person),
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
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Input Email',
                icon: Icon(Icons.account_box),
              ),
              controller: controllerEmail,
              onChanged: (value) {
                setState(() {
                  email = value;
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
              color: kColorPrimary,
              label: 'Register',
              onPressed: () {
                doLogin();
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

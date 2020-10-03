import 'package:chatweb/mixins/dialog_widget.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:chatweb/repository/login_repository.dart';
import 'package:chatweb/widget/layout/button_primary.dart';
import 'package:chatweb/widget/layout/constant.dart';
import 'package:chatweb/widget/layout/indicator.dart';
import 'package:chatweb/widget/symbols/logolarge.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with DialogMixin {
  TextEditingController controllerUserName;
  TextEditingController controllerPassWord;
  String email;
  String passWord;
  UserModel user;
  Flushbar flush;
  bool isLoading;
  @override
  void initState() {
    super.initState();
    controllerUserName = TextEditingController();
    controllerPassWord = TextEditingController();
    email = '';
    passWord = '';
    user = null;

    isLoading = false;
  }

  void doLogin() async {
    showProcessingDialog(context);
    await Future.delayed(Duration(seconds: 1));
    UserModel userModel = await LoginRepository().login(
      email: email,
      passWord: passWord,
    );
    hideDialog(context);
    if (userModel.apiError == null) {
      setState(() {
        isLoading = false;
        user = userModel;
      });
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
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoLarge(),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Input Username',
                icon: Icon(Icons.account_box),
              ),
              controller: controllerUserName,
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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('You do not have an account'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Register now',
                    style: TextStyle(color: kColorPrimary),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonPrimary(
              color: kColorPrimary,
              label: 'Login',
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

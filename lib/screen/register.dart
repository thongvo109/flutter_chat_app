import 'package:chatweb/widget/register/form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Register'),
      ),
      body: RegisterForm(),
    );
  }
}

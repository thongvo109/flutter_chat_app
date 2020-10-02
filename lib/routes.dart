import 'package:chatweb/screen/home.dart';
import 'package:chatweb/screen/login.dart';
import 'package:chatweb/screen/register.dart';
import 'package:chatweb/screen/welcome.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> data = {
    '/': (context) => WelcomeScreen(),
    '/home': (context) => HomeScreen(),
    '/register': (context) => RegisterScreen(),
    '/login': (context) => LoginScreen(),
  };
}

import 'package:chatweb/routes.dart';
import 'package:chatweb/screen/home.dart';
import 'package:chatweb/screen/mainapp.dart';
import 'package:chatweb/screen/welcome.dart';
import 'package:chatweb/widget/layout/restart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.data,
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}

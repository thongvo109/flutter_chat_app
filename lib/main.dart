import 'package:chatweb/api/auth.dart';
import 'package:chatweb/model/user_model.dart';
import 'package:chatweb/routes.dart';
import 'package:chatweb/screen/check.dart';
import 'package:chatweb/screen/error.dart';
import 'package:chatweb/screen/home.dart';
import 'package:chatweb/screen/login.dart';
import 'package:chatweb/screen/register.dart';
import 'package:chatweb/screen/welcome.dart';
import 'package:chatweb/widget/layout/constant.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthApi(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<AuthApi>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.data,
        title: 'Flutter Demo',
        initialRoute: '/',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
      ),
    );
  }

  Iterable<Locale> getLocales() {
    return [
      const Locale('vi', ''),
    ];
  }
}

class CheckScreen extends StatelessWidget {
  CheckScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

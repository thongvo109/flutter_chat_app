import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefProvider {
  static String keyLoggedInKey = 'isLogined';
  static String userNameKey = 'userNameKey';
  static String userEmailKey = 'userEmailKey';

  static Future<bool> saveLogged(bool isUserLogged) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(keyLoggedInKey, isUserLogged);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmailKey, userEmail);
  }

  static Future<bool> getLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(keyLoggedInKey);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(userNameKey);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(userEmailKey);
  }
}

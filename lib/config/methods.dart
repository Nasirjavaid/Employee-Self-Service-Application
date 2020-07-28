import 'dart:convert';

import 'package:ess_application/model/userLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Methods {
  //Url Launcher
  static launchURL() async {
    const url = 'https://www.visionplus.com.pk/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //Storing user information in shared prefrences
  static storeUserToSharedPref(UserLogin userLogin) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();

    String user = jsonEncode(userLogin.toJson());

    print("User object Stored in  shared pref :: $user");
    shared_User.setString('user', user);
  }

//getting user information from shared pefrences
  static Future<bool> getUserFromSharedPref() async {
    // SharedPreferences sharedUser = await SharedPreferences.getInstance();
    UserLogin userLogin = await userInfoStoredInsharedPrefrences();
    try {
      //  Map userMap = jsonDecode(sharedUser.getString('user'));

      if (!userLogin.checkIfAnyIsNull()) {
        return true;
      }
    } catch (ex) {
      print("Exception in Shared prefrences $ex");
      return false;
    }
    return false;
  }

  static Future<UserLogin> userInfoStoredInsharedPrefrences() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    UserLogin userLogin = UserLogin();
    Map userMap;

    try {
      userMap = jsonDecode(sharedUser.getString('user'));
      
      if (userMap.length.isNegative) {
        return userLogin;
      } else {
        userLogin = UserLogin.fromJson(userMap);
        print(
            "Returned User info by shared prefrences   ${userLogin.empName} ");
        return userLogin;
      }
    } catch (ex) {
      return userLogin;
    }
  }
}

mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue?.isEmpty ?? true;

  bool validateEmailAddress(String email) {
    if (email == null) {
      return false;
    }

    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return false;
    } else {
      if (!regex.hasMatch(value))
        return false;
      else
        return true;
    }
  }
}

//validating login fields
enum FieldError { Empty, Invalid }

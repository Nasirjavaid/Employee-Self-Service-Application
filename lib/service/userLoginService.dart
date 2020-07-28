import 'dart:convert';
import 'package:ess_application/config/appConstants.dart';
import 'package:ess_application/http/HttpService.dart';
import 'package:ess_application/model/userLogin.dart';

import 'package:http/http.dart' as http;

class UserLoginService {
  Future<UserLogin> getUser(String username, password) async {
    UserLogin usersLogin;

    HttpService httpService = new HttpService.internal();
    

    final http.Response response =
        await httpService.getRequet(APIConstants.userLoginEndpoint);

    if (response.statusCode == 200) {
      print("response body  in user login: ${response.body}");

      var json = jsonDecode(response.body);

      usersLogin = UserLogin.fromJson(json);
    } else {
      throw Exception("UserLogin service: Failed to get User");
    }

    return usersLogin;
  }
}

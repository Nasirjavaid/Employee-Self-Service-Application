import 'package:ess_application/config/methods.dart';
import 'package:ess_application/model/userLogin.dart';
import 'package:ess_application/service/userLoginService.dart';
import 'package:meta/meta.dart';

class UserAuthRepository {
  UserLoginService userLoginService = UserLoginService();
  UserLogin userLogin;

// Autneticating user by user name and password
  Future<UserLogin> authenticate({
    @required String username,
    @required String password,
  }) async {
    userLogin = await userLoginService.getUser(username, password);
    return userLogin;
  }

//deleteing the token on log out
  Future<void> deleteToken() async {
    // await Future.delayed(Duration(seconds: 1),
    UserLogin userLoginNull = new UserLogin();


    
    Methods.storeUserToSharedPref(userLoginNull);

    //);
    return;
  }

//writing user token to shared prefrences
  Future<void> persistToken(UserLogin userLogin) async {
    // await Future.delayed(Duration(seconds: 1));

    Methods.storeUserToSharedPref(userLogin);
    return;
  }

//check if user already logged in
  Future<bool> hasToken() async {
    bool token = await Methods.getUserFromSharedPref();

    if (token) {
      return true;
    }

    return false;
  }
}

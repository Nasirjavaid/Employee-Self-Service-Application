import 'package:ess_application/config/methods.dart';
import 'package:ess_application/model/userLogin.dart';

class UserProfileRepository {
//check if user already logged in
  Future<UserLogin> getUserInormation() async {
   
    UserLogin userLogin = UserLogin();

    userLogin = await Methods.userInfoStoredInsharedPrefrences();

    print(
        "User profile screen data in userProfile repositiry ${userLogin.empName}");

    if (!userLogin.checkIfAnyIsNull()) {
      return userLogin;
    }

    return null;
  }
}

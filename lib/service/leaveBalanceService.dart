import 'dart:convert';
import 'package:ess_application/config/appConstants.dart';
import 'package:ess_application/http/HttpService.dart';
import 'package:ess_application/model/leaveBalance.dart';

import 'package:http/http.dart' as http;

class LeaveBalanceService {
  Future<LeaveBalance> geleaveBalance() async {
    LeaveBalance leaveBalance;

    HttpService httpService = new HttpService.internal();
    

    final http.Response response =
        await httpService.getRequet(APIConstants.leaveBalanceEndpoint);

    if (response.statusCode == 200) {
      print("response body  in leave balance service: ${response.body}");

      var json = jsonDecode(response.body);

      leaveBalance = LeaveBalance.fromJson(json);
    } else {
      throw Exception("Leave Balance Service: Failed to user's leave balance");
    }

    return leaveBalance;
  }
}

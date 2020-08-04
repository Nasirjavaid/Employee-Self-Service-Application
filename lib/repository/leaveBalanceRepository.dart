import 'package:ess_application/model/leaveBalance.dart';
import 'package:ess_application/service/leaveBalanceService.dart';

class LeaveBalanceRepository {
//check if user already logged in
  Future<LeaveBalance> geLeaveBalance() async {
    LeaveBalance leaveBalance = LeaveBalance();
    LeaveBalanceService leaveBalanceService = LeaveBalanceService();
    leaveBalance = await leaveBalanceService.geleaveBalance();

    print(
        "User leave balance data in Leave balance repository ${leaveBalance.annualEntitlement}");

    // if (!userLogin.checkIfAnyIsNull()) {
    //   return userLogin;
    // }

    return leaveBalance;
    ;
  }
}

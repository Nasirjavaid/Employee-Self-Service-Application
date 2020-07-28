import 'package:ess_application/config/methods.dart';
import 'package:ess_application/model/salarySlip.dart';
import 'package:ess_application/service/salarySlipService.dart';

class SalarySlipRepository {
  List<SalarySlip> salarySlipList = [];
  Future<List<SalarySlip>> getSalalrySlips(int startungPoint,int maxResults) async {
    SalalrySlipService salalrySlipService = SalalrySlipService();

    salarySlipList = await salalrySlipService.getSalarySlips(startungPoint,maxResults);

    print(
        "Salalry slip data in Salary slip Repository ${salarySlipList[0].salaryMonth}");

    if (salarySlipList.length != 0) {
      return salarySlipList;
    }

    return null;
  }
}

import 'dart:convert';
import 'package:ess_application/config/appConstants.dart';
import 'package:ess_application/http/httpService.dart';
import 'package:ess_application/model/salarySlip.dart';
import 'package:http/http.dart' as http;

class SalalrySlipService {

  HttpService httpService = new HttpService.internal();
  List<SalarySlip> salarySlipList = [];
  Future<List<SalarySlip>> getSalarySlips(int startingPoint,int maxResults) async {
    final http.Response response =
        await httpService.getRequet(APIConstants.salarySlipEndpoint);

    if (response.statusCode == 200) {

      print("response body  in Salary Slip Screen: ${response.body}");

      salarySlipList = (json.decode(response.body) as List)
          .map((i) => SalarySlip.fromJson(i))
          .toList();

      return salarySlipList;

    } else {
      throw Exception("Salary Slip service: Failed to get salalry slip list");
    }

  }
}

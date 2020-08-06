import 'dart:convert';
import 'package:ess_application/config/appConstants.dart';
import 'package:ess_application/http/httpService.dart';
import 'package:ess_application/model/leaveSummary.dart';
import 'package:http/http.dart' as http;

class LeaveSummaryService {

  HttpService httpService = new HttpService.internal();
  List<LeaveSummary> leaveSummaryList = [];
  Future<List<LeaveSummary>> getLeaveSummary(int startingPoint,int maxResults) async {
    final http.Response response =
        await httpService.getRequet(APIConstants.leaveSummaryEndpoint);

    if (response.statusCode == 200) {

      print("response body  in leave Summary: ${response.body}");

      leaveSummaryList = (json.decode(response.body) as List)
          .map((i) => LeaveSummary.fromJson(i))
          .toList();

      return leaveSummaryList;

    } else {
      throw Exception("Leave Summary service: Failed to get leave summary list");
    }

  }
}

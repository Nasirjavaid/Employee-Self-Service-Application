import 'package:ess_application/model/leaveSummary.dart';
import 'package:ess_application/service/leaveSummaryService.dart';


class LeaveSummaryRepository {
  List<LeaveSummary> leaveSummaryList = [];
  Future<List<LeaveSummary>> getLeaveSummary(int startingPoint,int maxResults) async {
    LeaveSummaryService leaveSummaryService = LeaveSummaryService();

    leaveSummaryList = await leaveSummaryService.getLeaveSummary(startingPoint,maxResults);

    print(
        "leave summary data in leave summary repository ${leaveSummaryList[0].leaveType}");

    if (leaveSummaryList.length != 0) {
      return leaveSummaryList;
    }

    return null;
  }
}

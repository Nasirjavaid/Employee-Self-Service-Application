import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/repository/leaveSummaryRepository.dart';
import 'package:flutter/material.dart';

class EmployeeLeaveBalalnceHistoryListView extends StatelessWidget {

  LeaveSummaryRepository leaveSummaryRepository;
  final List items = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
  ];
  @override
  Widget build(BuildContext context) {


    
    return Container(
      height: MediaQuery.of(context).size.height - 290,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 0, left: 12, right: 12),
          shrinkWrap: true,
        
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return listTile(context, index);
          }),
    );
  }

  Widget listTile(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0),
      child: InkWell(
        child: Column(
          children: [
            SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Material(
                          color: index % 2 == 0
                              ? AppTheme.pieChartBackgroundColor1
                              : index % 3 == 0
                                  ? AppTheme.pieChartBackgroundColor3
                                  : AppTheme.pieChartBackgroundColor2,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.calendar_today,
                                color: Colors.white, size: 15.0),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "05-12-2020",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "   To   ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  "07-12-2020",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "2 day - Casual leave",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            index % 2 == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                        color:
                                            AppTheme.pieChartBackgroundColor1,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1.5))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0,
                                          bottom: 2,
                                          left: 4,
                                          right: 4),
                                      child: Text(
                                        "Medical",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )
                                : index % 3 == 0
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: AppTheme
                                                .pieChartBackgroundColor3,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1.5))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0,
                                              bottom: 2,
                                              left: 4,
                                              right: 4),
                                          child: Text(
                                            "Annual",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: AppTheme
                                                .pieChartBackgroundColor2,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1.5))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0,
                                              bottom: 2,
                                              left: 4,
                                              right: 4),
                                          child: Text(
                                            "Casual",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                      ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            // Container(
                            //   height: 1,
                            //   width: MediaQuery.of(context).size.width - 100,
                            //   color: AppTheme.divideColor,
                            // )
                          ]),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}

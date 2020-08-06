import 'package:ess_application/bloc/leaveSummaryBloc/leaveSummaryBloc.dart';
import 'package:ess_application/bloc/leaveSummaryBloc/leaveSummaryEvent.dart';
import 'package:ess_application/bloc/leaveSummaryBloc/leaveSummaryState.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/model/leaveSummary.dart';
import 'package:ess_application/repository/leaveSummaryRepository.dart';
import 'package:ess_application/ui/commonWidgets/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeLeaveBalalnceHistoryListViewMain extends StatelessWidget {
  final LeaveSummaryRepository leaveSummaryRepository =
      LeaveSummaryRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return LeaveSummaryBloc(
              leaveSummaryRepository: leaveSummaryRepository)
            ..add(LeaveSummaryFetched());
        },
        child: EmployeeLeaveBalalnceHistoryListView(context));
  }
}

class EmployeeLeaveBalalnceHistoryListView extends StatefulWidget {
  final BuildContext context;
  EmployeeLeaveBalalnceHistoryListView(this.context);
  @override
  _EmployeeLeaveBalalnceHistoryListViewState createState() =>
      _EmployeeLeaveBalalnceHistoryListViewState();
}

class _EmployeeLeaveBalalnceHistoryListViewState
    extends State<EmployeeLeaveBalalnceHistoryListView> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  LeaveSummaryBloc leaveSummaryBloc;

  @override
  void dispose() {
   

    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState()  {
    super.initState();

   

    _scrollController.addListener(_onScroll);
    leaveSummaryBloc = BlocProvider.of<LeaveSummaryBloc>(context);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      leaveSummaryBloc.add(LeaveSummaryFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveSummaryBloc, LeaveSummaryState>(
      builder: (BuildContext context, state) {
        if (state is LeaveSummaryInProgressState) {
          return CommonWidgets.progressIndicator;
        }

        if (state is LeaveSummaryFailureState) {
          return Center(
            child: Text("No record Found"),
          );
        }

        if (state is LeaveSummarySuccessState) {
          return Container(
            height: MediaQuery.of(context).size.height - 290,
            child: ListView.builder(
                padding: EdgeInsets.only(top: 0, left: 12, right: 12),
                shrinkWrap: true,
                itemCount: state.hasReachedMax
                    ? state.leaveSummaryList.length
                    : state.leaveSummaryList.length + 1,
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.leaveSummaryList.length
                      ? Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: CommonWidgets.progressIndicator)
                      : listTile(context, state.leaveSummaryList[index]);
                }),
          );
        }
        return Center(
          child: Text('no items'),
        );
      },
    );

    //  Container(
    //   height: MediaQuery.of(context).size.height - 290,
    //   child: ListView.builder(
    //       padding: EdgeInsets.only(top: 0, left: 12, right: 12),
    //       shrinkWrap: true,

    //       itemCount: items.length,
    //       scrollDirection: Axis.vertical,
    //       itemBuilder: (BuildContext context, int index) {
    //         return listTile(context, index);
    //       }),
    // );
  }

  Widget listTile(BuildContext context, LeaveSummary leaveSummary) {
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
                          color: leaveSummary.leaveType.contains("Medical")
                              ? AppTheme.pieChartBackgroundColor1
                              : leaveSummary.leaveType.contains("Annual")
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
                            leaveSummary.leaveType.contains("Medical")
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
                                : leaveSummary.leaveType.contains("Annual")
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

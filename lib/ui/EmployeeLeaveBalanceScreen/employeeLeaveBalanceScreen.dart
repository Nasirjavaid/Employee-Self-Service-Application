import 'package:ess_application/bloc/leaveBalanceBloc/leaveBalanceBloc.dart';
import 'package:ess_application/bloc/leaveBalanceBloc/leaveBalanceEvent.dart';
import 'package:ess_application/bloc/leaveBalanceBloc/leaveBalanceState.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/model/leaveBalance.dart';
import 'package:ess_application/repository/leaveBalanceRepository.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmplloyeeLeaveBalanceDataTable.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmployeeLeaveBalanceHistoryListView.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmployeeLeaveBalancePieChart.dart';
import 'package:ess_application/ui/commonWidgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeLeaveBalanceScreen extends StatefulWidget {
  @override
  _EmployeeLeaveBalanceScreenState createState() =>
      _EmployeeLeaveBalanceScreenState();
}

class _EmployeeLeaveBalanceScreenState
    extends State<EmployeeLeaveBalanceScreen> {
  LeaveBalanceRepository leaveBalanceRepository = LeaveBalanceRepository();

  Map<String, double> pieCahartdataMap1 = Map();
  Map<String, double> pieCahartdataMap2 = Map();
  Map<String, double> pieCahartdataMap3 = Map();

  List<String> leaveStatusTypeDropDownFilterList = [
    'Approved',
    'Rejected',
    'Pending'
  ];

  String selectLeaveType = "Select type";

  @override
  void initState() {
    super.initState();
// // map values for pie chart 1
//     pieCahartdataMap1.putIfAbsent("Entitlement", () => 3.0);
//     pieCahartdataMap1.putIfAbsent("Available", () => 4);

// // map values for pie chart 2
//     pieCahartdataMap2.putIfAbsent("Entitlement", () => 4.1);
//     pieCahartdataMap2.putIfAbsent("Available", () => 2.1);

// // map values for pie chart 3
//     pieCahartdataMap3.putIfAbsent("Entitlement", () => 1.9);
//     pieCahartdataMap3.putIfAbsent("Available", () => 2.6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            // extendBodyBehindAppBar: true,
            backgroundColor: AppTheme.pieChartBackgroundColor,
            // drawerEnableOpenDragGesture: true,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
              elevation: 0,
              backgroundColor: AppTheme.drawerBackgroundColor2,
              title: Text(
                "Leave Balance",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            body: BlocProvider(
              create: (context) {
                return LeaveBalanceBloc(
                    leaveBlanceRepository: leaveBalanceRepository)
                  ..add(LeaveBalanceFetchDataEvent());
              },
              child: BlocBuilder<LeaveBalanceBloc, LeaveBalanceState>(
                builder: (BuildContext context, state) {
                  if (state is LeaveBalanceInProgresslState) {
                    return LoadingIndicator();
                  }
                  if (state is LeaveBalanceSuccessFulState) {
                    print(
                        " availed number in LeaveBalance ${state.leaveBalance.annualAvailed}");
                    return SingleChildScrollView(
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Pie cahrt views
                          piechartView(context, state.leaveBalance),

                          rowWithLeaveTextAndLeaveTypeFilter(context),
                          EmployeeLeaveBalalnceHistoryListView(),
                        ],
                      )),
                    );
                  }
                  if (state is LeaveBalanceFailureState) {
                    return Center(
                      child: Text("Nothing"),
                    );
                  }
                  return Container();
                },
              ),
            )));
  }

  Widget piechartView(BuildContext context, LeaveBalance leaveBalance) {

// map values for pie chart 1
    pieCahartdataMap1.putIfAbsent("AnnualAvailed", () => leaveBalance.annualAvailed.toDouble());
    pieCahartdataMap1.putIfAbsent("AnnualBalance", () => leaveBalance.annualBalance.toDouble());

// map values for pie chart 2
    pieCahartdataMap2.putIfAbsent("CasualAvailed", () =>leaveBalance.casualAvailed.toDouble());
    pieCahartdataMap2.putIfAbsent("CasualBalance", () => leaveBalance.casualBalance.toDouble());

// map values for pie chart 3
    pieCahartdataMap3.putIfAbsent("MedicalAvailed", () => leaveBalance.medicalAvailed.toDouble());
    pieCahartdataMap3.putIfAbsent("MedicalBalance", () => leaveBalance.medicalBalance.toDouble());



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmployeeLeaveBalanceDataTable(leaveBalance: leaveBalance),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EmployeeLeaveBalancePieChart(
                    pieCahrtColorList: AppTheme.pieCahrtColourList1,
                    dataMap: pieCahartdataMap1,
                    totalLeaves: leaveBalance.annualEntitlement != null ? leaveBalance.annualEntitlement : 0,
                    pieChartBackgroundColor: AppTheme.pieChartBackgroundColor3,
                    showLegendBit: false,
                    leaveTypeText: "Annual",
                  ),
                  EmployeeLeaveBalancePieChart(
                      pieCahrtColorList: AppTheme.pieCahrtColourList1,
                      dataMap: pieCahartdataMap2,
                      totalLeaves: leaveBalance.casualEntitlement != null ? leaveBalance.casualEntitlement : 0,
                      showLegendBit: false,
                      pieChartBackgroundColor:
                          AppTheme.pieChartBackgroundColor2,
                      leaveTypeText: "Casual"),
                  EmployeeLeaveBalancePieChart(
                    pieCahrtColorList: AppTheme.pieCahrtColourList1,
                    dataMap: pieCahartdataMap3,
                    totalLeaves: leaveBalance.medicalEntitlement != null ? leaveBalance.medicalEntitlement : 0,
                    showLegendBit: false,
                    leaveTypeText: "Medical",
                    pieChartBackgroundColor: AppTheme.pieChartBackgroundColor1,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: AppTheme.pieChart1Color1,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Availed",
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: AppTheme.pieChart1Color3,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Available",
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowWithLeaveTextAndLeaveTypeFilter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leaveSummaryText(),
        //  leaveTypeDropDownFilter(context)
      ],
    );
  }

  Widget leaveSummaryText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 16, bottom: 10),
      child: Text("Leave Summary",
          style: Theme.of(context).textTheme.title.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54)),
    );
  }

  Widget leaveTypeDropDownFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 40,
        // color: Colors.white,

        child: DropdownButton<String>(
          underline: Container(),

          icon: Icon(Icons.arrow_downward),
          iconSize: 20.0, // can be changed, default: 24.0
          iconEnabledColor: Colors.blue,
          iconDisabledColor: Colors.black38,
          hint: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$selectLeaveType",
                style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54)),
          ),
          items: leaveStatusTypeDropDownFilterList.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value,
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54)),
            );
          }).toList(),
          onChanged: (String value) {
            setState(() {
              selectLeaveType = value;
            });
          },
        ),
      ),
    );
  }
}

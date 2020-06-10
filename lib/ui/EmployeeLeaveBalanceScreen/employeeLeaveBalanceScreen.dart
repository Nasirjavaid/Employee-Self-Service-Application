import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmplloyeeLeaveBalanceDataTable.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmployeeLeaveBalanceHistoryListView.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmployeeLeaveBalancePieChart.dart';
import 'package:flutter/material.dart';


class EmployeeLeaveBalanceScreen extends StatefulWidget {
  @override
  _EmployeeLeaveBalanceScreenState createState() =>
      _EmployeeLeaveBalanceScreenState();
}

class _EmployeeLeaveBalanceScreenState
    extends State<EmployeeLeaveBalanceScreen> {
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
// map values for pie chart 1
    pieCahartdataMap1.putIfAbsent("Entitlement", () => 3.1);
    pieCahartdataMap1.putIfAbsent("Available", () => 4);

// map values for pie chart 2
    pieCahartdataMap2.putIfAbsent("Entitlement", () => 4.1);
    pieCahartdataMap2.putIfAbsent("Available", () => 2.1);

// map values for pie chart 3
    pieCahartdataMap3.putIfAbsent("Entitlement", () => 1.9);
    pieCahartdataMap3.putIfAbsent("Available", () => 2.6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // Column(
        //   children: [
        //     // Container(
        //     //   width: MediaQuery.of(context).size.width,
        //     //   height: MediaQuery.of(context).size.height -
        //     //       MediaQuery.of(context).size.height * 0.68,
        //     //   decoration: BoxDecoration(
        //     //       gradient: LinearGradient(
        //     //           begin: Alignment.topRight,
        //     //           end: Alignment.bottomLeft,
        //     //           colors: [
        //     //         AppTheme.drawerBackgroundColor1,
        //     //         AppTheme.drawerBackgroundColor1,
        //     //       ])),
        //     // ),
        //     // Container(
        //     //     width: MediaQuery.of(context).size.width,
        //     //     height: MediaQuery.of(context).size.height -
        //     //         MediaQuery.of(context).size.height * 0.32,
        //     //     color: AppTheme.nearlyWhite),
        //   ],
        // ),
        child: Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.pieChartBackgroundColor,
      // drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.table_chart, color: Colors.white),
        //       onPressed: () {
        //         FancyAlertBox fancyAlertBox = FancyAlertBox(context: context);
        //         fancyAlertBox.showFancyCustomDialog(context);
        //       })
        // ],
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.drawerBackgroundColor1,
        title: Text(
          "Leave Balance",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Pie cahrt views
            piechartView(context),
            // EmployeeLeaveBalanceDataTable(),
            SizedBox(height: 0),
            rowWithLeaveTextAndLeaveTypeFilter(context),
            EmployeeLeaveBalalnceHistoryListView(),
          ],
        )),
      ),
    ));
  }

  Widget piechartView(BuildContext context) {
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
              EmployeeLeaveBalanceDataTable(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EmployeeLeaveBalancePieChart(
                    pieCahrtColorList: AppTheme.pieCahrtColourList1,
                    dataMap: pieCahartdataMap1,
                    totalLeaves: 14,
                    pieChartBackgroundColor: AppTheme.pieChartBackgroundColor3,
                    showLegendBit: false,
                    leaveTypeText: "Annual",
                  ),
                  EmployeeLeaveBalancePieChart(
                      pieCahrtColorList: AppTheme.pieCahrtColourList1,
                      dataMap: pieCahartdataMap2,
                      totalLeaves: 10,
                      showLegendBit: false,
                      pieChartBackgroundColor:
                          AppTheme.pieChartBackgroundColor2,
                      leaveTypeText: "Casual"),
                  EmployeeLeaveBalancePieChart(
                    pieCahrtColorList: AppTheme.pieCahrtColourList1,
                    dataMap: pieCahartdataMap3,
                    totalLeaves: 8,
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

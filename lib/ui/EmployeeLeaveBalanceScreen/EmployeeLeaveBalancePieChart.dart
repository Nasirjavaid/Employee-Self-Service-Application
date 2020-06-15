import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:ess_application/config/appTheme.dart';

class EmployeeLeaveBalancePieChart extends StatefulWidget {
 final List<Color> pieCahrtColorList;
 final Map<String, double> dataMap;
 final String leaveTypeText;
 final bool showLegendBit;
 LegendPosition legendPosition;
 final Color pieChartBackgroundColor;
 final int totalLeaves;
  EmployeeLeaveBalancePieChart(
      {Key key, this.pieCahrtColorList, this.dataMap, this.totalLeaves,this.leaveTypeText,this.showLegendBit,this.pieChartBackgroundColor})
      : super(key: key);

  @override
  _EmployeeLeaveBalancePieChartState createState() =>
      _EmployeeLeaveBalancePieChartState();
}

class _EmployeeLeaveBalancePieChartState
    extends State<EmployeeLeaveBalancePieChart> {
  // Map<String, double> dataMap = Map();

  // List<Color> colorList = [
  //   Colors.red[400],
  //   Colors.green[400],
  //   Colors.blue[400],
  //   Colors.yellow[400],
  // ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 0, right: 0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
                alignment: Alignment(0.0, -0.01),
                child: Container(
                  height: 47,
                  width: 47,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color:widget.pieChartBackgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.leaveTypeText}",
                        style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white,
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 2.5,
                      ),
                      Text("${widget.totalLeaves}",
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                )),
          ),
          Container(
            child: PieChart(
              dataMap: widget.dataMap,

              animationDuration: Duration(milliseconds: 2800),
              //   chartLegendSpacing: 20.0,
              chartRadius: 70,
              showChartValuesInPercentage: true,
              // showChartValues: true,
              showChartValuesOutside: true,
              chartLegendSpacing: 30,
              chartValueBackgroundColor: AppTheme.appBackgroundColorforCard3,
              colorList: widget.pieCahrtColorList,
              showLegends: widget.showLegendBit,
              legendStyle: Theme.of(context).textTheme.button.copyWith(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),

              legendPosition: LegendPosition.bottom,
              decimalPlaces: 1,

              showChartValueLabel: true,

              initialAngle: 0,
              chartValueStyle: TextStyle(color: Colors.white, fontSize: 7),
              chartType: ChartType.ring,
            ),
          ),
        ],
      ),
    );
  }
}

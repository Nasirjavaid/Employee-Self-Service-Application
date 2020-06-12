import 'package:ess_application/config/appTheme.dart';
import 'package:flutter/material.dart';

class SalarySlipScreen extends StatefulWidget {
  @override
  _SalarySlipScreenState createState() => _SalarySlipScreenState();
}

class _SalarySlipScreenState extends State<SalarySlipScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.pieChartBackgroundColor,
        appBar: AppBar(
          // Add AppBar here only

          backgroundColor: AppTheme.drawerBackgroundColor1,
          elevation: 0.0,
          title: Text(
            "Salary Slip",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),

          actions: [],
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                employeeInfoCard(context),
                // SizedBox(
                //   height: 5,
                // ),
              //  employeeCpmanyStatusInfo(context),
                // SizedBox(
                //   height: 5,
                // ),
               // employeeDeductionInfoCard(context),
                SizedBox(
                  height: 1,
                ),
                employeePaymentInfoCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget basicTextView(
      BuildContext context,
      String titleText,
      String mainInfo,
      Color textBackgroundColor,
      double customWidth,
      double titleTextSize,
      double mainTextSize,
      Color tittleTextColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "$titleText",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: titleTextSize,
              fontWeight: FontWeight.w900,
              color: tittleTextColor),
        ),
        SizedBox(width: 5),
        Container(
          width: customWidth,
          decoration: BoxDecoration(
              color: textBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: Text(
              "$mainInfo",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: mainTextSize, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  Widget basicTextViewVertical(
      BuildContext context,
      String titleText,
      String mainInfo,
      Color textBackgroundColor,
      double customWidth,
      double titleTextSize,
      double mainTextSize,
      Color tittleTextColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "$titleText",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: titleTextSize,
              fontWeight: FontWeight.w900,
              color: tittleTextColor),
        ),
        SizedBox(height: 8),
        Container(
          width: customWidth,
          decoration: BoxDecoration(
              color: textBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: Text(
              "$mainInfo",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: mainTextSize, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  Widget employeeInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Employee Info",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.nearlyBlue),
                    ),
                    Text(
                      "Jan,2020",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.salarySlipDateColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextViewVertical(
                    context,
                    "Employee No.",
                    "234636",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
                SizedBox(
                  height: 5,
                ),
                basicTextViewVertical(
                    context,
                    "Employee Name",
                    "Ahmad ali",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextViewVertical(
                    context,
                    "Designation",
                    "PSO",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
                SizedBox(
                  height: 5,
                ),
                basicTextViewVertical(
                    context,
                    "Department",
                    "Admin-HR",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
              ],
            ),

            SizedBox(height: 8,),
            Row(
           
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextViewVertical(
                    context,
                    "Staus",
                    "Permanent",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
                SizedBox(
                  height: 5,
                ),
                basicTextViewVertical(
                    context,
                    "Joining Date",
                    "01-Mar-2010",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
              ],
            ),

            // SizedBox(
            //   height: 5,
            // ),
            // Row(
            //     // crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     basicTextViewVertical(
            //         context,
            //         "Section ",
            //         "Admin ",
            //         AppTheme.pieChartBackgroundColor4,
            //         100,
            //         12,
            //         13,
            //         Colors.black38),
            //         Container(width: 100,),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget employeeCpmanyStatusInfo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Employee Info",
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyText1
            //       .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            // ),
            // SizedBox(
            //   height: 30,
            // ),

          ],
        ),
      ),
    );
  }

  // Widget employeeDeductionInfoCard(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white70,
  //         borderRadius: BorderRadius.all(Radius.circular(5))),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child:
  //     ),
  //   );
  // }

  Widget employeePaymentInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


 Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deductions",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightRed),
            ),
            SizedBox(
              height: 10,
            ),
            basicTextView(context, "Income Tax", "1,109",
                AppTheme.pieChartBackgroundColor6, 200, 12, 13, Colors.black38),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              height: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Sal Loan Bal",
                        "0",
                        AppTheme.pieChartBackgroundColor6,
                        40,
                        8,
                        10,
                        Colors.black38),
                    // SizedBox(height: 5),
                    // basicTextView(context, "Arrears", "0",
                    //     AppTheme.pieChartBackgroundColor5, 40, 8, 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Bike Loan Bal",
                        "0",
                        AppTheme.pieChartBackgroundColor6,
                        40,
                        8,
                        10,
                        Colors.black38),
                    // SizedBox(height: 5),
                    // basicTextView(context, "Net Salary", "61,892",
                    //     AppTheme.pieChartBackgroundColor5, 40, 8, 10),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Total Ded",
                        "1,109",
                        AppTheme.pieChartBackgroundColor6,
                        40,
                        8,
                        10,
                        AppTheme.lightRed),
                    // SizedBox(height: 5),
                    // basicTextView(context, "Net Payable", "61,892",
                    //  AppTheme.pieChartBackgroundColor5, 40, 8, 10),
                  ],
                ),
              ],
            )
          ],
        ),

         SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              height: 1,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Payments",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.pieChart1Color3),
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               basicTextViewVertical(context, "Current Pay", "61,892",
                AppTheme.pieChartBackgroundColor5, 100, 12, 13, Colors.black38),
            SizedBox(
              height: 5,
            ),
            basicTextViewVertical(context, "Basic Pay", "41,262",
                AppTheme.pieChartBackgroundColor5, 100, 12, 13, Colors.black38),
            ],),
           
            SizedBox(
              height:8,
            ),

             Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               basicTextViewVertical(context,  "House Rent", "16,505",
                AppTheme.pieChartBackgroundColor5, 100, 12, 13, Colors.black38),
            SizedBox(
              height: 5,
            ),
            basicTextViewVertical(context,  "Utility", "4,126",
                AppTheme.pieChartBackgroundColor5, 100, 12, 13, Colors.black38),
            ],),
          
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              height: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Working Days",
                        "31",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                    SizedBox(height: 5),
                    basicTextView(
                        context,
                        "Arrears",
                        "0",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Rate Per day",
                        "1996.52",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                    SizedBox(height: 5),
                    basicTextView(
                        context,
                        "Net Salary",
                        "61,892",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        AppTheme.pieChart1Color3),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Earned Pay",
                        "61,892",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                    SizedBox(height: 5),
                    basicTextView(
                        context,
                        "Net Payable",
                        "61,892",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        AppTheme.netPayAbleSalary),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

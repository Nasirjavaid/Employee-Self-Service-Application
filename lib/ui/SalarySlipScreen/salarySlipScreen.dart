import 'package:ess_application/bloc/userProfileBloc/userProfileBloc.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileEvent.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileState.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/model/salarySlip.dart';
import 'package:ess_application/model/userLogin.dart';
import 'package:ess_application/repository/userProfileRepository.dart';
import 'package:ess_application/ui/commonWidgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalarySlipScreen extends StatefulWidget {
  final SalarySlip salarySlip;

  SalarySlipScreen({this.salarySlip});

  @override
  _SalarySlipScreenState createState() => _SalarySlipScreenState();
}

class _SalarySlipScreenState extends State<SalarySlipScreen> {
  UserProfileRepository userProfileRepository = UserProfileRepository();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.pieChartBackgroundColor,
        appBar: AppBar(
          // Add AppBar here only

          backgroundColor: AppTheme.drawerBackgroundColor2,
          elevation: 0.0,
          title: Text(
            "Salary Slip Detail",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),

          actions: [],
        ),

        //getting user data
        body: BlocProvider(create: (context) {
          return UserProfileBloc(userProfileRepository: userProfileRepository)
            ..add(UserProfileEventStartDataObtaining());
        }, child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            //initial state is data is loading  from the repository show loading indicator
            if (state is UserProfileInProgressDatatObtaining) {
              return LoadingIndicator();
            }
            // If any error then show error message
            if (state is UserProfilFaileldToObtaineData) {
              return Text("Failed to obtain ${state.error}");
            }
            // if data is Successfully obtained pass to widget body
            if (state is UserProfilSuccessfullyDataObtained) {
              return _buildBody(context, widget.salarySlip, state.userLogin);
            }
            return Center(child: Text("Nothing here"));
          },
        )),

        //_buildBody(context, widget.salarySlip),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, SalarySlip salarySlip, UserLogin userLogin) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                employeeInfoCard(context, widget.salarySlip, userLogin),
                SizedBox(
                  height: 1,
                ),
                employeePaymentInfoCard(context, salarySlip),
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

  Widget employeeInfoCard(
      BuildContext context, SalarySlip salarySlip, UserLogin userLogin) {
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
                    salarySlip.salaryMonth != null
                        ? Text(
                            "${salarySlip.salaryMonth}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.salarySlipDateColor),
                          )
                        : Text(
                            "--:--:--",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
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
                    userLogin.empNo !=null ? "${userLogin.empNo}" : "N/A",
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
                   userLogin.empName!=null ? "${userLogin.empName}" : "N/A",
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
                    userLogin.designation !=null ? "${userLogin.designation}" : "N/A",
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
                     userLogin.empDepartment !=null ? "${userLogin.empDepartment}" : "N/A",
                    AppTheme.pieChartBackgroundColor4,
                    100,
                    12,
                    13,
                    Colors.black38),
              ],
            ),

            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextViewVertical(
                    context,
                    "Staus",
                  userLogin.status !=null ? "${userLogin.status}" :"N/A",
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
                  userLogin.dateOfJoining !=null ?  "${userLogin.dateOfJoining}" : "N/A",
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

  Widget employeePaymentInfoCard(BuildContext context, SalarySlip salalrySlip) {
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
                basicTextView(
                    context,
                    "Income Tax",
                    salalrySlip.incomeTax != null
                        ? "${salalrySlip.incomeTax}"
                        : "N/A",
                    AppTheme.pieChartBackgroundColor6,
                    200,
                    12,
                    13,
                    Colors.black38),
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
                            salalrySlip.salaryLoanBalance != null
                                ? "${salalrySlip.salaryLoanBalance}"
                                : "N/A",
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
                            salalrySlip.bikeLoanBalance != null
                                ? "${salalrySlip.bikeLoanBalance}"
                                : "N/A",
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
                            salalrySlip.totalDeduction != null
                                ? "${salalrySlip.totalDeduction}"
                                : "N/A",
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
                basicTextViewVertical(
                    context,
                    "Current Pay",
                    salalrySlip.currentPay != null
                        ? "${salalrySlip.currentPay}"
                        : "N/A",
                    AppTheme.pieChartBackgroundColor5,
                    100,
                    12,
                    13,
                    Colors.black38),
                SizedBox(
                  height: 5,
                ),
                basicTextViewVertical(
                    context,
                    "Basic Pay",
                    salalrySlip.basicPay != null
                        ? "${salalrySlip.basicPay}"
                        : "N/A",
                    AppTheme.pieChartBackgroundColor5,
                    100,
                    12,
                    13,
                    Colors.black38),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                basicTextViewVertical(
                    context,
                    "House Rent",
                    salalrySlip.houseRent != null
                        ? "${salalrySlip.houseRent}"
                        : "N/A",
                    AppTheme.pieChartBackgroundColor5,
                    100,
                    12,
                    13,
                    Colors.black38),
                SizedBox(
                  height: 5,
                ),
                basicTextViewVertical(
                    context,
                    "Utility",
                    salalrySlip.utility != null
                        ? "${salalrySlip.utility}"
                        : "N/A",
                    AppTheme.pieChartBackgroundColor5,
                    100,
                    12,
                    13,
                    Colors.black38),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    basicTextView(
                        context,
                        "Working Days",
                        salalrySlip.workingDays != null
                            ? "${salalrySlip.workingDays}"
                            : "N/A",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                    SizedBox(height: 5),
                    basicTextView(
                        context,
                        "Arrears",
                        salalrySlip.arrears != null
                            ? "${salalrySlip.arrears}"
                            : "N/A",
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
                        salalrySlip.ratePerDay != null
                            ? "${salalrySlip.ratePerDay}"
                            : "N/A",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                    SizedBox(height: 5),
                    basicTextView(
                        context,
                        "Net Salary",
                        salalrySlip.netSalary != null
                            ? "${salalrySlip.netSalary}"
                            : "N/A",
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
                        salalrySlip.earnedPay != null
                            ? "${salalrySlip.earnedPay}"
                            : "N/A",
                        AppTheme.pieChartBackgroundColor5,
                        40,
                        8,
                        10,
                        Colors.black38),
                    SizedBox(height: 5),
                    basicTextView(
                        context,
                        "Net Payable",
                        salalrySlip.netPayAble != null
                            ? "${salalrySlip.netPayAble}"
                            : "N/A",
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

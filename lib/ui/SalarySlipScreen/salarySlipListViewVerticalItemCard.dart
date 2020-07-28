import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/model/salarySlip.dart';

import 'package:ess_application/ui/CommonWidgets/roundedImageViewWithoutBorder.dart';
import 'package:ess_application/ui/SalarySlipScreen/salarySlipScreen.dart';

import 'package:flutter/material.dart';

class SalarySlipListViewVerticalItemCard extends StatelessWidget {
  final AnimationController animationController;
  final Animation<dynamic> animation;

  SalarySlip salarySlip;

  SalarySlipListViewVerticalItemCard(
      {this.animationController, this.animation, this.salarySlip});

  final String leavebalanceImageLink = "assets/design_course/interFace4.png";
  final String leavebalanceImageLink2 = "assets/design_course/webInterFace.png";
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 4),
        child: InkWell(
          splashColor: AppTheme.pieChartBackgroundColor4,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SalarySlipScreen(salarySlip:salarySlip)));
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(1.0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white70),
                    ),
                  ),
                ),
                dataContainer(context, salarySlip),
                imageContainer(context, leavebalanceImageLink)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageContainer(BuildContext context, String leavebalanceImageLink) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment(-0.93, 0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white54),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  child: AspectRatio(
                      aspectRatio: 1.0,
                      child: RoundedCornerImageViewWithoutBorder(
                        height: 50,
                        width: 50,
                        imageLink: leavebalanceImageLink,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dataContainer(BuildContext context, SalarySlip salarySlip) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment(0.6, 1),
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 11.0, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  //width: 80,
                  child: Column(
                    children: [
                      Text("Issue Date",
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: AppTheme.salarySlipDateColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 11)),
                      SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFFefe9f5)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20, right: 20),
                          child: salarySlip.salaryIssueDate != null
                              ? Text("${salarySlip.salaryIssueDate}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          color: AppTheme.salarySlipDateColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.5))
                              : Text("N/A",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          color: AppTheme.salarySlipDateColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: 100,
                  child: Column(
                    children: [
                      Text("Ded Amount",
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: AppTheme.pieChart1Color1,
                              fontWeight: FontWeight.w600,
                              fontSize: 11)),
                      SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppTheme.pieChartBackgroundColor6),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20, right: 20),
                          child: salarySlip.totalDeduction !=null ? Text("${salarySlip.totalDeduction}",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(
                                      color: AppTheme.pieChart1Color1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5)) : Text("N/A",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(
                                      color: AppTheme.pieChart1Color1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: 80,
                  child: Column(
                    children: [
                      Text("Net Salary",
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: AppTheme.pieChart1Color3,
                              fontWeight: FontWeight.w600,
                              fontSize: 11)),
                      SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppTheme.pieChartBackgroundColor5),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20, right: 20),
                          child: salarySlip.netSalary !=null ? Text("${salarySlip.netSalary}",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(
                                      color: AppTheme.pieChart1Color3,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5)) : Text("N/A",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(
                                      color: AppTheme.pieChart1Color3,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

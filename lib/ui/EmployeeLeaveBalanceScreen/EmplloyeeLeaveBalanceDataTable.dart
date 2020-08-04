import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/model/leaveBalance.dart';
import 'package:flutter/material.dart';

class EmployeeLeaveBalanceDataTable extends StatelessWidget {

 final LeaveBalance leaveBalance;
 
EmployeeLeaveBalanceDataTable({@required this.leaveBalance});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 0.0, left: 0, right: 0, bottom: 0),
          child: Container(
            //color:AppTheme.pieChartBackgroundColor,
            //elevation: 1,
            child: Center(
              child: DataTable(
                dataRowHeight: 35,
                headingRowHeight: 30,
                columnSpacing: 25,
                columns: [
                  DataColumn(
                      label: Text("Type",
                          style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54))),
                  DataColumn(
                      label: Text("Annual",
                          style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: AppTheme.pieChartBackgroundColor3))),
                  DataColumn(
                      label: Text("Casual",
                          style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: AppTheme.pieChartBackgroundColor2))),
                  DataColumn(
                      label: Text("Medical",
                          style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: AppTheme.pieChartBackgroundColor1))),
                  DataColumn(
                      label: Text("Total",
                          style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Entitlement',
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.annualEntitlement != null ? leaveBalance.annualEntitlement : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.casualEntitlement != null ? leaveBalance.casualEntitlement : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.medicalEntitlement != null ? leaveBalance.medicalEntitlement : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.annualEntitlement != null && leaveBalance.casualEntitlement != null && leaveBalance.medicalEntitlement != null ? leaveBalance.annualEntitlement + leaveBalance.casualEntitlement + leaveBalance.medicalEntitlement : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Availed',
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.annualAvailed != null ? leaveBalance.annualAvailed : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.casualAvailed != null ? leaveBalance.casualAvailed : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.medicalAvailed != null ? leaveBalance.medicalAvailed : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.annualAvailed != null && leaveBalance.casualAvailed != null && leaveBalance.medicalAvailed != null ? leaveBalance.annualAvailed + leaveBalance.casualAvailed + leaveBalance.medicalAvailed : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Balance',
                        style: Theme.of(context).textTheme.button.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.annualBalance != null ? leaveBalance.annualBalance : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.casualBalance != null ? leaveBalance.casualBalance : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.medicalBalance != null ? leaveBalance.medicalBalance : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                    DataCell(Center(
                        child: Text(
                            '${leaveBalance.annualBalance != null && leaveBalance.casualBalance != null && leaveBalance.medicalBalance != null ? leaveBalance.annualBalance + leaveBalance.casualBalance + leaveBalance.medicalBalance : "N/A"}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900)))),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

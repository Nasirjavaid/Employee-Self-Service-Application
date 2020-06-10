import 'package:ess_application/config/appTheme.dart';
import 'package:flutter/material.dart';

class EmployeeLeaveBalanceDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:const EdgeInsets.only(top:0.0,left: 0,right: 0,bottom: 0),
          child: Container(
            
            //color:AppTheme.pieChartBackgroundColor,
            //elevation: 1,
            child: Center(
              child: DataTable(
                dataRowHeight: 35,
              
                headingRowHeight: 30,
                columnSpacing: 25,
                columns: [
                  DataColumn(label: Text("Type",style:Theme.of(context).textTheme.button.copyWith(fontSize:12,fontWeight: FontWeight.w900,color: Colors.black54))),
                  DataColumn(label: Text("Annual",style:Theme.of(context).textTheme.button.copyWith(fontSize:12,fontWeight: FontWeight.w900, color: AppTheme.pieChartBackgroundColor3))),
                  DataColumn(label: Text("Casual",style:Theme.of(context).textTheme.button.copyWith(fontSize:12,fontWeight: FontWeight.w900,color: AppTheme.pieChartBackgroundColor2))),
                  DataColumn(label: Text("Medical",style:Theme.of(context).textTheme.button.copyWith(fontSize:12,fontWeight: FontWeight.w900,color: AppTheme.pieChartBackgroundColor1))),
                  DataColumn(label: Text("Total",style:Theme.of(context).textTheme.button.copyWith(fontSize:12,fontWeight: FontWeight.w900,color: Colors.black54))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Entitlement',style:Theme.of(context).textTheme.button.copyWith(fontSize:11,fontWeight: FontWeight.w900,color:  Colors.black54))),
                    DataCell(Center(child: Text('14',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('10',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('8',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('34',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Availed',style:Theme.of(context).textTheme.button.copyWith(fontSize:11,fontWeight: FontWeight.w900,color:  Colors.black54))),
                    DataCell(Center(child: Text('6',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('6',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('6',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('18',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Balance',style:Theme.of(context).textTheme.button.copyWith(fontSize:11,fontWeight: FontWeight.w900,color:  Colors.black54))),
                    DataCell(Center(child: Text('8',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('4',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('2',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
                    DataCell(Center(child: Text('14',style:Theme.of(context).textTheme.bodyText1.copyWith(fontSize:12,fontWeight: FontWeight.w900)))),
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

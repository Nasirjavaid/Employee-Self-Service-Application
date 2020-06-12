import 'package:ess_application/ui/NotificationScreen/myNotificationsListItemCard.dart';
import 'package:flutter/material.dart';

import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/ui/SalarySlipScreen/salarySlipListViewVerticalItemCard.dart';

class MyNotificationsListViewFragment extends StatelessWidget {
  AnimationController animationController;
  List category;

  MyNotificationsListViewFragment({
    this.animationController,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.pieChartBackgroundColor,
        // appBar: AppBar(

        //   backgroundColor: AppTheme.drawerBackgroundColor2,
        //   elevation: 0.0,
        //   title: Text(
        //     "Salary Slips",
        //     style: Theme.of(context)
        //         .textTheme
        //         .title
        //         .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        //   ),
        //   centerTitle: true,
        //   iconTheme: new IconThemeData(color: Colors.white),

        //   actions: [],
        // ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: category.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final int count = category.length > 20 ? 10 : category.length;
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn)));
            animationController.forward();

            return MyNotificationsListItemCard(animation: animation,index: index,animationController: animationController,);
            // return SalarySlipListViewVerticalItemCard(
            //   animation: animation,
            //   animationController: animationController,
            // );
          }),
    );
  }
}

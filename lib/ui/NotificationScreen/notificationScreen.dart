import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/ui/NotificationScreen/defaultNotificationsListViewFragment.dart';
import 'package:ess_application/ui/NotificationScreen/myNotificationsListViewFragment.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  
  List category = [
    1,
    1,
    1,
    1,
    1,
    1,
    11,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }
  @override
dispose() {

  //dispossing animation controller to controll ticker dispose issues
  animationController.dispose(); 
  super.dispose();
}

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppTheme.pieChartBackgroundColor,
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.white),
            backgroundColor: AppTheme.drawerBackgroundColor2,
            title: Text(
              "Notifications",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: AppTheme.pieChartBackgroundColor4,
              // isScrollable: true,
              tabs: <Widget>[
                Container(
                    height: 40,child: Center(child: Text("My notification"))),
                Container(
                    height: 40,
                    child: Center(child: Text("Default notification"))),
              ],
            ),
          ),
          body: TabBarView(children: [
            MyNotificationsListViewFragment(
              animationController: animationController,
              category: category,
            ),
           DefaultNotificationsLisVewFragment( animationController: animationController,
              category: category,),
          ]),
        ),
      ),
    );
  }
}

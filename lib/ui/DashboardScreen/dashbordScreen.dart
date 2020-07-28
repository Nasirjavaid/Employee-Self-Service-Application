import 'package:badges/badges.dart';
import 'package:ess_application/bloc/userAuthBloc/userAuthBloc.dart';
import 'package:ess_application/bloc/userAuthBloc/userAuthEvent.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileBloc.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileEvent.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileState.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/config/methods.dart';
import 'package:ess_application/model/userLogin.dart';
import 'package:ess_application/repository/userProfileRepository.dart';
import 'package:ess_application/ui/CommonWidgets/roundedImageViewWithoutBorder.dart';
import 'package:ess_application/ui/DashboardScreen/myNavDrawer.dart';
import 'package:ess_application/ui/EmployeeLeaveBalanceScreen/EmployeeLeaveBalanceScreen.dart';
import 'package:ess_application/ui/EmployeeLeaveFormScreen/employeeLeaveApplicationForm.dart';
import 'package:ess_application/ui/UserProfileScreen/userProfileScreen.dart';
import 'package:ess_application/ui/commonWidgets/loadingIndicator.dart';
import 'package:ess_application/ui/salarySlipScreen/salarySlipItemsListViewVertical.dart';
import 'package:flutter/material.dart';
import 'package:ess_application/ui/NotificationScreen/notificationScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashbordScreen extends StatefulWidget {
  @override
  _DashbordScreenState createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  String profileImageLink = "assets/images/profilelogo.png";
  String salerySlipImageLink = "assets/images/salreyslip.png";
  String applyLeaveImageLink = "assets/images/applyleaves.png";
  String notificationsImageLink = "assets/images/notifications.png";
  String leavebalanceImageLink = "assets/images/leavebalance.png";
  String summaryImageLink = "assets/images/newsummary.png";

  UserProfileRepository userProfileRepository = new UserProfileRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return UserProfileBloc(userProfileRepository: userProfileRepository)
        ..add(UserProfileEventStartDataObtaining());
    }, child: BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        UserLogin userLogin;
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
          print("Obtained user data in user profile  ${state.userLogin.empNo}");
          userLogin = state.userLogin;
          return mainBody(context, state.userLogin);
        }
        return LoadingIndicator();
      },
    ));
  }

  Widget mainBody(BuildContext context, UserLogin userLogin) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
            AppTheme.drawerBackgroundColor1,
            AppTheme.pieChartBackgroundColor,
          ])),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          // Add AppBar here only

          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Dashboard",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),

          actions: [
            alertIconAndBadge(),
            logpiuActionButton(),
          ],
        ),
        body: _buildBody(context),
        //Drawer navifation
        drawer: MyNavDrawer(userLogin: userLogin),
      ),
    );
  }

  Widget alertIconAndBadge() {
    return IconButton(
      onPressed: () {
        BlocProvider.of<UserAuthBloc>(context).add(AuthLoggedOut());
      },
      icon: Icon(Icons.settings_power),
    );
  }

  Widget logpiuActionButton() {
    return Badge(
      position: BadgePosition.topRight(top: 0, right: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        "5",
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.add_alert), onPressed: () {}),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        SizedBox(
          height: 100,
        ),
        mainHeader(context),
        gridViewWithMenuItems(context),
        Spacer(),
        InkWell(
          onTap: () => Methods.launchURL(),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Powered by",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black38),
              ),
              SizedBox(
                height: 5,
              ),
              RoundedCornerImageViewWithoutBorder(
                  width: 100,
                  height: 26,
                  imageLink: "assets/images/visionplus.png"),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ]),
    );
  }

  Widget mainHeader(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedCornerImageViewWithoutBorder(
              width: 70, height: 70, imageLink: "assets/images/gear.png"),
          SizedBox(height: 30),
          Text(
            "Company Name",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget gridViewWithMenuItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 360,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // physics: NeverScrollableScrollPhysics(),
            // crossAxisCount: 3,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildCardWithIcon(20, 10, 50, 50, profileImageLink, context,
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()));
                  }, "My Profile"),
                  buildCardWithIcon(
                      20, 10, 50, 50, salerySlipImageLink, context, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SalarySlipItemsListViewVericalMain())
                                
                                
                                
                                
                                
                                );
                  }, "Salary Slip"),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildCardWithIcon(
                      15, 10, 50, 50, applyLeaveImageLink, context, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EmployeeLeaveApplicationForm()));
                  }, "Apply leaves"),
                  buildCardWithIcon(
                      15, 10, 50, 50, notificationsImageLink, context, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  }, "Notifications"),
                  buildCardWithIcon(
                      12, 10, 50, 50, leavebalanceImageLink, context, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EmployeeLeaveBalanceScreen()));
                  }, "Leave Balance"),
                ],
              )

              // buildCardWithIcon(summaryImageLink, context, () {}, "Summary")
            ]),
      ),
    );
  }

  Padding buildCardWithIcon(
    double paddingHorizontal,
    double paddingVertical,
    double imageHeight,
    double imageWidth,
    String imageLink,
    context,
    VoidCallback onTap,
    String pageName,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: AppTheme.background,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal, vertical: paddingVertical),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedCornerImageViewWithoutBorder(
                    height: imageHeight,
                    width: imageWidth,
                    imageLink: imageLink,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(pageName,
                          style: Theme.of(context).textTheme.title.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 11.0,
                              ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileBloc.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileEvent.dart';
import 'package:ess_application/bloc/userProfileBloc/userProfileState.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/model/userLogin.dart';
import 'package:ess_application/repository/userProfileRepository.dart';
import 'package:ess_application/ui/CommonWidgets/circulerImageView.dart';
import 'package:ess_application/ui/CommonWidgets/roundedCornerImageView.dart';
import 'package:ess_application/ui/LeaveApplicationScreen/leaveApplicationScreen.dart';
import 'package:ess_application/ui/commonWidgets/loadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class UserProfileScreen extends StatelessWidget {
  // initTest() async {
  //   UserLogin userLogin = await userProfileRepository.getUserInormation();
  //   print("Data in main screen init from repo ${userLogin.empName}");
  // }

  @override
  Widget build(BuildContext context) {
    UserProfileRepository userProfileRepository = UserProfileRepository();

    return Container(
        child: Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        // Add AppBar here only

        backgroundColor: AppTheme.drawerBackgroundColor2,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.white),

        // actions: [
        //   emailIconAndBadge(context),
        //   alertIconAndBadge(context),
        // ],
      ),
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
            print(
                "Obtained user data in user profile  ${state.userLogin.empNo}");

            return _buildBody(context,state.userLogin);
          }
          return Center(child: Text("Nothing here"));
        },
      )),
    )

        //_buildBody(),
        //Drawer navifation

        );
  }

  Widget emailIconAndBadge(BuildContext context) {
    return Badge(
      position: BadgePosition.topRight(top: 0, right: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        "6",
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.email), onPressed: () {}),
    );
  }

  Widget alertIconAndBadge(BuildContext context) {
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

  Widget _buildBody(BuildContext context, UserLogin userLogin) {
    return Stack(children: [
      // background blue color to 1/3 of the screen
      backgroundCard(),
      _innerBody(context, userLogin)
    ]);
  }

  Widget _innerBody(BuildContext context, UserLogin userLogin) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: ListView(children: [
        //Oval card here
        SizedBox(
          height: 45,
        ),
        _userInfoCard(context, userLogin),

        // //second card with keave info
        // _leaveCard(),
        // SizedBox(
        //   height: 5,
        // ),
        // //3rd card with info claim info
        // cliamCard(),
        // //News card

        // SizedBox(
        //   height: 5,
        // ),
        // _newsCard()
      ]),
    );
  }

  Widget employeeInfoCard(BuildContext context, UserLogin userLogin) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column(
            //   children: [
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //   children: [
            //     //     Text(
            //     //       "Employee Info",
            //     //       style: Theme.of(context).textTheme.bodyText1.copyWith(
            //     //           fontSize: 14,
            //     //           fontWeight: FontWeight.w600,
            //     //           color: AppTheme.nearlyBlue),
            //     //     ),
            //     //     Text(
            //     //       "Jan,2020",
            //     //       style: Theme.of(context).textTheme.bodyText1.copyWith(
            //     //           fontSize: 14,
            //     //           fontWeight: FontWeight.w600,
            //     //           color: AppTheme.salarySlipDateColor),
            //     //     ),
            //     //   ],
            //     // ),
            //   ],
            // ),
            // // SizedBox(
            // //   height: 10,
            // // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                basicTextViewVertical(
                    context,
                    "Employee No.",
                    "${userLogin.empNo}",
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
                    "${userLogin.empName}",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                basicTextViewVertical(
                    context,
                    "Designation",
                    "${userLogin.designation}",
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
                    "${userLogin.empDepartment}",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                basicTextViewVertical(
                    context,
                    "Staus",
                    "${userLogin.status}",
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
                    "${userLogin.dateOfJoining}",
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

  Widget backgroundCard() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        AppTheme.drawerBackgroundColor2,
        AppTheme.drawerBackgroundColor2
      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      height: 140,
      child: Center(child: Text("")),
    );
  }

  Widget _userInfoCard(BuildContext context, UserLogin userLogin) {
    return Column(
      children: [
        Stack(
          // mainAxisSize: MainAxisSize.max,
          children: [
            ClipPath(
                clipper: OvalTopBorderClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height - 430,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: employeeInfoCard(context, userLogin),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned.fill(
              child: Align(
                  alignment: Alignment(0, -1.38),
                  child: CirculerImageView(height: 70, width: 70,imageUrl:userLogin.imageUrl)),
            ),
          ],
        ),
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

  Widget _leaveCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LeaveApplicationScreen()));
      },
      child: Card(
        elevation: 6,
        color: AppTheme.white,
        child: Container(
          height: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("5 Leave Request",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: AppTheme.nearlyGold, fontSize: 18)),
              ),
              Container(
                height: 1,
                color: Colors.black12,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //imageview widget
                      RoundedCornerImageView(
                        height: 50,
                        width: 50,
                        borderWidth: 1,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kashif Amin",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: AppTheme.drawerBackgroundColor3,
                                      fontSize: 16),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Casual Leave",
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color:
                                          AppTheme.lightText.withOpacity(0.4),
                                      fontSize: 14),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              "12-04-2020 to 13-04-2020",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color:
                                          AppTheme.lightText.withOpacity(0.7),
                                      fontSize: 14),
                            ),
                          ]),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.drawerBackgroundColor2,
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          shape: BoxShape.rectangle,
                          // image: DecorationImage(
                          //     image: AssetImage('assets/images/prof.jpg'),
                          //     fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "4",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: AppTheme.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color:
                                              AppTheme.white.withOpacity(0.4),
                                          fontSize: 10),
                                )
                              ]),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cliamCard(BuildContext context) {
    return Card(
        elevation: 6,
        child: Container(
          // height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.library_books,
                    color: AppTheme.drawerBackgroundColor3,
                    size: 50,
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Column(children: [
                    Text("Your Claim",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: AppTheme.lightText.withOpacity(0.4),
                            fontSize: 18)),
                    SizedBox(
                      height: 4,
                    ),
                    Text("\$ 323233.00",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: AppTheme.drawerBackgroundColor3,
                            fontSize: 26,
                            fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 4,
                    ),
                    Text("approved",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: AppTheme.lightText.withOpacity(0.4),
                            fontSize: 18)),
                  ])
                ]),
          ),
        ));
  }

  Widget _newsCard(BuildContext context) {
    return Card(
      elevation: 6,
      color: AppTheme.white,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text("Breaking News",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: AppTheme.nearlyRed, fontSize: 18)),
              ),
            ),
            // Container(
            //   height: 1,
            //   color: Colors.black12,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lorem Ipsum is simple text.",
                    // textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: AppTheme.drawerBackgroundColor3, fontSize: 16),
                  ),
                  Row(children: [
                    Icon(
                      Icons.alarm,
                      size: 12,
                      color: AppTheme.lightText.withOpacity(0.4),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "2 hrs ago",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppTheme.lightText.withOpacity(0.4),
                          fontSize: 11),
                    ),
                    SizedBox(width: 7)
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
              child: Row(children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('assets/fitness_app/back.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.\nLorem Ipsum has been the industry's\nstandard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type.",
                    textAlign: TextAlign.left,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppTheme.lightText.withOpacity(0.4),
                        fontSize: 11),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
//   child: Column(
//     children: [
//       SizedBox(
//           height: 15,
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "Name   :",
//             textAlign: TextAlign.right,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText2
//                 .copyWith(
//                     color: AppTheme.lightText
//                         .withOpacity(0.4)),
//           )),
//       SizedBox(
//         height: 4,
//       ),
//       SizedBox(
//           height: 15,
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "Designation   :",
//             textAlign: TextAlign.right,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText2
//                 .copyWith(
//                     color: AppTheme.lightText
//                         .withOpacity(0.4)),
//           )),
//       SizedBox(
//         height: 4,
//       ),
//       SizedBox(
//           height: 15,
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "Emp ID   :",
//             textAlign: TextAlign.right,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText2
//                 .copyWith(
//                     color: AppTheme.lightText
//                         .withOpacity(0.4)),
//           )),
//     ],
//   ),
// ),
// Expanded(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       SizedBox(
//           height: 15,
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "  Kashif Amin",
//             textAlign: TextAlign.left,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText1
//                 .copyWith(
//                     color:
//                         AppTheme.drawerBackgroundColor3,
//                     fontSize: 17),
//           )),
//       SizedBox(
//         height: 4,
//       ),
//       SizedBox(
//           height: 15,
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "   CEO",
//             textAlign: TextAlign.left,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText1
//                 .copyWith(
//                     color: AppTheme.lightText,
//                     fontSize: 14),
//           )),
//       SizedBox(
//         height: 4,
//       ),
//       SizedBox(
//           height: 15,
//           width: MediaQuery.of(context).size.width,
//           child: Text(
//             "   325333",
//             textAlign: TextAlign.left,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText1
//                 .copyWith(
//                     color: AppTheme.lightText,
//                     fontSize: 14),
//           )),
//     ],
//   ),

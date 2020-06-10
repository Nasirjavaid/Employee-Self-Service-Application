import 'package:badges/badges.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/ui/CommonWidgets/circulerImageView.dart';
import 'package:ess_application/ui/CommonWidgets/roundedCornerImageView.dart';

import 'package:ess_application/ui/LeaveApplicationScreen/leaveApplicationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          // Add AppBar here only

          backgroundColor: AppTheme.drawerBackgroundColor1,
          elevation: 0.0,
          title: Text("My Profile",style: Theme.of(context).textTheme.title.copyWith(color:Colors.white,fontWeight:FontWeight.w600),),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),

          actions: [
            emailIconAndBadge(),
            alertIconAndBadge(),
          ],
        ),
        body: _buildBody(),
        //Drawer navifation
        
      ),
    );
  }

  Widget emailIconAndBadge() {
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

  Widget alertIconAndBadge() {
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

  Widget _buildBody() {
    return Stack(children: [
      // background blue color to 1/3 of the screen
      backgroundCard(),
      _innerBody(),
    ]);
  }

  Widget _innerBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: ListView(children: [
        //Oval card here
        SizedBox(
          height: 40,
        ),
        _userInfoCard(),
        SizedBox(
          height: 5,
        ),

        //second card with keave info
        _leaveCard(),
        SizedBox(
          height: 5,
        ),
        //3rd card with info claim info
        cliamCard(),
        //News card

        SizedBox(
          height: 5,
        ),
        _newsCard()
      ]),
    );
  }

  Widget backgroundCard() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        AppTheme.drawerBackgroundColor1,
        AppTheme.drawerBackgroundColor1
      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      height: 140,
      child: Center(child: Text("")),
    );
  }

  Widget _userInfoCard() {
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
                  height: 130,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 15,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Name   :",
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            color: AppTheme.lightText
                                                .withOpacity(0.4)),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                  height: 15,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Designation   :",
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            color: AppTheme.lightText
                                                .withOpacity(0.4)),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                  height: 15,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Emp ID   :",
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            color: AppTheme.lightText
                                                .withOpacity(0.4)),
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 15,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "  Kashif Amin",
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color:
                                                AppTheme.drawerBackgroundColor3,
                                            fontSize: 17),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                  height: 15,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "   CEO",
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: AppTheme.lightText,
                                            fontSize: 14),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                  height: 15,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "   325333",
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: AppTheme.lightText,
                                            fontSize: 14),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, -1.9),
                child:CirculerImageView(height: 70,width: 70)
                ),
              ),
            
          ],
        ),
      ],
    );
  }

  Widget _leaveCard() {
    return InkWell(
      onTap: (){

         Navigator.push(context, MaterialPageRoute(builder: (context)=> LeaveApplicationScreen(

                           )));
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
                   RoundedCornerImageView(height: 50,width: 50,borderWidth: 1,),
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
                                      color: AppTheme.lightText.withOpacity(0.4),
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
                                      color: AppTheme.lightText.withOpacity(0.7),
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
                                          color: AppTheme.white.withOpacity(0.4),
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

  Widget cliamCard() {
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

  Widget _newsCard() {
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

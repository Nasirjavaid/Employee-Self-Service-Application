import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/ui/DashboardScreen/MyNavDrawerItems.dart';
import 'package:flutter/material.dart';

class MyNavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: SingleChildScrollView(
            child: Container(
      width: 280,
      child: Column(
        // Important: Remove any padding from the ListView
        // padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 18),
          // rawer header
          Container(
            color: AppTheme.drawerBackgroundColor1,
            child: DrawerHeader(
             
              child: Column(
                children: [
                  Stack(children: [
                    Align(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.all(Radius.circular(25)),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/kashifamin.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment(0, 1.5),
                        child: Container(
                            width: 27,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              //borderRadius: BorderRadius.all(Radius.circular(25)),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.amber,
                                  size: 10,
                                ),
                                onPressed: null)),
                      ),
                    )
                  ]),
                  SizedBox(height: 25),
                  Text("Kashif Amin",
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Colors.white70, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),

          Container(
            color: AppTheme.drawerBackgroundColor2,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.home,
                    text: 'DASHBOARD',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.receipt,
                    text: 'MY PROFILE',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.ac_unit,
                    text: 'SALARY SLIP',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.gradient,
                    text: 'APPLY LEAVES',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.timelapse,
                    text: 'NOTIFICATIONS',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.bookmark,
                    text: 'LEAVE BALANCE',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
                new MyDrawerItems().drawerItem(
                    icon: Icons.calendar_today,
                    text: 'SUMMARY',
                    onTap: () => {
                          //clossing the nav drawer after click
                          Navigator.pop(context)
                        }),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

          Container(
            color: AppTheme.drawerBackgroundColor3,
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              new MyDrawerItems().drawerItem(
                  icon: Icons.new_releases,
                  text: 'NEWS',
                  onTap: () => {
                        //clossing the nav drawer after click
                        Navigator.pop(context)
                      }),
              SizedBox(
                height: 10,
              ),
              new MyDrawerItems().drawerItem(
                  icon: Icons.image_aspect_ratio,
                  text: 'GALLERY',
                  onTap: () => {
                        //clossing the nav drawer after click
                        Navigator.pop(context),
                        // CustomServices().launchBrowser("https://www.gamezop.com/"),
                      }),
              SizedBox(
                height: 10,
              ),
              new MyDrawerItems().drawerItem(
                  icon: Icons.timeline,
                  text: 'TIMES GALLERY',
                  onTap: () => {
                        //clossing the nav drawer after click

                        Navigator.pop(context),
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => StaticInformationScreen(
                        //         postStaticTextInformation:
                        //             PostStaticTextInformation.CONTATC_TEXT),
                        //   ),
                        // ),
                      }),
              SizedBox(
                height: 10,
              ),
              new MyDrawerItems().drawerItem(
                  icon: Icons.people_outline,
                  text: 'RECRUITMENT SECTION',
                  onTap: () => {
                        //clossing the nav drawer after click
                        Navigator.pop(context),
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => StaticInformationScreen(
                        //         postStaticTextInformation:
                        //             PostStaticTextInformation.PRIVACY_TEXT),
                        //   ),
                        // ),
                      }),
              SizedBox(
                height: 10,
              ),
              new MyDrawerItems().drawerItem(
                  icon: Icons.arrow_forward,
                  text: 'LOGOUT',
                  onTap: () => {
                        //clossing the nav drawer after click
                        //  Navigator.pop(context),
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => StaticInformationScreen(
                        //         postStaticTextInformation:
                        //             PostStaticTextInformation.ABOUT_TEXT),
                        //   ),
                        // ),
                      }),
              SizedBox(
                height: 50,
              ),
            ]),
          )
        ],
      ),
    )));
  }
}

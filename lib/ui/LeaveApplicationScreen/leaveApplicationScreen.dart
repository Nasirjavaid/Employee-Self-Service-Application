import 'package:carousel_slider/carousel_slider.dart';
import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/ui/LeaveApplicationScreen/leaveApplicationCard.dart';
import 'package:flutter/material.dart';

class LeaveApplicationScreen extends StatefulWidget {
  @override
  _LeaveApplicationScreenState createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  
  List<String> items = [
    "https://images.squarespace-cdn.com/content/v1/5d01440fc4bd93000125725d/1580951055220-US4F2RWQ0E66G8NI454F/ke17ZwdGBToddI8pDm48kLuFnPMGVMzK8mMmlZWcUC4UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcfIdnX36F6izXnmmCd7tlqy4BJwzFY0SrIFrPxw9MMCo2cKAtV3-xzN3s5ys-PJJ9/Hero_Team_Scheduling.png",
    "https://zoom.us/docs/ent/enterprise/assets/img/zoom.png",
    "https://www.unifysquare.com/wp-content/uploads/2020/01/about-unify-top-image-650x515-V1.png",
    "https://img.pngio.com/dealroom-meetings-png-pictures-2321_1579.png"
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Add AppBar here only

          backgroundColor: AppTheme.drawerBackgroundColor1,
          elevation: 0.0,
          title: Text(
            "Leave Requests (5)",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: AppTheme.white),
          ),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),

          actions: [
            IconButton(
                icon: Icon(Icons.search, color: AppTheme.white),
                onPressed: null)
          ],
        ),
        backgroundColor: AppTheme.drawerBackgroundColor1,
        body: _mainBody());
  }

  Widget _mainBody() {
    return Column(
      children: [
        SizedBox(height: 20),
        SizedBox(
          child: CarouselSlider(
            //  aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
          //  enableInfiniteScroll: true,
           // reverse: true,
            autoPlay: false,
            enableInfiniteScroll: false,
           // autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height * 0.2,

            scrollDirection: Axis.horizontal,

            // enlargeCenterPage: true,

            // autoPlay: true,
            onPageChanged: (index) {
              setState(() {
                _current = index;
                print("$_current");
              });
            },
            items: items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                        child: LeaveApplicationCard()),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.map((url) {
            int index = items.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 0.5,
                ),
                shape: BoxShape.circle,
                color: _current == index ? Colors.blue : Colors.blue[100],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

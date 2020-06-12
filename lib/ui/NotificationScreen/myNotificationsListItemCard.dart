import 'package:ess_application/config/appTheme.dart';
import 'package:flutter/material.dart';

class MyNotificationsListItemCard extends StatelessWidget {
  AnimationController animationController;
  Animation<dynamic> animation;

  BuildContext context;
  int index;
  MyNotificationsListItemCard(
      {this.context, this.index, this.animationController, this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: listTile(context, index),
    );
  }

  Widget listTile(BuildContext context, int index) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: InkWell(
            child: Column(
              children: [
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:1,horizontal:6),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(children: [
                        // SizedBox(
                        //   height: 8,
                        // ),
                        Row(
                          children: [
                            Material(
                                color: index % 2 == 0
                                    ? AppTheme.pieChart1Color3
                                    : index % 3 == 0
                                        ? AppTheme.pieChartBackgroundColor3
                                        : AppTheme.pieChart2Color2,
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(Icons.add_alert,
                                      color: Colors.white, size: 15.0),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:0.0,bottom: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   SizedBox(
                                      height: 10,
                                    ),
                                        index % 2 == 0
                                            ? Container(
                                                width: 100,
                                                child: Text(
                                                  "Salary issued",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .copyWith(
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              )
                                            : index % 3 == 0
                                                ? Text(
                                                    "Absent Marked",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color: Colors.black87,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                  )
                                                : Text(
                                                    "You got some bonus",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color: Colors.black87,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                  ),
                                      
                                    
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Some detail about the notification",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    index % 2 == 0
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: AppTheme.pieChart1Color3,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(1.5))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0,
                                                  bottom: 2,
                                                  left: 4,
                                                  right: 4),
                                              child: Text(
                                                "Salary ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),
                                            ),
                                          )
                                        : index % 3 == 0
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    color: AppTheme
                                                        .pieChartBackgroundColor3,
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(1.5))),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 2.0,
                                                      bottom: 2,
                                                      left: 4,
                                                      right: 4),
                                                  child: Text(
                                                    "Absent",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                    color: AppTheme.pieChart2Color2,
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(1.5))),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 2.0,
                                                      bottom: 2,
                                                      left: 4,
                                                      right: 4),
                                                  child: Text(
                                                    "Bonus",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    // Container(
                                    //   height: 1,
                                    //   width: MediaQuery.of(context).size.width - 100,
                                    //   color: AppTheme.divideColor,
                                    // )
                                  ]),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right:15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                          "6-01-2020",
                                          style:
                                              Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.black38),
                                        ),

                                        SizedBox(height: 20,),
                                   
                                   
                                       index % 2 == 0 ? Container(
                                        height: 10,
                                        width: 10,
                                     
                                        decoration: new BoxDecoration(
                                          color: AppTheme.pieChart1Color3,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(5.0)),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: AppTheme.pieChart1Color3,
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 5.0,
                                            ),
                                           
                                             
                                          ],
                                        ),
                                      ):Container(
                                        height: 10,
                                        width: 10,
                                     
                                        decoration: new BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(5.0)),
                                          // boxShadow: <BoxShadow>[
                                          //   BoxShadow(
                                          //     color: AppTheme.pieChart1Color3,
                                          //     offset: Offset(0.0, 0.0),
                                          //     blurRadius: 5.0,
                                          //   ),
                                           
                                             
                                          // ],
                                        ),
                                      ),
                                    
                                  ],
                                ),
                              ),
                            ),
                             
                                
                            
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {},
          )),
    );
  }
}

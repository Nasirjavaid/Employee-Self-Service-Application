import 'package:ess_application/ui/CommonWidgets/roundedImageViewWithoutBorder.dart';
import 'package:flutter/material.dart';

class DeafultNotificationsListItemCard extends StatelessWidget {
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final BuildContext context;
  final String coronaImageLink = "assets/images/corona.jpg";
  final String leavebalanceImageLink = "assets/design_course/interFace4.png";
  final String leavebalanceImageLink2 = "assets/design_course/webInterFace.png";
  final int index;
  DeafultNotificationsListItemCard(
      {this.context, this.index, this.animationController, this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: listTile(context, index),
    );
  }

  Widget listTile(BuildContext context, int index) {
    return Container(
      child: FadeTransition(
        opacity: animation,
        child: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0),
            child: InkWell(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    child: Container(
                      //height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 8),
                        child: Column(children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 5,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      index % 2 == 0
                                          ? Container(
                                              // width: 200,
                                              child: Text(
                                                "Company will remian close till next order.",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
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
                                              ? Container(
                                                  // width: 150,
                                                  child: Text(
                                                    "This saturday all employee's and HOD's will join the company",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                )
                                              : Container(
                                                  // width: 150,
                                                  child: Text(
                                                    "Please wear mask and wash your hands again and again regularly.",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                ),

                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        // width: 200,
                                        child: Text(
                                          "UNICEF has been preparing and responding to the epidemic of COVID-19 around the world, knowing that the virus could spread to children and families in any country or community. UNICEF will continue working with governments and our partners to stop transmission of the virus, and to keep children and their families safe.",
                                          maxLines: 10,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),

                                      // SizedBox(
                                      //   height: 8,
                                      // ),
                                      // Container(
                                      //   height: 1,
                                      //   width: MediaQuery.of(context).size.width - 100,
                                      //   color: AppTheme.divideColor,
                                      // )
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: index % 2 == 0
                                      ? RoundedCornerImageViewWithoutBorder(
                                          // height: MediaQuery.of(context).size.height,
                                          width: 90,
                                          height: 90,
                                          imageLink: coronaImageLink)
                                      : index % 3 == 0
                                          ? RoundedCornerImageViewWithoutBorder(
                                              // height: MediaQuery.of(context).size.height,
                                              width: 90,
                                              height: 90,
                                              imageLink: leavebalanceImageLink,
                                            )
                                          : RoundedCornerImageViewWithoutBorder(
                                              // height: MediaQuery.of(context).size.height,
                                              width: 90,
                                              height: 90,
                                              imageLink: leavebalanceImageLink,
                                            ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  "6-01-2020",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.black54),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(right:18),
                              //   child: Row(
                              //     children: <Widget>[
                              //      Icon(Icons.not_interested,
                              //                 color: Colors.black38, size: 20.0),
                              //           SizedBox(width: 22,),

                              //             Icon(Icons.share,
                              //                 color: Colors.black38, size: 20.0),

                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {},
            )),
      ),
    );
  }
}

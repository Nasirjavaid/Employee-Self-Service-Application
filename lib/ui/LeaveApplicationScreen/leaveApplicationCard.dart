import 'package:ess_application/ui/CommonWidgets/roundedCornerImageView.dart';
import 'package:flutter/material.dart';
import 'package:ess_application/config/appTheme.dart';

class LeaveApplicationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _leaveInfoCard(context),
    );
  }

  Widget _leaveInfoCard(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Container(
                width: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.0,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.44,
                child: Card(
                  elevation: 16,
                  //replace this Container with your Card
                  color: Colors.white,
                  child: Column(children: [
                    SizedBox(
                      height: 35,
                    ),
                    userInfo(context)
                  ]),
                ),
              ),
            ),
            RoundedCornerImageView(
              height: 60,
              width: 60,
              borderWidth: 2,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          thumbsDownIcon(),
          SizedBox(
            width: 25,
          ),
          thumbsUpIcon(),
        ])
      ],
    );
  }

  Widget userInfo(BuildContext context) {
    return Column(children: [
      Text(
        "Kashif Amin",
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontWeight: FontWeight.w800),
      ),
      SizedBox(
        height: 2,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "CEO",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 11,
                color: AppTheme.lightText.withOpacity(0.6),
                fontWeight: FontWeight.w400),
          ),
          Text(
            " - ",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 11,
                color: AppTheme.lightText.withOpacity(0.6),
                fontWeight: FontWeight.w400),
          ),
          Text(
            "3245",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 11,
                color: AppTheme.lightText.withOpacity(0.6),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),

// Mian part of infromation the card
      mainInfoColumn(context),
    ]);
  }

  Widget thumbsUpIcon() {
    return ClipOval(
      child: Material(
        color: Colors.green, // button color
        child: InkWell(
          splashColor: Colors.amber, // inkwell color
          child: SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                Icons.thumb_up,
                size: 15,
                color: Colors.white,
              )),
          onTap: () {},
        ),
      ),
    );
  }

  Widget thumbsDownIcon() {
    return ClipOval(
      child: Material(
        color: Colors.red,
        child: Transform.rotate(
          angle: 180 * 3.14 / 180,
          child: InkWell(
            splashColor: Colors.amber, // inkwell color
            child: SizedBox(
                width: 42,
                height: 42,
                child: Icon(
                  Icons.thumb_up,
                  size: 15,
                  color: Colors.white,
                )),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  Widget mainInfoColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
      child: Column(
        children: [
          //leave request text
          leaveRequestHeadingText(context),

          SizedBox(
            height: 15,
          ),
          //first row with leave date to anf from
          firstRowWithLeaveDateToandFrom(context),

          SizedBox(
            height: 8,
          ),
          Container(
            height: 1.3,
            color: Colors.black12,
          ),

          SizedBox(
            height: 20,
          ),
          //Second row with number of days and leave type
          secondRowWithnumberOfDaysAndLeaveType(context),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 1.3,
            color: Colors.black12,
          ),

          SizedBox(
            height: 20,
          ),

          //Therd row with leave description
          therdRowWithleaveDescription(context),

          SizedBox(
            height: 12,
          ),
          Container(
            height: 1.3,
            color: Colors.black12,
          ),

          //leave balance text
          leaveBalanceInfoText(context),
          SizedBox(
            height: 10,
          ),
          leaveBalanceInfoRow(context),
        ],
      ),
    );
  }

  Widget leaveRequestHeadingText(BuildContext context) {
    return SizedBox(
      width: 88,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Leave Request Info ",
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 1.3,
          ),
          Container(
              height: 1,
              color: AppTheme.drawerBackgroundColor3.withOpacity(0.8)),
        ],
      ),
    );
  }

  Widget firstRowWithLeaveDateToandFrom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.calendar_today,
              size: 18,
              color: AppTheme.drawerBackgroundColor3.withOpacity(
                0.8,
              )),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "From",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 8,color:Colors.black38,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "jan 01,2020",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ],
          ),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.calendar_today,
              size: 18,
              color: AppTheme.drawerBackgroundColor3.withOpacity(
                0.8,
              )),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "To",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 8,color:Colors.black38,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "jan 01,2020",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ],
          ),
        ])
      ],
    );
  }

  Widget secondRowWithnumberOfDaysAndLeaveType(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.view_day,
              size: 18,
              color: AppTheme.drawerBackgroundColor3.withOpacity(
                0.8,
              )),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 8,color:Colors.black38,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "2 Days",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 14),
              ),
            ],
          ),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.pages,
              size: 18,
              color: AppTheme.drawerBackgroundColor3.withOpacity(
                0.8,
              )),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Leave type",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 8,color:Colors.black38,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                "Casual",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
          SizedBox(
            width: 27,
          ),
        ]),
      ],
    );
  }

  Widget therdRowWithleaveDescription(BuildContext context) {
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.mode_edit,
            size: 18,
            color: AppTheme.drawerBackgroundColor3.withOpacity(
              0.8,
            )),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reason",
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 8,color:Colors.black38,fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              "Going to attend a weeding paty.",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 10),
            ),
          ],
        ),
      ]),
    );
  }

  Widget leaveBalanceInfoText(BuildContext context) {
    return SizedBox(
      width: 88,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Leave Balance Info",
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 1.3,
          ),
          Container(
              height: 1,
              color: AppTheme.drawerBackgroundColor3.withOpacity(0.8)),
        ],
      ),
    );
  }

  Widget leaveBalanceInfoRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("15",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 16)),
            SizedBox(
              height: 4,
            ),
            Container(
                height: 14,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: AppTheme.lightRed),
                child: Center(
                  child: Text(
                    "Emergency",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 9, color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 4,
            ),
            Text("Available",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 10)),
          ],
        ),
        Column(
          children: [
            Text("5",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 16)),
            SizedBox(
              height: 4,
            ),
            Container(
                height: 14,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: AppTheme.lightBlue),
                child: Center(
                  child: Text(
                    "Casual",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 9, color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 4,
            ),
            Text("Available",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 10)),
          ],
        ),
        Column(
          children: [
            Text("0",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w900, fontSize: 16)),
            SizedBox(
              height: 4,
            ),
            Container(
                height: 14,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: AppTheme.lightamber),
                child: Center(
                  child: Text(
                    "Short",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 9, color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 4,
            ),
            Text("Available",
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 10)),
          ],
        )
      ],
    );
  }
}

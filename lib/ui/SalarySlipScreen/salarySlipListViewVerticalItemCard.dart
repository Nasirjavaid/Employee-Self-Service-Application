import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/config/design_course_app_theme.dart';
import 'package:ess_application/ui/CommonWidgets/roundedImageViewWithoutBorder.dart';

import 'package:flutter/material.dart';

class SalarySlipListViewVerticalItemCard extends StatelessWidget {
  final AnimationController animationController;
  final Animation<dynamic> animation;

  SalarySlipListViewVerticalItemCard(
      {this.animationController, this.animation});

  String leavebalanceImageLink = "assets/images/leavebalance.png";
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: InkWell(
          splashColor: AppTheme.pieChartBackgroundColor4,
          onTap: () {
            // callback();
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(1, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white70),
                    ),
                  ),
                ),
                dataContainer(context),
                imageContainer(context, leavebalanceImageLink)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageContainer(BuildContext context, String leavebalanceImageLink) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Positioned.fill(
        child: Align(
          alignment: Alignment(-1, 0),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: AspectRatio(
                        aspectRatio: 1.0,
                        child: RoundedCornerImageViewWithoutBorder(
                          height: 70,
                          width: 70,
                          imageLink: leavebalanceImageLink,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Positioned.fill(
        child: Align(
          alignment: Alignment(-0.35, 1),
          child: Column(
            children: [Text("data")],
          ),
        ),
      ),
    );
  }
}

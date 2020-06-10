import 'package:flutter/material.dart';

class RoundedCornerImageViewWithoutBorder extends StatelessWidget {


double height,width,borderWidth;
String imageLink;
  RoundedCornerImageViewWithoutBorder({this.height,this.width,this.borderWidth,this.imageLink});
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.white, width: borderWidth),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(imageLink),
                            fit: BoxFit.cover),
                      ),
                    );
  }
}
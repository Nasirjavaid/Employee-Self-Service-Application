import 'package:flutter/material.dart';

class CirculerImageView extends StatelessWidget {

  double height,width;
  CirculerImageView({this.height,this.width});
  @override
  Widget build(BuildContext context) {
    return  Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    //borderRadius: BorderRadius.all(Radius.circular(25)),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/kashifamin.jpg'),
                        fit: BoxFit.cover),
                  ));
  
  }}
import 'package:flutter/material.dart';

class CustomCardShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(

        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.6,

        decoration: BoxDecoration(
          gradient:LinearGradient(
            colors:[Colors.orange,Colors.deepOrangeAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight
          )
        ),

      ),
          );
        }
      }
      
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path myPath = Path();


      myPath.moveTo(0.0, size.height*30);
    myPath.lineTo(0.0, size.height-50);
    myPath.lineTo(size.height, size.width);
     myPath.lineTo(size.width,0.0);

   

    // myPath.quadraticBezierTo(
    //     size.width / 4,
    //     size.height / 1.2,
    //     size.width / 2,
    //     size.height / 1.2
    // );
    // myPath.quadraticBezierTo(
    //     size.width - (size.width / 4),
    //     size.height / 1.2,
    //     size.width,
    //     size.height);
    // myPath.lineTo(size.width, 0.0);
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
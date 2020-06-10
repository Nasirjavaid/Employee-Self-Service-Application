import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerItems {
  // @override
  // Widget build(BuildContext context) {

  //   return  ListTile(
  //             leading: Icon(Icons.home),
  //             title: Text("Home"),
  //             onTap: (){},
  //           );
  // }

  Widget drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return SizedBox(
        height: 27,
        child: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Row(children: <Widget>[
                    Icon(icon, color: Colors.white,size: 22,),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(text,
                          style: GoogleFonts.lato( textStyle : TextStyle(color: Colors.white, fontSize: 12).copyWith(fontWeight:FontWeight.w600))),
                    ),
                  ]))
            ],
          ),
          onTap: onTap,
        ));
  }
}

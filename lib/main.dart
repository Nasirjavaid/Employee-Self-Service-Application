

import 'package:ess_application/ui/LoginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/appTheme.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) =>
      
       runApp(MyApp())
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarDividerColor: Colors.grey,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ));
    return MaterialApp(
      
     // title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // theme: ThemeData(
        
      //   primarySwatch: Colors.blue,
        
      //  textTheme: AppTheme.lightTextTheme,
      
        //  platform: TargetPlatform.iOS,
      // ),
      
      home: LoginScreen(),
    );
  }
}



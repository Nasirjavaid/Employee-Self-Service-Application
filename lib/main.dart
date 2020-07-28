import 'package:ess_application/config/appTheme.dart';
import 'package:ess_application/repository/userAuthRepository.dart';
import 'package:ess_application/ui/CommonWidgets/loadingIndicator.dart';
import 'package:ess_application/ui/DashboardScreen/dashbordScreen.dart';
import 'package:ess_application/ui/LoginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ess_application/ui/SplashScreen/splashScreen.dart';
import 'bloc/userAuthBloc/userAuthBloc.dart';
import 'bloc/userAuthBloc/userAuthEvent.dart';
import 'bloc/userAuthBloc/userAuthState.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserAuthRepository();

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(
        BlocProvider<UserAuthBloc>(
          create: (context) {
            return UserAuthBloc(userAuthRepository: userRepository)
              ..add(AuthStarted());
          },
          child: App(userRepository: userRepository),
        ),
      ));
}

class App extends StatelessWidget {
  final UserAuthRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: BlocBuilder<UserAuthBloc, UserAuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return SplashScreen();
          }

          if (state is AuthInProgress) {
            return LoadingIndicator();
          }

          if (state is AuthSuccess) {
            return DashbordScreen();
          }
          
          if (state is AuthFailure) {
            return LoginPage(userAuthRepository: userRepository);
          }

          return null;
        },
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
//       .then((_) =>

//        runApp(MyApp())
//     );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     //   statusBarColor: Colors.transparent,
//     //   statusBarIconBrightness: Brightness.dark,
//     //   statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
//     //   systemNavigationBarColor: Colors.white,
//     //   systemNavigationBarDividerColor: Colors.grey,
//     //   systemNavigationBarIconBrightness: Brightness.dark,
//     // ));
//     return MaterialApp(

//      // title: 'Flutter UI',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.lightTheme,

//       // theme: ThemeData(

//       //   primarySwatch: Colors.blue,

//       //  textTheme: AppTheme.lightTextTheme,

//         //  platform: TargetPlatform.iOS,
//       // ),

//       home: LoginScreen(),
//     );
//   }
// }

import 'package:ess_application/ui/CommonWidgets/imageSlider.dart';
import 'package:ess_application/ui/DashboardScreen/dashbordScreen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with TickerProviderStateMixin{

  AnimationController animationController;


  @override
  void initState() {
     animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
   // tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 80),
          //Image Slider with text
          ImageSlider(),
          SizedBox(height: 35),

          //Login text
          loginText(),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50, top: 50),
            child: Column(
              children: [
                //user name field
                userNameInputField(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1.0,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent],
                        begin: Alignment(1.0, 0.0),
                        end: Alignment(0.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),

                SizedBox(height: 10),

                //Password field
                passwordNameInputField(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1.0,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.purpleAccent, Colors.blueAccent],
                        begin: Alignment(1.0, 0.0),
                        end: Alignment(0.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
                SizedBox(height: 30),
                //login button
                loginButton(),
                 SizedBox(height: 40),
                forgotPasswordText()
              ],
            ),
          ),
        ],
      )),
    ));
  }

  Widget loginText() {
    return Text("LOGIN", style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w600,color:Colors.black87));
  }

  Widget userNameInputField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,

      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 128,
      style: TextStyle(
        color: Colors.black54,
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
        counterText: "",
        // prefixIcon: Icon(
        //   Icons.person,
        //   size: 22,
        //   color: Color(0xFF72868a),
        // ),
        // contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        // border: const OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 1.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        // enabledBorder: const OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 1.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        // focusedBorder: const OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 1.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        // errorBorder: const OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 1.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        labelText: "USERNAME",
        labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w600,color:Colors.blue)

        // errorStyle: AppTypoGraphy.errorHintStyle
      ),

      validator: (String userName) {
        if (userName.isEmpty) {
          return "User Name";
        } else {
          return null;
        }
      },
    );
  }

  Widget passwordNameInputField() {
    return TextFormField(
      obscureText: true,
      // cursorColor: Color.fromRGBO(64, 75, 96, .9),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
      //controller: firstNameTextController,
      //validator: _validateFirstName,
      maxLength: 128,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        //fontFamily: ScreensFontFamlty.FONT_FAMILTY
      ),
      decoration: InputDecoration(
        counterText: "",
        // prefixIcon: Icon(
        //   Icons.lock,
        //   size: 22,
        //   color: Color(0xFF72868a),
        // ),
        //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: const OutlineInputBorder(
        //     borderSide: const BorderSide(

        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 1.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        // enabledBorder: const OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 1.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        // focusedBorder: const OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         // color: Color.fromARGB(255, 232, 232, 232),
        //         color: Colors.white,
        //         width: 2.0),
        //     borderRadius: BorderRadius.all(Radius.circular(25))),
        labelText: "PASSWORD",
        labelStyle: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w600,color:Colors.blue)

        // errorStyle: AppTypoGraphy.errorHintStyle
      ),
      validator: (String password) {
        if (password.isEmpty) {
          return "password";
        } else {
          return null;
        }
      },
    );
  }

  Widget loginButton() {
    return  SizedBox(
      height: 40,
          child: Padding(
            padding: const EdgeInsets.only(bottom:0.0),
            child: Container(
                   // margin: EdgeInsets.only(top: 0.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      // boxShadow: <BoxShadow>[
                      //   BoxShadow(
                      //     color: Colors.black12,
                      //     offset: Offset(1.0, 6.0),
                      //     blurRadius: 20.0,
                      //   ),
                      //   BoxShadow(
                      //     color: Colors.black12,
                      //     offset: Offset(1.0, 6.0),
                      //     blurRadius: 20.0,
                      //   ),
                      // ],
                      gradient: new LinearGradient(
                          colors: [
                           Colors.blue[800],
                            Colors.blue
                          ],
                          begin: const FractionalOffset(0.0, 1.0),
                          end: const FractionalOffset(0.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: MaterialButton(
                        highlightColor: Colors.blue[300],
                        splashColor:Colors.blue[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 82.0),
                          child: Text(
                            "SIGN IN",
                            style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w600,color:Colors.white)
                          ),
                        ),
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> DashbordScreen(

                           )));
                        }
                        
                           // showInSnackBar("Login button pressed")
                            
                            ),
                  ),
          ),
    );
  }

  Widget forgotPasswordText() {


//return Text("FORGOT PASSWORD?", style:  GoogleFonts.lato());
return Text("FORGOT PASSWORD?", style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.w700,color: Colors.black87));

  }
}

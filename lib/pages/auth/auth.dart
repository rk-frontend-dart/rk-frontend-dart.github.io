import 'dart:async';
import 'dart:html' as html;

import 'package:Lab_RekanKerjaku_FrontEnd/sources/doubles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Lab_RekanKerjaku_FrontEnd/sources/strings.dart';

class authPage extends StatefulWidget
{
  @override
  _authPageState createState() => _authPageState();
}

class _authPageState extends State<authPage>
{
  GlobalKey<ScaffoldState> scaffoldState;
  SharedPreferences sharedPreferences;

  String label = "";

  bool isSignIn;

  void setupConfig() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    isSignIn = sharedPreferences.get("isSignIn") == null ? false : sharedPreferences.getBool("isSignIn");

    setState(()=> label = (isSignIn == false ? "Authentication to Signin" : "${Strings.label0014}"));

    if (isSignIn == false)
    {
      const detik = Duration(milliseconds: 1500);
      Timer.periodic(detik, (Timer timer){
        timer.cancel();
        
        Navigator.pushNamed(context, "/signin").whenComplete((){
          Navigator.pop(context);
        });
      });
    }
    else
    {
      Navigator.pushNamed(context, "/home").whenComplete((){
        Navigator.pop(context);
      });
    }
  }

  @override
  void initState()
  {
    scaffoldState = GlobalKey<ScaffoldState>();

    super.initState();

    html.window.history.pushState(null, "${Strings.appName}", "/auth");

    setupConfig();
  }

  @override
  Widget build(BuildContext context)
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldState,
      body: (
        isSignIn == null || isSignIn == false ?
        Container(
          child: Column(
            children: <Widget>[
              CupertinoActivityIndicator(),

              Padding(padding: EdgeInsets.all(10.0),),

              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          width: screenWidth,
          height: screenHeight,
        ) :
        Container()
      ),
    );
  }
}
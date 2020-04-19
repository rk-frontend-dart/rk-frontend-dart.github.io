import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Lab_RekanKerjaku_FrontEnd/sources/strings.dart';

class signOutPage extends StatefulWidget
{
  @override
  _signOutPageState createState() => _signOutPageState();
}

class _signOutPageState extends State<signOutPage>
{
  GlobalKey<ScaffoldState> scaffoldState;
  SharedPreferences sharedPreferences;

  String label = "";

  Future<void> setupConfig() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    bool isSignIn = sharedPreferences.get("isSignIn") == null ? false : sharedPreferences.getBool("isSignIn");

    setState(()=> label = (isSignIn == false ? "${Strings.label0014}" : "End your site session."));

    sharedPreferences.setBool("isSignIn", false);
    sharedPreferences.setString("userEmail", "");
    sharedPreferences.setString("userPassword", "");
    sharedPreferences.setString("userFullname", "");

    const detik = Duration(milliseconds: 1500,);
    Timer.periodic(detik, (Timer timer){
      timer.cancel();
      Navigator.pushNamed(context, "/signin").whenComplete((){
        Navigator.pop(context);
      });
    });
  }

  @override
  void initState()
  {
    scaffoldState = GlobalKey<ScaffoldState>();

    super.initState();

    html.window.history.pushState(null, "${Strings.appName}", "/signout");

    setupConfig();
  }

  @override
  Widget build(BuildContext context)
  {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldState,
      body: Container(
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
      ),
    );
  }
}
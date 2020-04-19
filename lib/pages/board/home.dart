import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:Lab_RekanKerjaku_FrontEnd/sources/imgpath.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Lab_RekanKerjaku_FrontEnd/pages/board/childs/header.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/sources/strings.dart';

class homePage extends StatefulWidget
{
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
{
  GlobalKey<ScaffoldState> scaffoldState;
  SharedPreferences sharedPreferences;
  
  void setupConfig() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    bool isSignIn = sharedPreferences.get("isSignIn") == null ? false : sharedPreferences.getBool("isSignIn");

    if (isSignIn == false)
    {
      Navigator.pushNamed(context, "/signin").whenComplete((){
        Navigator.pop(context);
      });
    }
    else
    {}
  }

  @override
  void initState()
  {
    scaffoldState = GlobalKey<ScaffoldState>();

    super.initState();

    html.window.history.pushState(null, "${Strings.appName}", "/home");

    setupConfig();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      key: scaffoldState,
      body: Container(
        child: Stack(
          children: <Widget>[
            // Wallpaper
            Image.asset(
              "${ImgPath.wallpaper}",
              fit: BoxFit.cover,
            ),

            Column(
              children: [
                headerContent(),

                Expanded(child: Container()),
              ],
            ),

            // Column(
            //   children: <Widget>[
            //     Padding(padding: EdgeInsets.all(25.0),),

            //     Image.asset(
            //       "${ImgPath.logoCompany}",
            //       fit: BoxFit.contain,
            //       height: 85.0,
            //       width: 350.0,
            //     ),

            //     Padding(padding: EdgeInsets.all(10.0),),

            //     (
            //       isLoading == true ? pageLoading() : (
            //         isFormSignIn == true ? pageSignIn() : pageForgetPassword()
            //       )
            //     ),

            //     Padding(padding: EdgeInsets.all(25.0 * 2),),

            //     iLabel(label: "${Strings.label0003}", color: Colors.white),
            //   ],
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            // ),
          ],
          alignment: Alignment.center,
          fit: StackFit.expand,
        ),
      ),
    );
  }
}
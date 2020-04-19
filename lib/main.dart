import 'dart:io';

import 'package:Lab_RekanKerjaku_FrontEnd/dev/test.dart';
import 'package:flutter/material.dart';

import 'package:Lab_RekanKerjaku_FrontEnd/pages/auth/auth.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/pages/board/home.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/pages/user/signin.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/pages/user/signout.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/sources/strings.dart';

void main()
{
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "${Strings.appName}",
      theme: ThemeData(
        fontFamily: "${Strings.fontFamily}",
        primaryColor: const Color(0xFF004471),
        backgroundColor: Colors.white,
        brightness: Brightness.light,

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: authPage(),
      routes: <String, WidgetBuilder>
      {
        "/": (BuildContext context)=> authPage(),
        "/auth": (BuildContext context)=> authPage(),
        "/home": (BuildContext context)=> homePage(),
        "/signin": (BuildContext context)=> signInPage(),
        "/signout": (BuildContext context)=> signOutPage(),
        "/testjwt": (BuildContext context)=> testJWTPage(),
      },
      onUnknownRoute: (RouteSettings route){
        return route.arguments;
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides
{
  @override
  HttpClient createHttpClient(SecurityContext context)
  {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Lab_RekanKerjaku_FrontEnd/data/jsonAPI.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/data/jsonSignIn.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/data/jsonWallpaper.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/sources/doubles.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/sources/imgpath.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/sources/strings.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/widgets/objects.dart';

class signInPage extends StatefulWidget
{
  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage>
{
  GlobalKey<ScaffoldState> scaffoldState;
  SharedPreferences sharedPreferences;

  TextEditingController textLogEmail;
  TextEditingController textLogPassword;

  TextEditingController textFPEmail;

  bool isLoading = false;
  bool isFormSignIn = true;

  var currentPage;

  void clickButtonBackToSigninPage() async
  {
    textFPEmail.text = "";

    textLogEmail.text = "";
    textLogPassword.text = "";

    setState(()=> isFormSignIn = true);
  }

  void clickButtonForgetPassword() async
  {
    textFPEmail.text = "";

    textLogEmail.text = "";
    textLogPassword.text = "";

    setState(()=> isFormSignIn = false);
  }

  void clickButtonResetPassword() async
  {
    String fpEmail = textFPEmail.text;

    if (fpEmail.isEmpty)
    {
      iSnackBar(
        scaffoldState: scaffoldState,
        message: "${Strings.message002}"
      );
    }
    else
    {
      setState(()=> isLoading = true);

      preparedForgetPassword();
    }
  }

  void clickButtonSignIn() async
  {
    String logEmail = textLogEmail.text;
    String logPass = textLogPassword.text;

    if (logEmail.isEmpty || logPass.isEmpty)
    {
      iSnackBar(
        scaffoldState: scaffoldState,
        message: "${Strings.message002}"
      );
    }
    else if (!logEmail.contains("@") || !logEmail.contains("."))
    {
      iSnackBar(
        scaffoldState: scaffoldState,
        message: "${Strings.message002}"
      );
    }
    else if (logPass == logEmail)
    {
      iSnackBar(
        scaffoldState: scaffoldState,
        message: "${Strings.message002}"
      );
    }
    else
    {
      List list = List();
      
      String message = "";

      for (int i = 0; i < dataJsonSignIn.length; i++)
      {
        if ("${dataJsonSignIn[i]["email"]}" == "$logEmail" && "${dataJsonSignIn[i]["password"]}" == "$logPass")
        {
          list.add(dataJsonSignIn[i]);
        }
        else
        {
          setState(()=> message = "${Strings.message007}");
        }
      }

      if (list.length == 1)
      {
        sharedPreferences = await SharedPreferences.getInstance();

        sharedPreferences.setBool("isSignIn", true);
        sharedPreferences.setString("userEmail", "${list[0]["email"]}");
        sharedPreferences.setString("userPassword", "${list[0]["password"]}");
        sharedPreferences.setString("userFullname", "${list[0]["fullname"]}");

        setState(()=> isLoading = true);

        const detik = Duration(milliseconds: 1500,);
        Timer.periodic(detik, (Timer timer){
          timer.cancel();
          Navigator.pushNamed(context, "/home").whenComplete((){
            Navigator.pop(context);
          });
        });
      }
      else
      {
        iSnackBar(
          scaffoldState: scaffoldState,
          message: "$message"
        );
      }
    }
  }

  void initCurrentPage()
  {
    currentPage = dataJsonWallpaper.length.toDouble() - 1.0;
  }

  Future<void> preparedForgetPassword() async
  {
    String userEmail = textFPEmail.text;

    // Map<String, dynamic> body = {
    //   "\"account\"": [
    //     {
    //       "\"user\"": [
    //         {
    //           "\"profile\"": [
    //             {
    //               "\"email\"": "\"$userEmail\""
    //             }
    //           ]
    //         }
    //       ]
    //     }
    //   ]
    // };

    // var url = "${dataJsonAPI[0]["url"]}";
    // var response = await http.post(
    //   url,
    //   encoding: Encoding.getByName("utf-8"),
    //   headers: {
    //     "Access-Control-Allow-Origin": "${Strings.apiHost}",
    //     "Access-Control-Allow-Credentials": "true",
    //     "Accept": "application/json"
    //   },
    //   body: {
    //     "email": "$userEmail"
    //   }
    // );

    http.Response response = await http.Client().post(
      Uri.encodeFull("${dataJsonAPI[0]["url"]}"),
      encoding: Encoding.getByName("utf-8"),
      headers: {
        "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Headers": "Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin",
        "Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
        "Access-Control-Expose-Headers": "Authorization, authenticated",
        "Access-Control-Allow-Credentials": "true",
        "Accept": "application/json"
      },
      body: {
        "email": "$userEmail"
      }
    );

    var result = await json.decode(response.body);

    print("");
    print(response.statusCode);
    print(result);

    // if (response.statusCode == 200)
    if (result != null)
    {
      // var varData = await json.decode(response.body);
      // var result = await json.decode(response.body);

      setState(()=> isLoading = false);
      setState(()=> isFormSignIn = true);

      iSnackBar(
        scaffoldState: scaffoldState,
        message: "${result["message"]}"
      );
    }
    else
    {
      setState(()=> isLoading = false);
      setState(()=> isFormSignIn = false);

      iSnackBar(
        scaffoldState: scaffoldState,
        message: "${Strings.message003}"
      );
    }
  }

  void setupConfig() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    bool isSignIn = sharedPreferences.get("isSignIn") == null ? false : sharedPreferences.getBool("isSignIn");

    if (isSignIn == false)
    {}
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

    textLogEmail = TextEditingController();
    textLogPassword = TextEditingController();

    textFPEmail = TextEditingController();

    super.initState();

    html.window.history.pushState(null, "${Strings.appName}", "/signin");

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
              children: <Widget>[
                Padding(padding: EdgeInsets.all(25.0),),

                Image.asset(
                  "${ImgPath.logoCompany}",
                  fit: BoxFit.contain,
                  height: 85.0,
                  width: 350.0,
                ),

                Padding(padding: EdgeInsets.all(10.0),),

                (
                  isLoading == true ? pageLoading() : (
                    isFormSignIn == true ? pageSignIn() : pageForgetPassword()
                  )
                ),

                Padding(padding: EdgeInsets.all(25.0 * 2),),

                iLabel(label: "${Strings.label0003}", color: Colors.white),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
          alignment: Alignment.center,
          fit: StackFit.expand,
        ),
      ),
    );
  }

  Widget pageForgetPassword()
  {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "${Strings.label0012}",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),

            Padding(padding: EdgeInsets.all(10.0),),

            Material(
              child: Container(
                child: Container(
                  child: iEditText6(
                    keyboardType: TextInputType.text,
                    keyboardAction: TextInputAction.done,
                    controller: textFPEmail,
                    hint: "${Strings.label0004}",
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 5.0, right: 5.0,),
                ),
                color: Colors.grey[500],
                padding: EdgeInsets.all(1.0),
              ),
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
            ),

            Padding(padding: EdgeInsets.all(10.0),),

            Container(
              child: Row(
                children: <Widget>[
                  // Reset Password
                  Material(
                    child: InkWell(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              height: 25.0,
                              alignment: Alignment.center,
                              // padding: EdgeInsets.only(bottom: 5.0,),
                            ),

                            Padding(padding: EdgeInsets.all(5.0),),

                            Text(
                              "${Strings.label0010}",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        height: Doubles.buttonHeight,
                        // color: const Color(0xFF004471), // Colors.lightBlue[500],
                        padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                      ),
                      onTap: ()=> clickButtonResetPassword(),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    clipBehavior: Clip.antiAlias,
                    color: const Color(0xFF004471), // Colors.transparent,
                    // shadowColor: Colors.grey[500],
                    elevation: 1.0,
                  ),

                  Padding(padding: EdgeInsets.all(15.0),),

                  // Back to SignIn
                  Expanded(
                    child: Material(
                      child: InkWell(
                        child: Container(
                          child: Text(
                            "${Strings.label0011}",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          height: Doubles.buttonHeight,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10.0,),
                        ),
                        onTap: ()=> clickButtonBackToSigninPage(),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              // height: Doubles.buttonHeight,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        width: Doubles.widthForm350,
        padding: EdgeInsets.all(25.0),
      ),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15.0),
        topLeft: Radius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 1.0,
    );
  }

  Widget pageLoading()
  {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            CupertinoActivityIndicator(),
            
            Padding(padding: EdgeInsets.all(10.0),),

            Text(
              "${Strings.label0013}",
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
        height: Doubles.heightForm200,
        width: Doubles.widthForm350,
        padding: EdgeInsets.all(25.0),
      ),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15.0),
        topLeft: Radius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 1.0,
    );
  }

  Widget pageSignIn()
  {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "${Strings.label0006}",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),

            Padding(padding: EdgeInsets.all(10.0),),

            Material(
              child: Container(
                child: Container(
                  child: iEditText6(
                    keyboardType: TextInputType.text,
                    keyboardAction: TextInputAction.done,
                    controller: textLogEmail,
                    hint: "${Strings.label0004}",
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 5.0, right: 5.0,),
                ),
                color: Colors.grey[500],
                padding: EdgeInsets.all(1.0),
              ),
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
            ),

            Padding(padding: EdgeInsets.all(10.0),),
            
            Material(
              child: Container(
                child: Container(
                  child: iPassword2(
                    keyboardType: TextInputType.text,
                    keyboardAction: TextInputAction.done,
                    controller: textLogPassword,
                    hint: "${Strings.label0005}",
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 5.0, right: 5.0,),
                ),
                color: Colors.grey[500],
                padding: EdgeInsets.all(1.0),
              ),
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
            ),

            Padding(padding: EdgeInsets.all(10.0),),

            Container(
              child: Row(
                children: <Widget>[
                  // SignIn
                  Material(
                    child: InkWell(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              height: 25.0,
                              alignment: Alignment.center,
                              // padding: EdgeInsets.only(bottom: 5.0,),
                            ),

                            Padding(padding: EdgeInsets.all(5.0),),

                            Text(
                              "${Strings.label0007}",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        height: Doubles.buttonHeight,
                        // color: const Color(0xFF004471), // Colors.lightBlue[500],
                        padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                      ),
                      onTap: ()=> clickButtonSignIn(),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    clipBehavior: Clip.antiAlias,
                    color: const Color(0xFF004471), // Colors.transparent,
                    // shadowColor: Colors.grey[500],
                    elevation: 1.0,
                  ),

                  Padding(padding: EdgeInsets.all(15.0),),

                  // Forget Password
                  Expanded(
                    child: Material(
                      child: InkWell(
                        child: Container(
                          child: Text(
                            "${Strings.label0008}",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          height: Doubles.buttonHeight,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10.0,),
                        ),
                        onTap: ()=> clickButtonForgetPassword(),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              // height: Doubles.buttonHeight,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        width: Doubles.widthForm350,
        padding: EdgeInsets.all(25.0),
      ),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15.0),
        topLeft: Radius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 1.0,
    );
  }
}
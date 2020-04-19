import 'package:flutter/material.dart';

import 'package:Lab_RekanKerjaku_FrontEnd/data/jsonMenuHeader.dart';
import 'package:Lab_RekanKerjaku_FrontEnd/sources/imgpath.dart';

class headerContent extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    double height = 100.0;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Row(
        children: [
          childLogo(pathLogo: "${ImgPath.logoHeader}"),

          childMenus(menu: dataJsonMenuHeader)
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      // padding: EdgeInsets.only(right: 25.0),
    );
  }

  Widget childLogo({@required String pathLogo})
  {
    double height = 125.0;
    double width = 300.0;

    return Material(
      child: InkWell(
        child: Container(
          child: Image.asset(
            pathLogo,
            width: width,
            height: height,
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
          ),
          padding: EdgeInsets.only(left: 20.0, right: 25.0),
        ),
        onTap: ()=> print("Click me."),
      ),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      elevation: 0.0,
    );
  }

  Widget childMenus({@required List menu})
  {
    double height = 125.0;

    List<Widget> childsMenu = List();

    for (int i = 0; i < menu.length; i++)
    {
      childsMenu.add(
        Container(
          child: Material(
            child: InkWell(
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      menu[i]["icon"] as IconData,
                      color: Colors.white,
                      size: 16.0,
                    ),

                    Padding(padding: EdgeInsets.all(5.0),),

                    Text(
                      "${menu[i]["label"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                height: height,
                padding: EdgeInsets.only(left: 15.0, right: i+1 == menu.length ? 35.0 : 15.0),
              ),
              onTap: ()=> print("Click me."),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(i == 0 ? 10.0 : 0.0),
              // bottomRight: Radius.circular(i+1 == menu.length ? 10.0 : 0.0)
            ),
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            elevation: 0.0,
          ),
        )
      );
    }

    return Expanded(
      child: Container(
        child: Row(
          children: childsMenu.toList(),
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        height: height,
      ),
    );
  }
}
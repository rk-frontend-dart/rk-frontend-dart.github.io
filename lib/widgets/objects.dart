import 'package:flutter/material.dart';

Widget iBullet({@required Color color, @required double size})
{
  double dRadius = 100.0;

  // Bullet
  return Container(
    child: ClipRRect(
      child: Material(
        child: Stack(
          children: <Widget>[],
          fit: StackFit.expand,
        ),
        color: color,
        elevation: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(dRadius)),
      clipBehavior: Clip.antiAlias,
    ),
    height: size, width: size,
  );
  // End of Bullet
}

class iEditText1 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;

  iEditText1({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    @required this.focusNode,
    @required this.onChanged,
    @required this.onSubmitted
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.white,
      ),
      child: Container(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "  . . .  ",
            hintStyle: TextStyle(
              color: Colors.white,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),

            // labelText: "Pencarian",
            // labelStyle: TextStyle(
            //   color: Colors.black,
            //   fontFamily: "${Strings.fontFamily}",
            //   fontSize: 12.0,
            //   fontWeight: FontWeight.normal
            // ),

            // prefixIcon: IconButton(
            //   icon: Icon(
            //     Icons.search,
            //     color: Colors.grey[500],
            //     size: 25.0,
            //   ),
            //   onPressed: (){
            //     String value = controller.text;
            //     print("#onPressed #IconButton");
            //     print(value);
            //     print("");
            //     if (value.isNotEmpty)
            //     {
            //       // Navigator.push(
            //       //   context,
            //       //   MaterialPageRoute(
            //       //     builder: (context)=> pmNewsSearch(
            //       //       controllerTabMenu: null,
            //       //       search: value,
            //       //     ),
            //       //   ),
            //       // ).whenComplete((){
            //       //   Navigator.pop(context);
            //       // });
            //     }
            //   },
            // ),
          ),

          keyboardType: keyboardType,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.white,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),

          onChanged: onChanged,
          // onChanged: onSubmitted,
          onSubmitted: onSubmitted,

          // onEditingComplete: (){
          //   String value = controller.text;
          //   print("#onEditingComplete");
          //   print(value);
          //   print("");
          //   if (value.isNotEmpty)
          //   {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context)=> NewsSearch(
          //           search: value,
          //         ),
          //       ),
          //     ).whenComplete((){
          //       Navigator.pop(context);
          //     });
          //   }
          // },

          // onFieldSubmitted: (String value){
          //   value = controller.text;
          //   print("#onFieldSubmitted");
          //   print(value);
          //   print("");
          //   if (value.isNotEmpty)
          //   {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context)=> NewsSearch(
          //           search: value,
          //         ),
          //       ),
          //     ).whenComplete((){
          //       Navigator.pop(context);
          //     });
          //   }
          // },
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iEditText2 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final bool isObscureText;

  iEditText2({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    @required this.isObscureText
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            // border: InputBorder.none,
            hintText: "  . . .  ",
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal
            ),
          ),

          keyboardType: keyboardType,
          obscureText: isObscureText,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.black,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iEditText3 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final bool isObscureText;
  final double fontSize;
  final FontWeight fontWeight;

  iEditText3({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    @required this.isObscureText,
    @required this.fontSize,
    @required this.fontWeight,
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "  . . .  ",
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),

          keyboardType: keyboardType,
          maxLines: null,
          obscureText: isObscureText,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.black,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iEditText4 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final TextAlign textAlign;
  final bool isObscureText;
  final bool isEnabled;
  final double fontSize;

  iEditText4({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    @required this.textAlign,
    @required this.isObscureText,
    @required this.isEnabled,
    @required this.fontSize,
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            // border: InputBorder.none,
            hintText: "  . . .  ",
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal
            ),
          ),

          enabled: isEnabled,
          keyboardType: keyboardType,
          obscureText: isObscureText,
          textInputAction: keyboardAction,
          textAlign: textAlign,

          style: TextStyle(
            color: Colors.black,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: fontSize, // 12.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iEditText5 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final bool isObscureText;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String hint;
  final TextAlign textAlign;

  final bool isEnabled;
  final bool isReadOnly;

  final bool isCopy;
  final bool isCut;
  final bool isPaste;
  final bool isSelectAll;

  final void Function(String value) onChanged;

  iEditText5({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    @required this.isObscureText,
    @required this.textColor,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.hint,
    @required this.textAlign,

    @required this.isEnabled,
    @required this.isReadOnly,

    @required this.isCopy,
    @required this.isCut,
    @required this.isPaste,
    @required this.isSelectAll,

    @required this.onChanged
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          autocorrect: false,
          controller: controller,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "$hint",
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),

          enabled: isEnabled,
          enableSuggestions: true,
          enableInteractiveSelection: true,
          focusNode: FocusNode(
            canRequestFocus: true,
            skipTraversal: true
          ),
          keyboardAppearance: Brightness.dark,
          keyboardType: keyboardType,
          maxLines: null,
          obscureText: isObscureText,
          onChanged: onChanged,
          readOnly: isReadOnly,
          scrollPhysics: ClampingScrollPhysics(),
          style: TextStyle(
            color: textColor,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          textInputAction: keyboardAction,
          textAlign: textAlign,
          toolbarOptions: ToolbarOptions(
            copy: isCopy,
            cut: isCut,
            paste: isPaste,
            selectAll: isSelectAll
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iEditText6 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  // final bool isObscureText;
  // final double fontSize;
  // final FontWeight fontWeight;
  final String hint;

  iEditText6({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    // @required this.isObscureText,
    // @required this.fontSize,
    // @required this.fontWeight,
    @required this.hint,
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "$hint",
            hintStyle: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.none,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0, // fontSize,
              fontWeight: FontWeight.w400, // fontWeight,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0, // fontSize,
              fontWeight: FontWeight.w300 // fontWeight,
            ),
          ),

          keyboardType: keyboardType,
          maxLines: null,
          // obscureText: isObscureText,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.black,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0, // fontSize,
            fontWeight: FontWeight.w400, // fontWeight,
          ),

          textCapitalization: TextCapitalization.sentences,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iEditText7 extends StatelessWidget
{
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final String hint;

  iEditText7({
    @required this.controller,
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.hint,
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "$hint",
            hintStyle: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.none,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
            ),
          ),

          keyboardType: keyboardType,
          maxLines: 1,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),

          textCapitalization: TextCapitalization.sentences,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iLabel extends StatelessWidget
{
  final String label;
  final Color color;

  iLabel({
    @required this.label,
    @required this.color
  });

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    textEditingController.text = label;

    return Container(
      // child: Text(
      //   label,
      //   style: TextStyle(
      //     color: color,
      //     decoration: TextDecoration.none,
      //     fontSize: 12.0,
      //   ),
      // ),

      // child: SelectableText(
      //   label,
      //   cursorWidth: 1.0,
      //   cursorColor: Colors.blue[700],
      //   cursorRadius: Radius.circular(5.0),
      //   enableInteractiveSelection: true,
      //   // maxLines: 1,
      //   onTap: ()=> print("That tickles!"),
      //   // scrollPhysics: ClampingScrollPhysics(),
      //   showCursor: true,
      //   style: TextStyle(
      //     color: color,
      //     decoration: TextDecoration.none,
      //     fontSize: 12.0,
      //   ),
      //   toolbarOptions: ToolbarOptions(
      //     copy: true,
      //     // cut: false,
      //     // paste: false,
      //     // selectAll: true
      //   ),
      // ),

      child: Wrap(
        children: [
          iEditText5(
            keyboardType: TextInputType.multiline,
            keyboardAction: TextInputAction.done,
            controller: textEditingController,
            isObscureText: false,
            textColor: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            hint: "",
            textAlign: TextAlign.center,

            isEnabled: true,
            isReadOnly: false,

            isCopy: true,
            isCut: false,
            isPaste: false,
            isSelectAll: true,

            onChanged: (value){
              textEditingController.text = "";
              textEditingController.text = label;
            },
          ),
        ],
        alignment: WrapAlignment.center,
      ),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
    );
  }
}

class iPassword extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  final bool isObscureText;
  final Function() onTapVisibilityPassword;
  final IconData iconVisibilityPassword;

  iPassword({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    @required this.isObscureText,
    @required this.onTapVisibilityPassword,
    @required this.iconVisibilityPassword,
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            hintText: "  . . .  ",
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0,
              fontWeight: FontWeight.normal
            ),

            suffixIcon: InkWell(
              child: Icon(
                iconVisibilityPassword,
                color: Colors.grey[500],
                size: 20.0,
              ),
              onTap: onTapVisibilityPassword,
            ),
          ),

          keyboardType: keyboardType,
          obscureText: isObscureText,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.black,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iPassword2 extends StatelessWidget
{
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final TextEditingController controller;
  // final bool isObscureText;
  // final double fontSize;
  // final FontWeight fontWeight;
  final String hint;

  iPassword2({
    @required this.keyboardType,
    @required this.keyboardAction,
    @required this.controller,
    // @required this.isObscureText,
    // @required this.fontSize,
    // @required this.fontWeight,
    @required this.hint,
  });

  @override
  Widget build(BuildContext context)
  {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        cursorColor: Colors.black
      ),
      child: Container(
        child: TextField(
          controller: controller,
          keyboardAppearance: Brightness.dark,
          
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "$hint",
            hintStyle: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.none,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0, // fontSize,
              fontWeight: FontWeight.w400, // fontWeight,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              // fontFamily: "${Strings.fontFamily}",
              fontSize: 12.0, // fontSize,
              fontWeight: FontWeight.w300 // fontWeight,
            ),
          ),

          keyboardType: keyboardType,
          maxLines: null,
          obscureText: true,
          // obscureText: isObscureText,
          textInputAction: keyboardAction,
          textAlign: TextAlign.left,

          style: TextStyle(
            color: Colors.black,
            // fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0, // fontSize,
            fontWeight: FontWeight.w400, // fontWeight,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}

class iVisibility extends StatelessWidget
{
  final String visibility;
  final Widget child;
  final Widget removedChild;

  iVisibility ({
    @required this.child,
    @required this.visibility
  }) : this.removedChild = Container();

  @override
  Widget build(BuildContext context)
  {
    if (visibility == "visible")
    {
      return child;
    }
    else if (visibility == "invisible")
    {
      return IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: 0.0,
          child: child,
        ),
      );
    }
    else if (visibility == "offscreen")
    {
      return Offstage(
        offstage: true,
        child: child,
      );
    }
    else
    {
      // value is "gone"

      // If gone, we replace child with a custom widget (defaulting to a
      // [Container] with no defined size).
      return removedChild;
    }
  }
}

Widget iRectangle({@required Color color, @required double height, @required double width})
{
  double dRadius = 100.0;

  // Bullet
  return Container(
    child: ClipRRect(
      child: Material(
        child: Stack(
          children: <Widget>[],
          fit: StackFit.expand,
        ),
        color: color,
        elevation: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(dRadius)),
      clipBehavior: Clip.antiAlias,
    ),
    height: height, width: width,
  );
  // End of Bullet
}

iSnackBar({@required GlobalKey<ScaffoldState> scaffoldState, @required String message})
{
  scaffoldState.currentState.showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: TextStyle(
          decoration: TextDecoration.none,
          // fontFamily: "${Strings.fontFamily}",
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: Duration(milliseconds: 1000,),
    ),
  );
}
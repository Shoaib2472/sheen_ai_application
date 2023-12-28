import 'package:flutter/material.dart';
import 'package:get/get.dart';

var blueColor = Color.fromARGB(255, 139, 171, 227);
var blackColor = Colors.black;
customElevatedButton(String text, BuildContext context, Function onTap) {
  var screenHeight = MediaQuery.of(context).size.height;
  var screenwidth = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: screenwidth / 90, vertical: screenHeight / 72),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Mesmeric',
            color: blackColor,
            fontWeight: FontWeight.bold,
            fontSize: screenHeight / 65),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(50, 40),
          padding: EdgeInsets.symmetric(horizontal: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: blueColor),
    ),
  );
}

Text cusText(
  String text,
  double fontSize, {
  FontWeight? Boldness,
  Color? textColor,
  Color? backgroundColor,
}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: Boldness,
        overflow: TextOverflow.ellipsis,
        color: textColor,
        fontFamily: 'Mesmeric',
        backgroundColor: backgroundColor != null ? backgroundColor : null),
  );
}

Text smallText(
  String text, {
  FontWeight? Boldness,
  Color? textColor,
  Color? backgroundColor,
}) {
  return cusText(text, 15,
      textColor: textColor,
      Boldness: Boldness,
      backgroundColor: backgroundColor);
}

Text mediumText(
  String text, {
  FontWeight? Boldness,
  Color? textColor,
  Color? backgroundColor,
}) {
  return cusText(text, 16,
      textColor: textColor,
      Boldness: Boldness,
      backgroundColor: backgroundColor);
}

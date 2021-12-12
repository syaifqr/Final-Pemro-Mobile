import 'package:flutter/material.dart';
import 'package:project_uas_flutter/utility/color.dart';

// ignore: must_be_immutable
class ButtonWidget1 extends StatelessWidget {
  var btnText = "";
  var onClick;

  ButtonWidget1({required this.btnText, this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            blueColors,
            blueLightColors
          ], end: Alignment.centerLeft, begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonWidget2 extends StatelessWidget {
  var btnText = "";
  var onClick;

  ButtonWidget2({required this.btnText, this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            redColors,
            redLightColors
          ], end: Alignment.centerLeft, begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

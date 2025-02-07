import 'package:flutter/material.dart';

abstract class Style {
  static const textStyle18Black = TextStyle(fontSize: 18, color: Colors.black);
  static const textStyle18White = TextStyle(fontSize: 18, color: Colors.white);

  static const textStyle24Black = TextStyle(fontSize: 24, color: Colors.black);

  static const textStyle24White = TextStyle(fontSize: 24, color: Colors.white);

  static const textStyleBold24Black =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
  static const textStyleBold24White =
      TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold);

  static const textStyleBold35Black =
      TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold);
  static const textStyleBold35White =
      TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
}

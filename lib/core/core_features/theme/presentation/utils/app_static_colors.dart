import 'package:flutter/material.dart';

abstract class AppStaticColors {
  static const Color primary = Color(0xFF11078C);
  static const Color toastColor = Color(0xFF11078C);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color lightBlack = Color(0xff333333);
  static const Color lightOrange = Color(0xFFFFba03);
  static const Color greyShadow = Color(0xffD9D9D9);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF58b9f0);
  static const LinearGradient primaryIngredientColor = LinearGradient(
    colors: [Color(0xFF11078C), Color(0xFF11078C)],
    stops: [0, 1],
  );
}

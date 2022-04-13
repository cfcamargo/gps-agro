import 'package:flutter/material.dart';

class AppStyleValues {
  static const appTextDecorationBig = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 38,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal);
  static const appTextDecorationBigBold = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 38,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold);
  static const appTextDecoration = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 30,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal);
  static const appTextDecorationBold = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 30,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold);
  static const appTextDecorationSmall = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 12,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal);
  static const appTextDecorationMedium = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 20,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal);
  static const appTextDecorationMediumBold = TextStyle(
      color: Colors.white,
      decoration: TextDecoration.none,
      fontSize: 20,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold);
  static const userActivitiesTitleTextDecoration = TextStyle(
      color: appMainColor,
      decoration: TextDecoration.none,
      fontSize: 30,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold);
  static const appMainColor = Color(0xFF774FD1);
  static const appSecondaryColor = Color(0xFF04BF58);
  static const appGrayBg = Color(0xFFE4E4E4);
  static const appLoginFormBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(const Radius.circular(10)),
      borderSide: BorderSide(width: 0, style: BorderStyle.none));
}

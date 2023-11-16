import 'package:flutter/material.dart';

abstract class AppStyles {
  static const appbarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(15),
    ),
  );

  static const textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const locationTextStyle = TextStyle(
    color: AppColors.textCustomColor,
  );

  static const releatedCollectionTextStyle = TextStyle(
      color: AppColors.boldTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w600);
  static const releatedCollectionTitleTextStyle = TextStyle(
      color: Color.fromRGBO(17, 17, 17, 1),
      fontSize: 18,
      fontWeight: FontWeight.w600);

  static const collectionTitleStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: AppColors.boldTextColor);
}

abstract class AppColors {
  static const boldTextColor = Color.fromRGBO(17, 17, 17, 1);
  static const appBarcolor = Color.fromRGBO(137, 237, 10, 100);
  static const tagColor = Color.fromRGBO(228, 224, 224, 1);
  static const textCustomColor = Color.fromRGBO(118, 118, 118, 1);
  static const buttonBorderSideColor = Color.fromRGBO(118, 118, 118, 1);
}

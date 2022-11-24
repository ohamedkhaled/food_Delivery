import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';

import 'Font_Manger.dart';




TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color ,double height) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight,
      height: height
  );
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color ,double height =AppSize.s1_2}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,height);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color,double height =AppSize.s1_2}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color,height);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color,double height =AppSize.s1_2}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color,height);
}

// bold style

TextStyle getBoldtStyle(
    {double fontSize = FontSize.s12, required Color color,double height =AppSize.s1_2}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color,height);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color,double height =AppSize.s1_2}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,height);
}
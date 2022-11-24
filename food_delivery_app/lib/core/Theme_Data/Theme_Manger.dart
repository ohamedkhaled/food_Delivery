import 'package:flutter/material.dart';
import '../Resours_Manger/Color_Manger.dart';
import '../Resours_Manger/Font_Manger.dart';
import '../Resours_Manger/Style_Manger.dart';
import '../Resours_Manger/Values_Manger.dart';

ThemeData getAppTheme() => ThemeData(
      //main color
      primaryColor: ColorManager.mainColor,
      disabledColor: ColorManager.paraColor,

      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.yellowColor,
          elevation: AppSize.s4,
          shadowColor: ColorManager.buttonBachgroundColor,
          titleTextStyle: getRegularStyle(
              fontSize: AppSize.s16, color: ColorManager.mainBlackColor)),

      textTheme: TextTheme(
        titleLarge: getSemiBoldStyle(
            color: ColorManager.mainColor, fontSize: FontSize.s20), //for text bar
        titleMedium: getRegularStyle(
                color: ColorManager.mainBlackColor, fontSize: FontSize.s12),// for name city
        titleSmall:
            getRegularStyle(color: ColorManager.textColor, fontSize: FontSize.s12,height: AppSize.s1_8),
        //
        bodySmall:
            getSemiBoldStyle(color: ColorManager.textColor, fontSize: FontSize.s16,height: AppSize.s1_5),
        //
        // bodyMedium:
        //     getLightStyle(color: ColorManager.white, fontSize: FontSize.s12),
        // bodyLarge:
        //     getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s16),
        //
        headlineMedium: getRegularStyle(
            color: ColorManager.titleColor, fontSize: FontSize.s20), // to titles and header
        headlineLarge:
            getLightStyle(color: ColorManager.mainBlackColor, fontSize: FontSize.s20),
        headlineSmall:
            getBoldtStyle(color: Colors.white, fontSize: 16), // for text inside button
        //
        labelLarge:
            getRegularStyle(color: ColorManager.mainBlackColor, fontSize: FontSize.s25),
        //
        displayLarge: getSemiBoldStyle(
            color: ColorManager.moneyColor, fontSize: FontSize.s16),
      ),
    );

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Font_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

class TotalItemWidget extends StatelessWidget {
  final int totalQuantity;
  final Color? textColor;
  final Color? backgroundColor;
  const TotalItemWidget(
      {required this.totalQuantity,
      this.textColor,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize! * AppSize.s2,
      width: ConfigSize.defaultSize! * AppSize.s2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(ConfigSize.defaultSize! * AppSize.s2)),
          color: backgroundColor ?? ColorManager.mainColor),
      child: Center(
          child: Text(
        totalQuantity.toString(),
        textAlign: TextAlign.center,
        style:
            TextStyle(color: textColor ?? Colors.white, fontSize: FontSize.s10),
      )),
    );
  }
}

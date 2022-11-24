import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

class CustomOpcityButton extends StatelessWidget {
  const CustomOpcityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: ConfigSize.defaultSize! * AppSize.s12,
        height: ConfigSize.defaultSize! * AppSize.s3,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
            border:
                Border.all(width: AppSize.s1_2, color: ColorManager.mainColor)),
        child: const Center(
            child: Text(
          StringManger.oneMore,
          style: TextStyle(color: ColorManager.mainColor),
        )),
      ),
    );
  }
}

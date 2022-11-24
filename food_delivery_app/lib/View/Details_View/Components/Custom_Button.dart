import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double raduis;
  final double width;
  final double hieght;
  final void Function()?  pressed ;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.raduis,
      required this.width,
      required this.hieght ,
      required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      child:  Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis)),
          backgroundColor: ColorManager.mainColor,
          animationDuration: Duration(milliseconds: AppIntValues.i100),
          minimumSize: Size(width, hieght),
          elevation: AppSize.s0),
    );
  }
}

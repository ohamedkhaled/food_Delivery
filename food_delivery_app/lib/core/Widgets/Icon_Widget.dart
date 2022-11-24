import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double sizeIcon;
  final void Function()? pressed;
  final double? raduis ;
  const IconWidget(
      {Key? key,
      required this.pressed,
      required this.iconData,
      required this.iconColor,
      required this.backgroundColor,
      required this.size,  this.sizeIcon=AppSize.s20 ,this.raduis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular( raduis==null?size / AppIntValues.i2 : raduis!)),
            color: backgroundColor),
        child: IconButton(
          onPressed: pressed,
          icon: Icon(iconData, color: iconColor ,size: sizeIcon,),
        ));
  }
}

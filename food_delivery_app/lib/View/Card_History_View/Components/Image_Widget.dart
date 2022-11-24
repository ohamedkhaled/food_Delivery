import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  const ImageWidget({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * AppSize.s7,
      height: ConfigSize.defaultSize! * AppSize.s7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ColorManager.yellowColor,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
    );
  }
}

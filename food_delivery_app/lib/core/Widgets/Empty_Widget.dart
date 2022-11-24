import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Font_Manger.dart';

class EmptyWidget extends StatelessWidget {
  final String imgPath;
  final String text;
  final double height;
  final double width ;
  const EmptyWidget({ required this.width,required this.height,required this.text, required this.imgPath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right:10,top: 70 ,bottom: 10 ),
            child: Image.asset(imgPath,height: height, width:width),
          ),
          Text(text,style: TextStyle(color: ColorManager.textColor,fontSize: FontSize.s25,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Details_View/Components/Custom_Button.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

class CustomNavigationBar extends StatelessWidget {
  final String textButton ;
  final Widget leftChild ;
  final double? widthButton ;
  final void Function()? pressed ;
  const CustomNavigationBar({Key? key, required this.textButton, required this.leftChild, required this.pressed, this.widthButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize!*AppSize.s12,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(AppSize.s25) ,topLeft:Radius.circular(AppSize.s25)),
          color:ColorManager.textColor.withOpacity(AppSize.s0_3)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          leftChild ,
          CustomButton(backgroundColor: ColorManager.mainColor, hieght: ConfigSize.defaultSize!*AppSize.s6,
            width:widthButton??ConfigSize.defaultSize!*AppSize.s21,text:textButton ,
            raduis:AppSize.s20, pressed: pressed, )




        ],
      ),

    );
  }
}

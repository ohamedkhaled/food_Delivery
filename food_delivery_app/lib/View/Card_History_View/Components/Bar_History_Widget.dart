import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Font_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';
import 'package:get/get_core/src/get_main.dart';

class BarHistoryWidget extends StatelessWidget {
  const BarHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize!*AppSize.s10,
      width: double.maxFinite,
      color: ColorManager.mainColor,
           child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: AppIntValues.i1,),
           const Padding(
              padding:  EdgeInsets.only(top: AppPadding.p30),
              child: Text(StringManger.cartHistory,style:TextStyle(color: Colors.white,fontSize: FontSize.s20,fontWeight: FontWeight.w600),),
            ),
            const Spacer(flex: AppIntValues.i3,),
            IconWidget(pressed: (){

            }, iconData: Icons.shopping_cart_outlined,
                iconColor: Colors.white ,
                backgroundColor: ColorManager.mainColor,
                size: ConfigSize.defaultSize!,
                sizeIcon:  ConfigSize.defaultSize!*AppSize.s3,
            ),
            const Spacer(flex: AppIntValues.i1,),
          ],
        ),

    );
  }
}

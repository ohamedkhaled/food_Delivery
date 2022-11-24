import 'package:flutter/material.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Rounts_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';
import 'package:food_delivery_app/core/Widgets/Total_Item_Widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HeaderCard extends StatelessWidget {
  final CardViewModel cardViewModel ;
  const HeaderCard({required this.cardViewModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWidget(
            pressed: () {
              Get.back();
            },
            iconData: Icons.arrow_back_ios,
            iconColor: Colors.white,
            backgroundColor: ColorManager.mainColor,
            size: ConfigSize.defaultSize!*AppSize.s5), // icon back
        const Spacer(
          flex: AppIntValues.i4,
        ),
        IconWidget(
            pressed: () {
              Get.toNamed(RoutsManger.home);
            },
            iconData: Icons.home_outlined,
            iconColor: Colors.white,
            backgroundColor: ColorManager.mainColor,
            size: ConfigSize.defaultSize!*AppSize.s5), // icon home
        const Spacer(
          flex: AppIntValues.i1,
        ),
        Stack(
          children: [
            IconWidget(
                pressed: () {
                  //go back
                },
                iconData: Icons.shopping_cart_outlined,
                iconColor: Colors.white,
                backgroundColor: ColorManager.mainColor,
                size: ConfigSize.defaultSize!*AppSize.s5),
            Positioned(
                top: AppSize.s4,
                right: AppSize.s4,
                child: TotalItemWidget(
                    totalQuantity: cardViewModel.totalItems(),
                    textColor: ColorManager.mainBlackColor,
                    backgroundColor: Colors.white))
          ],
        ), //icon card
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Popular_Details_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Model/Product_Model.dart';

class CounterWidget extends StatelessWidget {
  final PopularDetailsViewModel popularDetailsViewModel ;
  final ProductModel productModel ;
   const CounterWidget({ required this.productModel ,required this.popularDetailsViewModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize! * AppSize.s6,
      width: ConfigSize.defaultSize! * AppSize.s14,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                popularDetailsViewModel.setQuantity(false);
              },
              child: const Icon(Icons.remove ,color: ColorManager.signColor,)
          ),
          Text(
            popularDetailsViewModel.quantity.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          InkWell(
              onTap: () {
                popularDetailsViewModel.setQuantity(true);
              },
              child: const Icon(Icons.add,color: ColorManager.signColor)),
        ],
      ),
    );
  }
}

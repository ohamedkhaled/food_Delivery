import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/App_Colum_Widget.dart';

class DetailsContainer extends StatelessWidget {
  final ProductModel productModel ;
  const DetailsContainer({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize! * AppSize.s14,
      margin: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ColorManager.shadwColor,
                blurRadius: AppSize.s0_5,
                offset: Offset(AppSize.s0, AppSize.s5)),
            BoxShadow(
                color: Colors.white, offset: Offset(AppSize.s5, AppSize.s0)),
            BoxShadow(
                color: Colors.white, offset: Offset(-AppSize.s5, AppSize.s0))
          ]),
      child:  Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: AppColumWidget(text: productModel.name,countStars: productModel.stars,),
      ),
    );
  }
}

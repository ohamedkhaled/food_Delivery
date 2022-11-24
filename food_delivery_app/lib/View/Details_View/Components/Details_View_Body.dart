import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/core/Widgets/Total_Item_Widget.dart';
import 'package:food_delivery_app/ViewModel/Popular_Details_View_Model.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Widgets/Cached_Image_widget.dart';
import 'package:food_delivery_app/core/Widgets/Expanded_Text.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Widgets/App_Colum_Widget.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/Resours_Manger/Rounts_Manger.dart';

class DetailsViewBody extends StatelessWidget {
  final ProductModel productModel ;
  const DetailsViewBody({required this.productModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        ClipRRect(
              child: CachImageWidght(
                  url: AppConstant().getImageUrl(productModel.image),
                  width: double.maxFinite,
                  height:ConfigSize.defaultSize! * AppSize.s35)), //image
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: ConfigSize.defaultSize! * AppSize.s44,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSize.s20),
                    topLeft: Radius.circular(AppSize.s20)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumWidget(
                    text: productModel.name,
                    countStars: productModel.stars,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
                    child: Text(
                      StringManger.introduce,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ), //text introduce
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandedText(
                              text: productModel.description
                                  ))) // description
                ],
              ),
            ),
          ),
        ), //body
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize!*AppPadding.p2, vertical: ConfigSize.defaultSize!*AppPadding.p4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(
                  iconColor: ColorManager.iconColor3,
                  iconData: Icons.arrow_back_ios,
                  backgroundColor: Colors.white.withOpacity(AppSize.s0_5),
                  size: ConfigSize.defaultSize! * AppSize.s4_5,
                  pressed: () {
                   Get.back();
                   // Get.back();
                  },
                ),
                GetBuilder<PopularDetailsViewModel>(builder: (detailsController){
                  return   Stack(
                      children:[
                      IconWidget(
                      iconColor: ColorManager.iconColor3,
                      iconData: Icons.shopping_cart_outlined,
                      backgroundColor: Colors.white.withOpacity(AppSize.s0_5),
                      size: ConfigSize.defaultSize! * AppSize.s4_5,
                      pressed: () {
                        Get.toNamed(RoutsManger.card);
                      }),
                      Visibility(
                        visible: detailsController.totalItems()==0?false:true,
                        child: Positioned(
                          top:AppSize.s3,
                          right:AppSize.s3,
                          child:TotalItemWidget(totalQuantity: detailsController.totalItems()),
                        ),
                      )// total items

                      ]
                  );
                }
                )

              ],
            ),
          ),
        ) // header
      ],
    );
  }
}

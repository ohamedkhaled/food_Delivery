import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Recommended_Details_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Custom_NavigationBar.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';
import 'package:get/get.dart';
import 'Component/Recommended_Details_View_Body.dart';



class RecommendedDetailsView extends StatelessWidget {
  final ProductModel productModel ;
  const RecommendedDetailsView({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<RecommendedDetailsViewModel>().init(Get.find<CardViewModel>() , productModel.id);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: RecommendedDetailsViewBody(productModel: productModel),
      bottomNavigationBar:  GetBuilder<RecommendedDetailsViewModel>(builder:(controller){
        return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconWidget(pressed: (){
                    controller.setQuantity(false);
                  }, iconData: Icons.remove, iconColor: Colors.white,
                      backgroundColor: ColorManager.mainColor, size: ConfigSize.defaultSize!*AppSize.s5) ,
                  Text("\$${productModel.price} X ${controller.quantity}",style: Theme.of(context).textTheme.labelLarge,),
                  IconWidget(pressed: (){
                    controller.setQuantity(true);
                  }, iconData: Icons.add, iconColor: Colors.white,
                      backgroundColor: ColorManager.mainColor, size:  ConfigSize.defaultSize!*AppSize.s5)
                ],
              ),//counter item
            ),
            CustomNavigationBar(
              textButton: "\$${productModel.price} ${StringManger.addToCard}",
              leftChild: IconWidget(pressed: () {
                //add to fav
              }, backgroundColor: Colors.white, iconData: Icons.favorite,iconColor: ColorManager.mainColor, size: ConfigSize.defaultSize!*AppSize.s6,raduis: 10, ),
              pressed: () {
                controller.addItem(productModel);
              },
            )

          ],
        );
      } ,)
    );
  }
}

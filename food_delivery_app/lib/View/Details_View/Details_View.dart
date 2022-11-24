import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/View/Details_View/Components/Counter_Widget.dart';
import 'package:food_delivery_app/View/Details_View/Components/Details_View_Body.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Home_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Popular_Details_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Custom_NavigationBar.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {

 final ProductModel productModel ;
  const DetailsView({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularDetailsViewModel>().init(Get.find<CardViewModel>(),productModel.id);// make initilization to some value in details view
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  DetailsViewBody(productModel: productModel),

      bottomNavigationBar: GetBuilder<PopularDetailsViewModel>( builder: (popularDetails){
        return CustomNavigationBar(textButton: "\$${productModel.price}${StringManger.addToCard}",
            leftChild:CounterWidget(productModel: productModel,popularDetailsViewModel: popularDetails), pressed: () {
          popularDetails.addItem(productModel);
          },) ;
      }
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/View/Home_View/Components/Details_Recommended_Container.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Cached_Image_widget.dart';

class ItemWidget extends StatelessWidget {
  final ProductModel productModel ;
  const ItemWidget({required this.productModel ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p6),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s25), // Image border
            child: CachImageWidght(
              width:ConfigSize.defaultSize! * AppSize.s13 ,
              height:ConfigSize.defaultSize! * AppSize.s14 ,
              url: AppConstant().getImageUrl(productModel.image),
            )

          ), //image
          DetailsRecommendedContainer(productModel: productModel,) // details
        ],
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/View/Home_View/Components/Details_Container.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Resours_Manger/Assets_Path.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

import '../../../core/Widgets/Cached_Image_widget.dart';
class PageViewBody extends StatelessWidget {
final ProductModel productModel ;
  PageViewBody( {Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            ClipRRect(
                borderRadius:
                BorderRadius.circular(AppSize.s25), // Image border
                child: CachImageWidght(
                    url: AppConstant().getImageUrl(productModel.image),
                    width: double.maxFinite,
                    height:ConfigSize.defaultSize!*AppSize.s24)), //image
            Align(
                 alignment: Alignment.bottomCenter,
              child:  DetailsContainer(productModel: productModel,),
            )
          ],
    );
  }
}

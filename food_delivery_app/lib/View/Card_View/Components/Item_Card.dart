import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Cart_Model.dart';
import 'package:food_delivery_app/View/Card_View/Components/Conter_Card_Widget.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Widgets/Cached_Image_widget.dart';

import '../../../core/Responsive_UI/Config_Size.dart';

class ItemCard extends StatelessWidget {
  final CartModel cartModel ;
  final void Function()? pressedAdd;
  final void Function()? pressedRemove;

  const ItemCard({required this.cartModel,required this.pressedAdd ,required this.pressedRemove,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ConfigSize.defaultSize! * AppSize.s13,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s25), // Image border
              child: CachImageWidght(
                width: ConfigSize.defaultSize! * AppSize.s13,
                height: ConfigSize.defaultSize! * AppSize.s13,
                url: AppConstant()
                    .getImageUrl(cartModel.image),
              ),
            ), //image
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:200,
                    child: Text(
                      cartModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                const  Spacer(
                    flex: AppIntValues.i1,
                  ),
                  Text(
                    "spicy",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(
                    flex: AppIntValues.i2,
                  ),
                  Row(

                    children: [
                      Text(
                        "\$ ${cartModel.price*cartModel.quantity}",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(width: ConfigSize.defaultSize!*AppSize.s7,),
                      ConterCardWidget(quantity: cartModel.quantity,pressedAdd: pressedAdd,pressedRemove: pressedRemove)

                    ],
                  )
                ],
              ),
            ) // details
          ],
        ));
  }
}

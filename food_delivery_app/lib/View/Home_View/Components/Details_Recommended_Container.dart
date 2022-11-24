import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Text_Widget.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

import '../../../core/Resours_Manger/String_Manger.dart';

class DetailsRecommendedContainer extends StatelessWidget {
  final ProductModel productModel ;
  const DetailsRecommendedContainer({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: ConfigSize.defaultSize! * AppSize.s12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppSize.s20),
              bottomRight: Radius.circular(AppSize.s20)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p6),
                child: Text(
                   productModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text("with chinise food",
                  style: Theme.of(context).textTheme.titleSmall),
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconTextWidget(
                      icon: Icons.circle_sharp,
                      iconColor: ColorManager.iconColor1,
                      text: StringManger.normal,
                    ),
                    IconTextWidget(
                      icon: Icons.location_on,
                      iconColor: ColorManager.mainColor,
                      text: "1.2${StringManger.km}",
                    ),
                    IconTextWidget(
                      icon: Icons.access_time_rounded,
                      iconColor: ColorManager.iconColor2,
                      text: "32${StringManger.min}",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

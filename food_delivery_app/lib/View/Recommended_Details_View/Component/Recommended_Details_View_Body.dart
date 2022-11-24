import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/core/Widgets/Total_Item_Widget.dart';
import 'package:food_delivery_app/ViewModel/Recommended_Details_View_Model.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Resours_Manger/Rounts_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Cached_Image_widget.dart';
import 'package:food_delivery_app/core/Widgets/Expanded_Text.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RecommendedDetailsViewBody extends StatelessWidget {
  final ProductModel productModel;
  const RecommendedDetailsViewBody({required this.productModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                pressed: () {
                  Get.back();
                },
                iconData: Icons.clear,
                iconColor: ColorManager.signColor,
                backgroundColor: Colors.white,
                size: ConfigSize.defaultSize! * AppSize.s5,
              ),
              GetBuilder<RecommendedDetailsViewModel>(builder: (controller){
                return Stack(
                  children: [
                    IconWidget(
                        pressed: () {
                          Get.toNamed(RoutsManger.card);
                        },
                        iconData: Icons.shopping_cart_outlined,
                        iconColor: ColorManager.signColor,
                        backgroundColor: Colors.white.withOpacity(AppSize.s0_7),
                        size: ConfigSize.defaultSize! * AppSize.s5),
                Visibility(
                visible:controller.totalItems()==0?false:true,
                child: Positioned(
                right: AppSize.s3,
                top:AppSize.s3,
                 child: TotalItemWidget(totalQuantity: controller.totalItems()))
                )
                  ],
                );
              })
            ],
          ),
          toolbarHeight: ConfigSize.defaultSize! * AppSize.s9,
          automaticallyImplyLeading: false,
          expandedHeight: ConfigSize.defaultSize! * AppSize.s35,
          pinned: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(AppSize.s35),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSize.s12),
                      topLeft: Radius.circular(AppSize.s12)),
              color: Colors.white,
    ),
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Center(
                  child: Text(
                productModel.name,
                style: Theme.of(context).textTheme.headlineMedium,
              )),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: CachImageWidght(
            url:  AppConstant().getImageUrl(productModel.image),
             height: double.maxFinite,
             width: double.maxFinite,

            )

          ),
        ),
        SliverToBoxAdapter(
          child: ExpandedText(text: productModel.description +"School based running programmes, such as The Daily Mile™, positively impact pupils’ physical health, however, there is limited evidence on psychological health. Additionally, current evidence is mostly limited to examining the acute impact. The present study examined the longer term impact of running programmes on pupil cognition, wellbeing, and fitness.School based running programmes, such as The Daily Mile™, positively impact pupils’ physical health, however, there is limited evidence on psychological health. Additionally, current evidence is mostly limited to examining the acute impact. The present study examined the longer term impact of running programmes on pupil cognition, wellbeing, and fitness.School based running programmes, such as The Daily Mile™, positively impact pupils’ physical health, however, there is limited evidence on psychological health. Additionally, current evidence is mostly limited to examining the acute impact. The present study examined the longer term impact of running programmes on pupil cognition, wellbeing, and fitness."),
        )
      ],
    );
  }
}

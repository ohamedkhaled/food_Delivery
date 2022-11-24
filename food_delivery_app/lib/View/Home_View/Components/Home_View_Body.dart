import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Home_View/Components/Item_Widget.dart';
import 'package:food_delivery_app/View/Home_View/Components/Page_View_Widget.dart';
import 'package:food_delivery_app/ViewModel/Home_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Loading_Widget.dart';
import 'package:get/get.dart';
import '../../../core/Resours_Manger/Rounts_Manger.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageViewWidget(), // slider
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12, vertical: AppPadding.p14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(StringManger.recommended,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(width: ConfigSize.defaultSize),
              Text(StringManger.dot,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center),
              SizedBox(width: ConfigSize.defaultSize),
              Text(StringManger.foodPairing,
                  style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
        ), //text

        GetBuilder<HomeViewModel>( builder:(recommendedProduct) {
          return  recommendedProduct.recommendedIsLoaded ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProduct.listRecommendedModel.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: (){
                    Get.toNamed(RoutsManger.recommendedDetails,arguments:recommendedProduct.listRecommendedModel[index]);
                  },
                  child: ItemWidget(productModel: recommendedProduct.listRecommendedModel[index]));
            },
          ) :  const LoadingWidget() ;
    })

           // Populer List
      ],
    );
  }
}

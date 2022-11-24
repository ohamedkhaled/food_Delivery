


import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Card_History_View/Card_History_View.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BarWidget extends StatelessWidget {
  final String conturyName;
  final String cityName;
  const BarWidget({ required this.cityName,required this.conturyName,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.symmetric(vertical: AppPadding.p20 ,horizontal: AppPadding.p12 ),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(conturyName, overflow:TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge,),
                Row(
                  children: [
                    Text(cityName,overflow:TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleMedium),
                    const Icon(Icons.arrow_drop_down) // drop icon
                  ],
                )
              ],
            ),
            IconWidget(size: ConfigSize.defaultSize!*AppSize.s5_2,backgroundColor: ColorManager.mainColor,
                raduis: AppSize.s15,iconData: Icons.search,iconColor: Colors.white, pressed: () {
                //action search

              },)
          ],
        )
    );
  }
}

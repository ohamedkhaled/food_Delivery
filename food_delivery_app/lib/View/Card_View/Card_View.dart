import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Card_View/Components/CardViewBody.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Custom_NavigationBar.dart';
import 'package:get/get.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CardViewBody(),
      bottomNavigationBar:  GetBuilder<CardViewModel>(builder: (cardViewModel){
        return CustomNavigationBar(
          leftChild: totalWidget(context,cardViewModel.getTotalPrice(cardViewModel.listCardItem())),
          textButton: StringManger.checkOut,
          pressed: cardViewModel.items.isEmpty? null:   () {
            cardViewModel.addToHistory(); // add all product to card history List
          },
          widthButton: ConfigSize.defaultSize! * AppSize.s18,
        );
      }),
    );
  }
}

Widget totalWidget(BuildContext context,int totalPrice) {
  return Container(
    width: ConfigSize.defaultSize! * AppSize.s17,
    height: ConfigSize.defaultSize! * AppSize.s6,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
        color: Colors.white),
    child: Center(
        child: Text("\$ $totalPrice",
            style: Theme.of(context).textTheme.headlineMedium)),
  );
}

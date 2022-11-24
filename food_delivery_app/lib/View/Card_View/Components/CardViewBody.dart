import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Cart_Model.dart';
import 'package:food_delivery_app/View/Card_View/Components/Item_Card.dart';
import 'package:food_delivery_app/View/Details_View/Components/Header_Card.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:get/get.dart';
import '../../../core/Resours_Manger/Assets_Path.dart';
import '../../../core/Responsive_UI/Config_Size.dart';
import '../../../core/Widgets/Empty_Widget.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardViewModel>(builder: (cardViewModel) {
      List<CartModel> listCardModel = cardViewModel.listCardItem();
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p28),
        child: Stack(
          children: [
            Positioned(
                top: AppSize.s6,
                left: AppSize.s10,
                right: AppSize.s10,
                child: HeaderCard(
                  cardViewModel: cardViewModel,
                )), //header
             cardViewModel.items.isEmpty?
             EmptyWidget(text: StringManger.cartEmpty,height:ConfigSize.screenHeight!/2 ,width:ConfigSize.screenWidth!  ,imgPath: AssetsPath.pathlogoEmpty):
             Positioned(
              top: AppSize.s50,
              left: AppSize.s0,
              right: AppSize.s0,
              bottom: AppSize.s0,
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p10),
                      child: ItemCard(
                          cartModel: listCardModel[index],
                          pressedAdd: () {
                            cardViewModel.incrmentItem(listCardModel[index]);
                          },
                          pressedRemove: () {
                            cardViewModel.decrmentItem(listCardModel[index]);
                          }),
                    );
                  },
                  itemCount: listCardModel.length,
                ),
              ),
            ) //body
          ],
        ),
      );
    });
  }
}

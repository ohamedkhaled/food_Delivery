import 'package:flutter/material.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../Model/Product_Model.dart';
import '../core/Resours_Manger/Color_Manger.dart';

class RecommendedDetailsViewModel extends GetxController {
  int quantity = 0;
  late CardViewModel cardViewModel;

  init(CardViewModel cardViewModel, int productId) {
    this.cardViewModel = cardViewModel;
    getQuantity(cardViewModel, productId);
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity = checkQuantity(quantity + 1);
    } else {
      quantity = checkQuantity(quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(StringManger.itemCount, StringManger.reduceMore,
          backgroundColor: ColorManager.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(StringManger.itemCount, StringManger.addMore,
          backgroundColor: ColorManager.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void addItem(ProductModel productModel) {
    if (quantity > 0) {
      cardViewModel.addItem(productModel, quantity);
    } else {
      if (cardViewModel.items[productModel.id]?.isExist ?? false) {
        cardViewModel.removeItem(productModel);
        Get.snackbar(StringManger.itemCount, StringManger.remove,
            backgroundColor: ColorManager.mainColor, colorText: Colors.white);
      } else {
        Get.snackbar(StringManger.itemCount, StringManger.youShould,
            backgroundColor: ColorManager.mainColor, colorText: Colors.white);
      }
    }
    cardViewModel.items.forEach((key, value) {
      print("the id is:" +
          value.id.toString() +
          "  the quantity is :" +
          value.quantity.toString());
    });

    update();
  }

  getQuantity(CardViewModel cardViewModel, int productId) {
    quantity = cardViewModel.items[productId]?.quantity ?? 0;
  }
  int totalItems(){
    return  cardViewModel.totalItems();
  }
}

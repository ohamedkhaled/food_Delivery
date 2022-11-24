import 'package:flutter/material.dart';
import 'package:food_delivery_app/Model/Cart_Model.dart';
import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/Repository/Card_Repository.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:get/get.dart';
import '../core/Resours_Manger/String_Manger.dart';

class CardViewModel extends GetxController {
  final BaseCardRepository baseCardRepository;

  CardViewModel({required this.baseCardRepository});

  Map<int,CartModel> items = {};
  List<CartModel> itemsStorge = [];

  void addItem(ProductModel productModel, int quantity) {
    if (items.containsKey(productModel.id)) {
      // updata product
      items.update(
          productModel.id,
          (value) => CartModel(
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              id: value.id,
              name: value.name,
              price: value.price,
              image: value.image));
    } else {
      items.putIfAbsent(productModel.id, () {
        return CartModel(
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),//each product get a different time
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            image: productModel.image);
      });
    }

    baseCardRepository.addToCardListStorage(
        listCardItem()); // pass all product that in card to card repository
    update();
  } // add item to card view and item map

  void incrmentItem(CartModel cartModel) {
    if (cartModel.quantity >= 20) {
      Get.snackbar(StringManger.itemCount, StringManger.addMore,
          backgroundColor: ColorManager.mainColor, colorText: Colors.white);
    } else {
      cartModel.setQuantity = cartModel.quantity + 1;
    }

    update();
  }

  void decrmentItem(CartModel cartModel) {
    if (cartModel.quantity <= 1) {
      items.remove(cartModel.id);
      Get.snackbar(StringManger.itemCount, StringManger.remove,
          backgroundColor: ColorManager.mainColor, colorText: Colors.white);
    } else {
      cartModel.setQuantity = cartModel.quantity - 1;
    }

    update();
  }

  void removeItem(ProductModel productModel) {
    items.remove(productModel.id);
  }

  int totalItems() {
    int total = 0;

    items.forEach((key, value) {
      total += value.quantity;
    });

    return total;
  } // get total Items

  List<CartModel> listCardItem() {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  } // get items in items map

  List<CartModel> getItemsStorge() {
    setCardStorage = baseCardRepository
        .getStorageListCard(); // get items that store in shared Preference
    return itemsStorge;
  } // get items in local data

  set setCardStorage(List<CartModel> listCardModel) {
    itemsStorge = listCardModel;

    for (int i = 0; i < itemsStorge.length; i++) {
      items.putIfAbsent(itemsStorge[i].id,
          () => itemsStorge[i]); // send data storage to current data
    }
  } // send data storage to current data

  int getTotalPrice(List<CartModel> listCartItems) {
    int totalPrice = 0;
    listCartItems = listCardItem();
    for (int i = 0; i < listCartItems.length; i++) {
      totalPrice += listCartItems[i].price * listCartItems[i].quantity;
    }

    return totalPrice;
  } // get total price

  void addToHistory(){
    baseCardRepository.addToCardHistoryList() ;
    clear(); // to remove all items after check out
  }

  void clear(){
    items.clear();
    update();
  }

  List<CartModel> getListCardHistory(){
    return baseCardRepository.GetHistoryListCart() ;
  }
  set setCardHistory(Map<int,CartModel> setItems )
  {
    items.clear();
    items = setItems ;

  } // send data from history to current data in cart
  void addToCardRepository(){
    baseCardRepository.addToCardListStorage(
        listCardItem()) ;
    update();
  }
}

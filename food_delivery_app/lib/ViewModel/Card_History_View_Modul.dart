import 'dart:convert';

import 'package:food_delivery_app/Model/Cart_Model.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryViewModul extends GetxController {
  Map<String, int> cartItemsPerOrder = Map();
  List<int> orderTime = [];

  void intiCardHistory() {
    getCardItemsPerOrder();
    orderTime = getOrderItemsList();
    update();
  }

  List<int> getOrderItemsList() {
    return cartItemsPerOrder.entries.map((e) {
      return e.value;
    }).toList();
  } // list of number products have a same time

  List<String> getOrderTimeList() {
    return cartItemsPerOrder.entries.map((e) {
      return e.key;
    }).toList();
  } // list of product's time
  void getCardItemsPerOrder() {
    cartItemsPerOrder.clear() ;
    for (int i = 0; i < getCardHistoryList().length; i++) {
      if(cartItemsPerOrder.containsKey(getCardHistoryList()[i].time)){
        cartItemsPerOrder.update(getCardHistoryList()[i].time, (value) => ++value);
      }
      cartItemsPerOrder.putIfAbsent(getCardHistoryList()[i].time, () => 1);
    }
  }

  List<CartModel> getCardHistoryList() {
    return Get.find<CardViewModel>().getListCardHistory();
  }

  String formTime(String currentTime) {
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(currentTime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

 void  connectWithCart(int index){
   Map<int,CartModel> moreOrder = {};
   for(int i =0 ; i<getCardHistoryList().length;i++)
   {
     if(getCardHistoryList()[i].time== getOrderTimeList()[index])
     {
       moreOrder.putIfAbsent(getCardHistoryList()[i].id,
               () => CartModel.fromjson(
               jsonDecode(jsonEncode(getCardHistoryList()[i]))));
     }
   }
   Get.find<CardViewModel>().setCardHistory= moreOrder ;
   Get.find<CardViewModel>().addToCardRepository() ;
 } // send data to cart view
}

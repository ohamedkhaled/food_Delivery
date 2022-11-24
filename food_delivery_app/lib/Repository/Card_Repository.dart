import 'dart:convert';

import 'package:food_delivery_app/Model/Cart_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseCardRepository {
  void addToCardListStorage(List<CartModel> cardList);
  List<CartModel> getStorageListCard();
  void addToCardHistoryList();
  List<CartModel> GetHistoryListCart();
}

class CardRepository extends BaseCardRepository {
  List<String> cardListStorge = []; // list that will pass it to shared preference
  List<String> cardListHistory = [];
  List<CartModel> listCardModel = []; // list  of product card
  final SharedPreferences sharedPreferences;

  CardRepository(this.sharedPreferences);

  @override
  void addToCardListStorage(List<CartModel> cardList) {
   String sharedTime = DateTime.now().toString() ;
    cardListStorge.clear(); // to make is empty
    cardList.forEach((cardModel) {
      cardModel.time =sharedTime; // now all product have same time
      cardListStorge.add(jsonEncode(cardModel));
    });
    sharedPreferences.setStringList(StringManger.cardList, cardListStorge);
  }

  @override
  List<CartModel> getStorageListCard() {
    List<String> listCardStorage = [];
    if (sharedPreferences.containsKey(StringManger.cardList)) {
      listCardStorage = sharedPreferences.getStringList(StringManger.cardList)!;
    }

    listCardStorage.forEach((listCardStorage) {
      print(jsonDecode(listCardStorage));
      listCardModel.add(CartModel.fromjson(jsonDecode(listCardStorage)));
    });

    return listCardModel;
  }

  @override
  void addToCardHistoryList() {
    if(sharedPreferences.containsKey(StringManger.cardListHestory))
    {
      cardListHistory=sharedPreferences.getStringList(StringManger.cardListHestory)!; // to add last items to new items
    }
    for (int i = 0; i < cardListStorge.length; i++) {
      cardListHistory.add(cardListStorge[i]);
    }
    sharedPreferences.setStringList(
        StringManger.cardListHestory, cardListHistory);
    print(" lenght of card hitort  " + cardListHistory.length.toString());
    removeCartItems();
  }

  @override
  List<CartModel> GetHistoryListCart() {
    List<CartModel> listHistory = [];

    if (sharedPreferences.containsKey(StringManger.cardListHestory)) {
      cardListHistory = [];
      cardListHistory =
          sharedPreferences.getStringList(StringManger.cardListHestory)!;
    }

    cardListHistory.forEach((element) => listHistory.add(
        CartModel.fromjson(jsonDecode(element)))); // convert staring to object
    return listHistory;
  }

    void removeCartItems() {

    cardListStorge=[];
    sharedPreferences.remove(StringManger.cardList);
  }
}

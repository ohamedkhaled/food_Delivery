import '../core/Resours_Manger/String_Manger.dart';

class CartModel {
  final int id;
  final String name;
  final int price;
  final String image;
  int quantity;
  final bool isExist;
  String time; // because i'll changed later

  CartModel({
    required this.quantity,
    required this.isExist,
    required this.time,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });


  void set setQuantity(int quantity ) {
    this.quantity=quantity ;
  }
  factory CartModel.fromjson(Map<String, dynamic> jsonData) => CartModel(
      id: jsonData[StringManger.id],
      name: jsonData[StringManger.name],
      price: jsonData[StringManger.price],
      image: jsonData[StringManger.image],
      quantity: jsonData[StringManger.quantity],
      isExist: jsonData[StringManger.isExist],
      time: jsonData[StringManger.time]);




  Map<String,dynamic> toJson(){
    return {
      StringManger.id:this.id,
      StringManger.name:this.name,
      StringManger.price:this.price,
      StringManger.image:this.image,
      StringManger.quantity:this.quantity,
      StringManger.isExist:this.isExist,
      StringManger.time:this.time
    };
  }

}

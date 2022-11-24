

import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';

class ProductModel {
  final int id;
  final int typeId ;
  final String name ;
  final String description ;
  final int price ;
  final int stars ;
  final String image ;
  final String location;
  final String createdAt;
  final String updatedAt;

  ProductModel(
      {required this.id,
      required this.typeId,
      required this.name,
      required this.description,
      required this.price,
      required this.stars,
      required this.image,
      required this.location,
      required this.createdAt,
      required this.updatedAt});


  factory ProductModel.fromjson(Map<String,dynamic> jsonData ) =>
      ProductModel(id: jsonData[StringManger.id] ,
          typeId: jsonData[StringManger.typeId] ,
          name: jsonData[StringManger.name] ,
          description: jsonData[StringManger.description] ,
          price: jsonData[StringManger.price] ,
          stars: jsonData[StringManger.stars] ,
          image: jsonData[StringManger.image] ,
          location: jsonData[StringManger.location] ,
          createdAt: jsonData[StringManger.createdAt] ,
          updatedAt: jsonData[StringManger.updatedAt] );
}
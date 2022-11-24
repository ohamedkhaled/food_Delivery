import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Helper/Api.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:get/get.dart';



abstract class BaseRepository {


  Future<List<ProductModel>> getPopulerProductList();
  Future<List<ProductModel>> getRecommendedProductList();
}

class ApiRepositoryImp  implements BaseRepository {
  final Api api;

  ApiRepositoryImp({required this.api});

  @override
  Future<List<ProductModel>> getPopulerProductList() async {
    Response response = await api.getData(AppConstant.getProductEndPoint);
    List<ProductModel> productModelList = [];

    Map<String, dynamic> jsonData = response.body;
    if (response.statusCode == 200) {
      for (int i = 0; i < response.body[StringManger.products].length; i++) {
        productModelList
            .add(ProductModel.fromjson(response.body[StringManger.products][i]));
      }

      return productModelList;
    } else {
      throw Exception('there is error and status:${response.body}');
    }
  }

  @override
  Future<List<ProductModel>> getRecommendedProductList() async {

    Response response = await api.getData(AppConstant.getRecommendedEndPoint);
    List<ProductModel> productModelList = [];
    Map<String, dynamic> jsonData = response.body;
    if (response.statusCode == 200) {
      for (int i = 0; i < response.body[StringManger.products].length; i++)  {
        productModelList
            .add(ProductModel.fromjson(response.body[StringManger.products][i]));
      }

      return productModelList;
    } else {
      throw Exception('there is error and status:${response.body}');
    }
  }
}

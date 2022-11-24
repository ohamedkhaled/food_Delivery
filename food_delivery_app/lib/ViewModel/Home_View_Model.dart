import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:get/get.dart';
import '../Repository/Api_Repository_Imp.dart';

class HomeViewModel extends GetxController {
  final BaseRepository baseRepository;
  List<ProductModel> listPopularModel = [];
  List<ProductModel> listRecommendedModel = [];
  bool populerIsLoaded = false;
  bool recommendedIsLoaded = false;

  HomeViewModel({required this.baseRepository});

  Future<void> getPopularList() async {
    listPopularModel = await baseRepository.getPopulerProductList();
    populerIsLoaded = true;
    update();
  }

  Future<void> getRecommendedList() async {
    listRecommendedModel = await baseRepository.getRecommendedProductList();
    recommendedIsLoaded = true;
    update();
  }

}

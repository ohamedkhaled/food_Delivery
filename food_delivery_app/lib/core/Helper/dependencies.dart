import 'package:food_delivery_app/Repository/Api_Repository_Imp.dart';
import 'package:food_delivery_app/Repository/Card_Repository.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Home_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Popular_Details_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Recommended_Details_View_Model.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Helper/Api.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ViewModel/Card_History_View_Modul.dart';

Future<void> init() async {
//api
  Get.lazyPut(() => Api(appBaseUrl: AppConstant.baseUrl));

//repository
  Get.lazyPut<BaseRepository>(() => ApiRepositoryImp(api: Get.find()));
  Get.lazyPut<BaseCardRepository>(() => CardRepository(Get.find()));


  //viewModel
  Get.lazyPut(() => HomeViewModel(baseRepository: Get.find()));
  Get.lazyPut(() => PopularDetailsViewModel());
  Get.lazyPut(() => CardViewModel(baseCardRepository: Get.find()),fenix: true);
  Get.lazyPut(() => RecommendedDetailsViewModel(),fenix: true);
  Get.lazyPut(()=>CartHistoryViewModul(),fenix: true);
  //Get.put(() => CardViewModel(),permanent: true);

  //sharedPrefrence
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);

}

import 'package:food_delivery_app/Model/Product_Model.dart';
import 'package:food_delivery_app/View/Card_View/Card_View.dart';
import 'package:food_delivery_app/View/Details_View/Details_View.dart';
import 'package:food_delivery_app/View/Home_View/Home_View.dart';
import 'package:food_delivery_app/View/Recommended_Details_View/Recommended_Details_View.dart';
import 'package:food_delivery_app/View/SignIn_View/SignIn_View.dart';
import 'package:get/get.dart';

import '../../View/Main_View/Main_View.dart';
import '../../View/SignUp_View/SignUp_View.dart';
import '../../View/Splash_View/Splash_View.dart';

class RoutsManger {
  static String splash="/splash";
  static String signIn="/signIn";
  static String signUp="/signUp";
  static String main ="/";
  static String home = "/home";
  static String details = "/details";
  static String recommendedDetails ="/recommendedDetails";
  static String card="/card";

  static List<GetPage> routes = [
    GetPage(page: () => const SplashView(), name: splash,transition: Transition.fade,transitionDuration: const Duration(milliseconds: 600)),
    GetPage(page: () => const MainView(), name: main,transition: Transition.fade,transitionDuration: const Duration(milliseconds: 600)),
    GetPage(page: () => const HomeView(), name: home,transition: Transition.fade,transitionDuration: const Duration(milliseconds: 600)),
    GetPage(page: () {
        ProductModel productModel =Get.arguments ;
      return  DetailsView(productModel: productModel);}, name: details,transition: Transition.fade,transitionDuration: const Duration(milliseconds: 600)),
    GetPage(page: () {
      ProductModel productModel =Get.arguments ;
       return RecommendedDetailsView(productModel: productModel); }, name: recommendedDetails,transition: Transition.fade,transitionDuration: const Duration(milliseconds: 600)),
    GetPage(page:()=>const CardView(),name:card,transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 600) ),
    GetPage(page: ()=> const SignInView(),name: signIn,transition:Transition.fade,transitionDuration: const Duration(milliseconds: 600) ),
    GetPage(page: ()=> const SignUpView(),name: signUp,transition:Transition.fade,transitionDuration: const Duration(milliseconds: 600) ),
  ];
}

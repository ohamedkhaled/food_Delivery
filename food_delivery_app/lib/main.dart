import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Home_View/Home_View.dart';
import 'package:food_delivery_app/View/SignUp_View/SignUp_View.dart';
import 'package:food_delivery_app/ViewModel/Card_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Home_View_Model.dart';
import 'package:food_delivery_app/ViewModel/Popular_Details_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/Rounts_Manger.dart';
import 'package:food_delivery_app/core/Theme_Data/Theme_Manger.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/core/Helper/dependencies.dart ' as dep;

import 'View/SignIn_View/SignIn_View.dart';


Future<void> main()  async{

WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


   Get.find<CardViewModel>().getItemsStorge() ; // to get data that store in card before 
    return GetBuilder<HomeViewModel>(builder: (_){
      return GetBuilder<PopularDetailsViewModel>(builder:(_){
        return GetBuilder<CardViewModel>(builder: (_){
          return  GetMaterialApp(
            title: 'Flutter Demo',
            theme: getAppTheme(),
            debugShowCheckedModeBanner: false,
            showPerformanceOverlay: false,
            initialRoute: RoutsManger.splash,
            getPages: RoutsManger.routes,
            home: const SafeArea(child: SignInView()),
          );
        });

      });
    });
  }
}
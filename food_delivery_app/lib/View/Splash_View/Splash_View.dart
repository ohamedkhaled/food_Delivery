


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Assets_Path.dart';
import 'package:food_delivery_app/core/Resours_Manger/Rounts_Manger.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../ViewModel/Home_View_Model.dart';
import '../../core/Responsive_UI/Config_Size.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {

  late Animation<double> animation ;
  late AnimationController controller ;

  Future<void> loadResources()async {
    await Get.find<HomeViewModel>().getPopularList();
    await Get.find<HomeViewModel>().getRecommendedList();
  }
  @override
  void initState() {
    controller= AnimationController(vsync: this,duration: const Duration(seconds: 2)  )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    loadResources();
    Timer(
        const Duration(seconds: 3),
            ()=> Get.offNamed(RoutsManger.main)
    );
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Image.asset(AssetsPath.pathLogopart1)),
          Image.asset(AssetsPath.pathLogopart2)
        ],
      ),
    );
  }
}

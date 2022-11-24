import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Details_View/Details_View.dart';
import 'package:food_delivery_app/View/Home_View/Components/Page_View_Body.dart';
import 'package:food_delivery_app/ViewModel/Home_View_Model.dart';
import 'package:food_delivery_app/core/Resours_Manger/Rounts_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Loading_Widget.dart';
import 'package:get/get.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (popularProduct) {
      return  popularProduct.populerIsLoaded ? Column(children: [
        CarouselSlider(
          items: [
            for (int index = 0;
                index < popularProduct.listPopularModel.length;
                index++)
              GestureDetector(
                onTap: (){
                  Get.toNamed(RoutsManger.details,arguments:popularProduct.listPopularModel[index]);
                },
                child: PageViewBody(
                  productModel: popularProduct.listPopularModel[index],
                ),
              )
          ],
          carouselController: _controller,
          options: CarouselOptions(
              height: ConfigSize.defaultSize! * AppSize.s32,
              viewportFraction: AppSize.s0_8,
              initialPage: AppIntValues.i0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: AppIntValues.i3),
              autoPlayAnimationDuration:
                  const Duration(milliseconds: AppIntValues.i800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p6),
          child: DotsIndicator(
            dotsCount: popularProduct.listPopularModel.length == 0
                ? 1
                : popularProduct.listPopularModel.length,
            position: _current.toDouble(),
            decorator: DotsDecorator(
              size: Size.square(ConfigSize.defaultSize!),
              activeSize: Size(ConfigSize.defaultSize! * AppIntValues.i2,
                  ConfigSize.defaultSize!),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s5)),
            ),
          ),
        ), // dotis
      ]) : const LoadingWidget();
    });
  }
}

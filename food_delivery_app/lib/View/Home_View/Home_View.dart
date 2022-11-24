import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Home_View/Components/Bar_Widget.dart';
import 'package:food_delivery_app/View/Home_View/Components/Home_View_Body.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return  Scaffold(
        body: Column(
          children:  [
            Container(
              child: const BarWidget(cityName: "CityName", conturyName: "contury Name",),
            ), //header
           const Expanded(child: SingleChildScrollView(child: HomeViewBody()))
          ],
        )
       // body of home view
        );
  }
}

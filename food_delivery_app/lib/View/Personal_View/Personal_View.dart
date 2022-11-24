import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Personal_View/Components/Personal_View_Body.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PersonalViewBody(),
      appBar: AppBar(
        backgroundColor: ColorManager.mainColor,
        title: Text(StringManger.personal,style: Theme.of(context).textTheme.headlineSmall,),
      ),
    );
  }
}

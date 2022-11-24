import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Personal_View/Components/Account_Widget.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';

class PersonalViewBody extends StatelessWidget {
  const PersonalViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconWidget(
            pressed: () {},
            iconData: Icons.person,
            iconColor: Colors.white,
            backgroundColor: ColorManager.mainColor,
            size: ConfigSize.defaultSize! * AppSize.s16,
            sizeIcon: ConfigSize.defaultSize! * AppSize.s8,
            raduis: ConfigSize.defaultSize! * AppSize.s16,
          ),// person Icon
          SizedBox(height: ConfigSize.defaultSize!*AppSize.s1_2),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              AccountWidget(
                icon: Icons.person,
                color: ColorManager.mainColor,
                text: "Ahmed",
              ), //Account Icon
              SizedBox(height: ConfigSize.defaultSize! * AppSize.s3),
              AccountWidget(
                icon: Icons.phone,
                color: ColorManager.yellowColor,
                text: "Ahmed",
              ), // phone Icon
              SizedBox(height: ConfigSize.defaultSize! * AppSize.s3),
              AccountWidget(
                icon: Icons.mail,
                color: ColorManager.yellowColor,
                text: "Ahmed",
              ), // mail icon
              SizedBox(height: ConfigSize.defaultSize! * AppSize.s3),
              AccountWidget(
                icon: Icons.location_on,
                color: ColorManager.yellowColor,
                text: "Ahmed",
              ),// location icon
              SizedBox(height: ConfigSize.defaultSize! * AppSize.s3),
              AccountWidget(
                icon: Icons.message,
                color: Colors.redAccent,
                text: "Ahmed",
              ),//message icon
              SizedBox(height: ConfigSize.defaultSize! * AppSize.s3),
              AccountWidget(
                icon: Icons.message,
                color: Colors.redAccent,
                text: "Ahmed",
              ),
              SizedBox(height: ConfigSize.defaultSize! * AppSize.s3),
            ],
          )))
        ],
      ),
    );
  }
}

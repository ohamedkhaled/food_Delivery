import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'Icon_Text_Widget.dart';

class AppColumWidget extends StatelessWidget {
  final String text ;
  final int countStars;

  const AppColumWidget({Key? key, required this.text, required this.countStars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ), // text food
        Row(
          children: [
            Wrap(
                children: List.generate(
                     countStars,
                    (index) => Icon(
                          Icons.star,
                          color: ColorManager.mainColor,
                          size: ConfigSize.defaultSize! * AppSize.s1_5,
                        ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Text("4.5", style: Theme.of(context).textTheme.titleSmall),
            ),
            Text("1287 ${StringManger.comments}", style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconTextWidget(
                icon: Icons.circle_sharp,
                iconColor: ColorManager.iconColor1,
                text: StringManger.normal,
              ),
              IconTextWidget(
                icon: Icons.location_on,
                iconColor: ColorManager.mainColor,
                text: "1.2${StringManger.km}",
              ),
              IconTextWidget(
                icon: Icons.access_time_rounded,
                iconColor: ColorManager.iconColor2,
                text: "32${StringManger.min}",
              )
            ],
          ),
        )
      ],
    );
  }
}

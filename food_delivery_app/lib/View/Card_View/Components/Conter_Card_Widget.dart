import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';

class ConterCardWidget extends StatelessWidget {
  final int quantity ;
  final void Function()? pressedRemove;
  final void Function()? pressedAdd ;
  const ConterCardWidget({Key? key,required this.pressedAdd,required this.pressedRemove,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * AppSize.s9,
      height: ConfigSize.defaultSize! * AppSize.s3_5,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(AppSize.s0_5),
              spreadRadius: AppSize.s5,
              blurRadius: AppSize.s8,
              offset: const Offset(
                  AppSize.s0, AppSize.s3), // changes position of shadow
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s15)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: pressedRemove,
            child: const Icon(
              Icons.remove,
              color: ColorManager.signColor,
            ),
          ),
          Text(quantity.toString()),
          InkWell(
            onTap: pressedAdd,
            child: const Icon(
              Icons.add,
              color: ColorManager.signColor,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final isPassword;
  final TextInputType? textInputType ;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.icon,
      this.isPassword = false,
      required this.textInputType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s25),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: const Offset(5, 10),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: ColorManager.mainColor,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s25),
                borderSide: const BorderSide(width: 1, color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s25),
                borderSide: const BorderSide(width: 1, color: Colors.white)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s25),
                borderSide: const BorderSide(width: 1, color: Colors.red))),
      ),
    );
  }
}

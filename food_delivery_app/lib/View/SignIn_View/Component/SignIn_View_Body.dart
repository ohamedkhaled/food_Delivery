import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Main_View/Main_View.dart';
import 'package:food_delivery_app/core/Resours_Manger/Rounts_Manger.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/Resours_Manger/Assets_Path.dart';
import '../../../core/Resours_Manger/Color_Manger.dart';
import '../../../core/Resours_Manger/String_Manger.dart';
import '../../../core/Resours_Manger/Values_Manger.dart';
import '../../../core/Responsive_UI/Config_Size.dart';
import '../../Details_View/Components/Custom_Button.dart';
import '../../SignUp_View/Components/Custom_Text_Field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: ConfigSize.defaultSize! * AppSize.s24,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: ConfigSize.defaultSize! * AppSize.s12,
                backgroundImage: AssetImage(AssetsPath.pathLogopart1),
              ),
            ),
          ), // logo
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManger.hello,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 65,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
                Text(StringManger.signInto,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.left),
              ],
            ),
          ), //two text
          SizedBox(
            height: ConfigSize.defaultSize! * AppSize.s2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: CustomTextField(
              icon: Icons.phone_android,
              hint: StringManger.phone,
              controller: phoneController,
              textInputType: TextInputType.phone,
            ),
          ), // phone
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: CustomTextField(
              icon: Icons.password,
              hint: StringManger.password,
              controller: passwordController,
              isPassword: true,
              textInputType: TextInputType.name,
            ),
          ), // password
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Text(
                StringManger.signInto,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.right,
              )), // text
          SizedBox(
            height: ConfigSize.defaultSize! * AppSize.s5,
          ),
          CustomButton(
              text: StringManger.signIn,
              backgroundColor: ColorManager.mainColor,
              raduis: ConfigSize.defaultSize! * AppSize.s3,
              width: ConfigSize.defaultSize! * AppSize.s17,
              hieght: ConfigSize.defaultSize! * AppSize.s7,
              pressed: () {
                print("mo");
                Get.to(MainView());
              }), // sign in button,
          SizedBox(
            height: ConfigSize.defaultSize!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(RoutsManger.signUp),
                    text: StringManger.notHaveAccount,
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(RoutsManger.signUp),
                        text: StringManger.create,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
              ),
            ],
          ), // text don't have account
        ],
      ),
    );
  }
}

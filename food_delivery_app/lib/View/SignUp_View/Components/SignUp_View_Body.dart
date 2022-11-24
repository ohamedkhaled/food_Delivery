import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Details_View/Components/Custom_Button.dart';
import 'package:food_delivery_app/View/SignUp_View/Components/Custom_Text_Field.dart';
import 'package:food_delivery_app/core/Resours_Manger/Assets_Path.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var listImage = [
      AssetsPath.pathLogoGoogle,
      AssetsPath.pathLogoTwitter,
      AssetsPath.pathLogoFacebook
    ];
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: CustomTextField(
              icon: CupertinoIcons.envelope_fill,
              hint: StringManger.email,
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
          ), // email
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: CustomTextField(
              icon: Icons.password,
              hint: StringManger.password,
              controller: passwordController,
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
            ),
          ), // password
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
              icon: Icons.person,
              hint: StringManger.email,
              controller: nameController,
              textInputType: TextInputType.name,
            ),
          ), // Name
          SizedBox(
            height: ConfigSize.defaultSize! * AppSize.s2,
          ),
          CustomButton(
              text: StringManger.signUp,
              backgroundColor: ColorManager.mainColor,
              raduis: ConfigSize.defaultSize! * AppSize.s3,
              width: ConfigSize.defaultSize! * AppSize.s17,
              hieght: ConfigSize.defaultSize! * AppSize.s7,
              pressed: () {
                //action sign up
              }), // sign up button,
          SizedBox(
            height: ConfigSize.defaultSize!,
          ),
          RichText(
            text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: StringManger.haveAccount,
                style: Theme.of(context).textTheme.bodySmall),
          ), // text have accoute
          SizedBox(
            height: ConfigSize.defaultSize! * AppSize.s3,
          ),
          Text(
            StringManger.methods,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: ConfigSize.defaultSize! * AppSize.s1_2,
          ),
          Wrap(
            children: List.generate(
                AppIntValues.i3,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p10),
                      child: CircleAvatar(
                        radius: ConfigSize.defaultSize! * AppSize.s3,
                        backgroundImage: AssetImage(listImage[index]),
                      ),
                    )),
          ),
          SizedBox(
            height: ConfigSize.defaultSize! * AppSize.s1_2,
          ),
        ],
      ),
    );
  }
}

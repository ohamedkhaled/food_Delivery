import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/SignUp_View/Components/SignUp_View_Body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SignUpViewBody(),
    );
  }
}

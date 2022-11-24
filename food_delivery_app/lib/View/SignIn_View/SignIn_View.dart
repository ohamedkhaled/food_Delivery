  import 'package:flutter/material.dart';
  import 'package:food_delivery_app/View/SignIn_View/Component/SignIn_View_Body.dart';

  class SignInView extends StatelessWidget {
    const SignInView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body:  SignInViewBody(),
      );
    }
  }

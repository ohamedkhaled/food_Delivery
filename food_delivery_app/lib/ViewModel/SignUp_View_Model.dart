 import 'package:get/get.dart';

class SignUpViewModel extends GetxController{
  late String name ;
  late String phone ;
  late String password ;
  late String email ;

  void registration(String name , String phone, String password, String email )
  {
  this.name =name;
  this.phone =phone ;
  this.password =password ;
  this.email = email ;
  }
}


class AppMethod {


  ToastContext({required String Message}) {
  //   Fluttertoast.showToast(
  //       msg: Message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 2,
  //       backgroundColor: ColorManager.scandry,
  //       textColor: ColorManager.white,
  //       fontSize: FontSize.s16
  //   );
  // }
  //
  // Future<void> validateSigin(BuildContext Context,
  //     GlobalKey<FormState> globalKey, String name, int phoneNumber) async {
  //   final result = await SigInUc(baseRepository: getIt()).call(
  //       UserParameter(phoneNumber: phoneNumber, name: name));
  //   result.fold((l) {
  //     if (l.status == 200) {
  //       AppMethod().ToastContext(Message: l.message);
  //       SharedPreferences sharedPreferences = getIt();
  //       sharedPreferences.setString(StringManger.phone, phoneNumber.toString());
  //       sharedPreferences.setString(StringManger.name,name);
  //       Navigator.pushReplacementNamed(Context, Routes.verfiyRoute);
  //     } else {
  //       AppMethod().ToastContext(Message: l.message);
  //     }
  //   }, (r) => AppMethod().ToastContext(Message: r.toString()));
  // }




}
}

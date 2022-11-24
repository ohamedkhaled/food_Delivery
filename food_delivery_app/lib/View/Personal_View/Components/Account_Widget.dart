import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Widgets/Icon_Widget.dart';

class AccountWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const AccountWidget(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 2),
              color: Colors.grey.withOpacity(0.2))
        ]),
        child: Row(
          children: [
            IconWidget(
                pressed: () {
                  //nothing
                },
                iconData: icon,
                iconColor: Colors.white,
                backgroundColor: color,
                size: 50),
            SizedBox(
              width: 30,
            ),
            Text(text, style: Theme.of(context).textTheme.headlineLarge)
          ],
        ));
  }
}

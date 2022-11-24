


import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String text ;
  final Color iconColor;
  final IconData icon ;
  const IconTextWidget({required this.icon,required this.text,required this.iconColor,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      Row(
      children: [
      Icon(icon,color: iconColor),
        Text(text ,style: Theme.of(context).textTheme.titleSmall)

      ],
    );
  }
}

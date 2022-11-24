import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Font_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandedTextState createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String fristText;
  late String secondText;
  double textHeight = 160;
  bool hideText = true;
  @override
  void initState() {
    if (widget.text.length > textHeight) {
      fristText = widget.text.substring(0, textHeight.toInt());
      secondText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length - 1);
    } else {
      fristText = widget.text;
      secondText = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondText.isEmpty
            ? Text(
                fristText,
                style: Theme.of(context).textTheme.bodySmall,
              )
            : Column(
                children: [
                  Text(
                      hideText ? (fristText + "...") : (fristText + secondText),
                      style: Theme.of(context).textTheme.bodySmall),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hideText = !hideText;
                        });
                      },
                      child: hideText
                          ? Row(
                              children: [
                                Text(
                                  StringManger.showMore,
                                  style: TextStyle(
                                      color: ColorManager.mainColor,
                                      fontSize: 12),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: ColorManager.mainColor)
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  StringManger.showLess,
                                  style: TextStyle(
                                      color: ColorManager.mainColor,
                                      fontSize: FontSize.s12),
                                ),
                                Icon(Icons.arrow_drop_up,
                                    color: ColorManager.mainColor)
                              ],
                            ))
                ],
              ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/Bar_History_Widget.dart';
import 'Components/Card_History_View_Body.dart';

class CardHistoryView extends StatelessWidget {
  const CardHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const BarHistoryWidget(),
          CardHistoryViewBody(),
      ],
    ));
  }
}

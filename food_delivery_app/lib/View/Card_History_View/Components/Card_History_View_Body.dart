import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Card_History_View/Components/Image_Widget.dart';
import 'package:food_delivery_app/core/App_Constant.dart';
import 'package:food_delivery_app/core/Resours_Manger/Assets_Path.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/Values_Manger.dart';
import 'package:food_delivery_app/core/Responsive_UI/Config_Size.dart';
import 'package:food_delivery_app/core/Widgets/Empty_Widget.dart';
import 'package:get/get.dart';
import '../../../ViewModel/Card_History_View_Modul.dart';
import '../../../core/Resours_Manger/Rounts_Manger.dart';
import 'Custom_Opcity_Button.dart';

class CardHistoryViewBody extends StatelessWidget {
  CardHistoryViewBody({Key? key}) : super(key: key);
  var couter = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartHistoryViewModul>(builder: (cardHistoryViewModel) {
      cardHistoryViewModel.intiCardHistory();
      return cardHistoryViewModel.getCardHistoryList().isEmpty
          ? EmptyWidget(
              text: StringManger.historyEmpty,
              imgPath: AssetsPath.pathHistoryEmpty,
              height: ConfigSize.defaultSize! * AppSize.s28,
              width: ConfigSize.defaultSize! * AppSize.s28,
            )
          : Expanded(
              child: Container(
                width: double.infinity,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: AppPadding.p20,
                              right: AppPadding.p10,
                              left: AppPadding.p10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      cardHistoryViewModel.formTime(
                                          cardHistoryViewModel
                                              .getOrderTimeList()[index]),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium),
                                  Row(
                                    children: [
                                      Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                              cardHistoryViewModel
                                                          .orderTime[index] >
                                                      AppIntValues.i3
                                                  ? AppIntValues.i3
                                                  : cardHistoryViewModel
                                                      .orderTime[index],
                                              (index) {
                                            if (couter <
                                                cardHistoryViewModel
                                                    .getCardHistoryList()
                                                    .length) {
                                              couter++;
                                            }
                                            return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppPadding.p6),
                                                child: ImageWidget(
                                                    image: AppConstant()
                                                        .getImageUrl(
                                                            cardHistoryViewModel
                                                                .getCardHistoryList()[
                                                                    couter - 1]
                                                                .image)));
                                          }))
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(StringManger.total,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                  Text(
                                      "${cardHistoryViewModel.orderTime[index]} ${StringManger.items}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  InkWell(
                                      onTap: () {
                                        cardHistoryViewModel.connectWithCart(
                                            index); // sent data to card view
                                        Get.toNamed(RoutsManger.card);
                                      },
                                      child: const CustomOpcityButton())
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: cardHistoryViewModel.orderTime.length,
                    )),
              ),
            );
    });
  }
}

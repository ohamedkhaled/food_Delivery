import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/Archive_View/Archive_View.dart';
import 'package:food_delivery_app/View/Card_History_View/Card_History_View.dart';
import 'package:food_delivery_app/View/Home_View/Home_View.dart';
import 'package:food_delivery_app/View/Personal_View/Personal_View.dart';
import 'package:food_delivery_app/core/Resours_Manger/Color_Manger.dart';
import 'package:food_delivery_app/core/Resours_Manger/String_Manger.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../ViewModel/Card_History_View_Modul.dart';
import '../../ViewModel/Home_View_Model.dart';
import '../../core/Resours_Manger/Values_Manger.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const HomeView(),
        const ArchiveView(),
        const CardHistoryView(),
        const PersonalView()
      ];
    } // this screen that use in navigation

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: (StringManger.home),
          activeColorPrimary: ColorManager.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.archivebox),
          title: (StringManger.archive),
          activeColorPrimary: ColorManager.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.cart),
          title: (StringManger.card),
          activeColorPrimary: ColorManager.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person),
          title: (StringManger.you),
          activeColorPrimary: ColorManager.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    } // this tabs of navigation bar

    return RefreshIndicator(
      onRefresh: loadResources,
      child:  PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(AppSize.s0_5),
                spreadRadius: AppSize.s5,
                blurRadius: AppSize.s8,
                offset: const Offset(
                    AppSize.s0, AppSize.s3), // changes position of shadow
              )
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 600),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 700),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }

  Future<void> loadResources()async {
    await Get.find<HomeViewModel>().getPopularList();
    await Get.find<HomeViewModel>().getRecommendedList();
     Get.find<CartHistoryViewModul>().intiCardHistory();
  }
}

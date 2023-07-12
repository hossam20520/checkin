import 'package:checkin/presentation/home_tab_container_page/models/home_tab_container_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core/utils/color_constant.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../bookings_page/bookings_page.dart';
import '../home_flights_page/home_flights_page.dart';
import '../home_tab_container_page/home_tab_container_page.dart';
import '../profile_page/profile_page.dart';
import '../saved_page/saved_page.dart';
import 'controller/home_hotels_container1_controller.dart';
// import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_hotels_container_page/home_hotels_container_page.dart';
import 'package:checkin/widgets/custom_bottom_bar.dart';
import 'package:flutter/services.dart';
import '../side_menu_draweritem/side_menu_draweritem.dart';
import 'package:flutter/material.dart' hide DrawerController;

class HomeHotelsContainer1Screen  extends GetWidget<HomeHotelsContainer1Controller> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: SideMenuDraweritem(),
        appBar: CustomAppBar(
            height: getVerticalSize(92),
            title: Padding(
                padding: getPadding(left: 30 , right: 30),
                child: Text("lbl_check_in".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratSemiBold24)),
            actions: [

              IconButton(onPressed: ()=> Get.toNamed(AppRoutes.notificationsScreen ),  padding: EdgeInsets.only(right: 15 , left: 10), icon: Icon(Icons.notifications_outlined , size: 40,) , color: ColorConstant.black90003 ,),
              IconButton(onPressed: ()=> openDrawer(), icon: Icon(Icons.menu , size: 40,) , color:ColorConstant.black900Cc , padding: EdgeInsets.only(right: 30 , left: 10),),

              // AppbarImage(
              //   onTap: ()=>       IconButton(onPressed: ()=> print("aa"), icon: Icon(Icons.notifications) , color:Colors.red ,)
              //              (),
              //     height: getSize(20),
              //     width: getSize(20),
              //     svgPath: ImageConstant.imgMenu,
              //     margin: getMargin(left: 20, top: 18, right: 15))
            ]),
        backgroundColor: ColorConstant.whiteA700,
        body: Navigator(
                  key: Get.nestedKey(1),
                  initialRoute: AppRoutes.homeTabContainerPage,
                  onGenerateRoute: (routeSetting) => GetPageRoute(
                      page: () => getCurrentPage(routeSetting.name!),
                      transition: Transition.noTransition)),
        bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
          Get.toNamed(getCurrentRoute(type), id: 1);
        }));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Search:
        // return AppRoutes.homeHotelsContainerPage;
        return AppRoutes.homeTabContainerPage;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Bookings:
        return AppRoutes.bookingsPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;

      case BottomBarEnum.Flight:
        return "/flight";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      // case AppRoutes.homeHotelsContainerPage:
      //   return HomeHotelsContainerPage();
      case AppRoutes.homeTabContainerPage:
        return HomeTabContainerPageHomeTabContainerPage();
      case AppRoutes.savedPage:
        return SavedPage();
      case AppRoutes.bookingsPage:
        return BookingsPage();

      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  openDrawer() {

    _scaffoldKey.currentState?.openDrawer();
  }


}

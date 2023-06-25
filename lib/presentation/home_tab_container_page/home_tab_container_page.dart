import 'package:checkin/presentation/home_cars_page/home_cars_page.dart';

import '../home_flights_page/home_flights_page.dart';
import '../home_hotels_container_page/home_hotels_container_page.dart';
import 'controller/home_tab_container_controller.dart';
import 'models/home_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
// import 'package:booking/presentation/home_cars_page/home_cars_page.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

class HomeTabContainerPageHomeTabContainerPage extends StatelessWidget {
  HomeTabContainerController controller = Get.put(HomeTabContainerController(HomeTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,

        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  36,
                ),
                width: getHorizontalSize(
                  370,
                ),
                margin: getMargin(
                  top: 6,
                ),
                child: TabBar(

                  controller: controller.tabviewController,
                  labelColor: ColorConstant.indigo50,
                  labelStyle: TextStyle(
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelColor: ColorConstant.indigo50,
                  unselectedLabelStyle: TextStyle(
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                  indicator: BoxDecoration(
                    color: ColorConstant.indigo700Cc,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        9,
                      ),
                    ),
                    border: Border.all(
                      color: ColorConstant.indigo700,
                      width: getHorizontalSize(
                        1,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Container(

                       width: double.infinity,

                        padding: getPadding(

                          top: 7,

                          bottom: 7,
                        ),
                        decoration: AppDecoration.fillIndigo30075.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder11,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            CustomImageView(
                              imagePath: ImageConstant.imgHotelicon,
                              height: getSize(
                                20,
                              ),
                              width: getSize(
                                20,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 10,
                                right: 10
                              ),
                              child: Text(
                                "lbl_hotels".tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: getPadding(

                          top: 6,

                          bottom: 6,
                        ),
                        decoration: AppDecoration.fillIndigo30075.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder11,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgFlighticon,
                              height: getSize(
                                20,
                              ),
                              width: getSize(
                                20,
                              ),
                              margin: getMargin(
                                top: 1,
                                bottom: 1,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 10,
                                right: 10,
                                top: 2,
                              ),

                              child: Text(
                                "lbl_flights".tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: getPadding(

                          top: 7,

                          bottom: 7,
                        ),
                        decoration: AppDecoration.fillIndigo30075.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder11,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgCaricon,
                              height: getSize(
                                20,
                              ),
                              width: getSize(
                                20,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 10,
                              ),
                              child: Text(
                                "lbl_car_hire".tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             Expanded(child:   Container(
                height: getVerticalSize(
                  627,
                ),
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [

                    HomeHotelsContainerPage(),
                    HomeFlightsPage(),
                    HomeCarsPage(),

                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

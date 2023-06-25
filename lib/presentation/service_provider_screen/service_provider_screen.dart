import 'controller/service_provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

class ServiceProviderScreen extends GetWidget<ServiceProviderController> {
  // const ServiceProviderScreen({Key? key}) : super(key: key);
  final flight = Get.find<PrefUtils>().getFlight();
  final car = Get.find<PrefUtils>().getCar();
  final hotel = Get.find<PrefUtils>().getHotel();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(78),
                leadingWidth: 40,
                leading:  IconButton(
                  onPressed: ()=> Get.back(), icon: Icon(  Icons.chevron_left , size: 40,),


                ) ,
                title: AppbarSubtitle(
                    text: "msg_service_provider".tr,
                    margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 36, top: 65, right: 36),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(
                      //     margin: getMargin(left: 1),
                      //     padding: getPadding(
                      //         left: 59, top: 24, right: 59, bottom: 24),
                      //     decoration: AppDecoration.fillGray50.copyWith(
                      //         borderRadius: BorderRadiusStyle.roundedBorder11),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Card(
                      //               clipBehavior: Clip.antiAlias,
                      //               elevation: 0,
                      //               margin: EdgeInsets.all(0),
                      //               color: ColorConstant.indigo50,
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadiusStyle.circleBorder46),
                      //               child: Container(
                      //                   height: getSize(93),
                      //                   width: getSize(93),
                      //                   padding: getPadding(all: 24),
                      //                   decoration: AppDecoration.fillIndigo50
                      //                       .copyWith(
                      //                           borderRadius: BorderRadiusStyle
                      //                               .circleBorder46),
                      //                   child: Stack(children: [
                      //                     CustomImageView(
                      //                         imagePath: ImageConstant.imgBed1,
                      //                         height: getSize(45),
                      //                         width: getSize(45),
                      //                         alignment: Alignment.center)
                      //                   ]))),
                      //           Padding(
                      //               padding: getPadding(top: 31, bottom: 31),
                      //               child: Text("lbl_hotels".tr,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   textAlign: TextAlign.left,
                      //                   style: AppStyle.txtMontserratMedium24))
                      //         ])),
                      // Container(
                      //     margin: getMargin(left: 1, top: 32),
                      //     padding: getPadding(
                      //         left: 56, top: 24, right: 56, bottom: 24),
                      //     decoration: AppDecoration.fillGray50.copyWith(
                      //         borderRadius: BorderRadiusStyle.roundedBorder11),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Card(
                      //               clipBehavior: Clip.antiAlias,
                      //               elevation: 0,
                      //               margin: EdgeInsets.all(0),
                      //               color: ColorConstant.indigo50,
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadiusStyle.circleBorder46),
                      //               child: Container(
                      //                   height: getSize(93),
                      //                   width: getSize(93),
                      //                   padding: getPadding(all: 24),
                      //                   decoration: AppDecoration.fillIndigo50
                      //                       .copyWith(
                      //                           borderRadius: BorderRadiusStyle
                      //                               .circleBorder46),
                      //                   child: Stack(children: [
                      //                     CustomImageView(
                      //                         imagePath: ImageConstant.imgBed12,
                      //                         height: getSize(45),
                      //                         width: getSize(45),
                      //                         alignment: Alignment.center)
                      //                   ]))),
                      //           Padding(
                      //               padding: getPadding(top: 33, bottom: 29),
                      //               child: Text("lbl_flights".tr,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   textAlign: TextAlign.left,
                      //                   style: AppStyle.txtMontserratMedium24))
                      //         ])),

                       flight == "true"  ? InkWell( onTap: ()=>  Get.toNamed(AppRoutes.requestsScreen ,
                       arguments: "flights"
                       ),  child:  Container(
                          margin: getMargin(left: 1, top: 32, bottom: 5),
                          padding: getPadding(
                              left: 50, top: 24, right: 50, bottom: 24),
                          decoration: AppDecoration.outlineBlack900191.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.indigo50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadiusStyle.circleBorder46),
                                    child: Container(
                                        height: getSize(93),
                                        width: getSize(93),
                                        padding: getPadding(all: 24),
                                        decoration: AppDecoration.fillIndigo50
                                            .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder46),
                                        child: Stack(children: [
                                    Icon(Icons.flight , size: 60,color:  ColorConstant.indigo700,)
                                        ]))),
                                Padding(
                                    padding: getPadding(top: 30, bottom: 32),
                                    child: Text("lbl_flight_ser".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtMontserratMedium24Black900))
                              ])),) : SizedBox.shrink(),

                      hotel == "true"  ? InkWell( onTap: ()=>  Get.toNamed(AppRoutes.requestsScreen ,
                          arguments: "hotel"
                      ),  child:  Container(
                          margin: getMargin(left: 1, top: 32, bottom: 5),
                          padding: getPadding(
                              left: 50, top: 24, right: 50, bottom: 24),
                          decoration: AppDecoration.outlineBlack900191.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.indigo50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadiusStyle.circleBorder46),
                                    child: Container(
                                        height: getSize(93),
                                        width: getSize(93),
                                        padding: getPadding(all: 24),
                                        decoration: AppDecoration.fillIndigo50
                                            .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder46),
                                        child: Stack(children: [
                                          Icon(Icons.hotel , size: 60, color:  ColorConstant.indigo700,)
                                        ]))),
                                Padding(
                                    padding: getPadding(top: 30, bottom: 32),
                                    child: Text("lbl_hotel_serv".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtMontserratMedium24Black900))
                              ]))) : SizedBox.shrink(),

                      car == "true"  ?  InkWell( onTap: ()=>  Get.toNamed(AppRoutes.requestsScreen ,
                          arguments: "car"
                      ),  child:Container(
                          margin: getMargin(left: 1, top: 32, bottom: 5),
                          padding: getPadding(
                              left: 50, top: 24, right: 50, bottom: 24),
                          decoration: AppDecoration.outlineBlack900191.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.indigo50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder46),
                                    child: Container(
                                        height: getSize(93),
                                        width: getSize(93),
                                        padding: getPadding(all: 24),
                                        decoration: AppDecoration.fillIndigo50
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder46),
                                        child: Stack(children: [
                                          Icon(Icons.car_rental , size: 60, color:  ColorConstant.indigo700,)
                                        ]))),
                                Padding(
                                    padding: getPadding(top: 30, bottom: 32),
                                    child: Text("lbl_car_hire".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtMontserratMedium24Black900))
                              ]))) : SizedBox.shrink()
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft7() {
    Get.back();
  }
}

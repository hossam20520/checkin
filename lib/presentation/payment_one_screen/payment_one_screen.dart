import 'package:checkin/presentation/Car_detail_screen/controller/car_controller.dart';

import 'controller/payment_one_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentOneScreen extends GetWidget<PaymentOneController> {
  @override
  Widget build(BuildContext context) {

    Rx<String> carTitle = Get.find<CarController>().roomModelObj.value.title;
    Rx<String> image = Get.find<CarController>().roomModelObj.value.image;
    Rx<String> price = Get.find<CarController>().roomModelObj.value.price;
    Rx<String> carType = Get.find<CarController>().roomModelObj.value.carType;
    String isLogged = Get.find<PrefUtils>().getIslogged();


    return   Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 35,
                leading: IconButton(
                  onPressed: ()=> Get.back(),
                  icon: Icon(Icons.chevron_left , size: 35,),
                ),
                title: AppbarSubtitle(
                    text: "lbl_payment".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 24, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(left: 18, right: 18),
                          padding: getPadding(all: 15),
                          decoration: AppDecoration.outlineIndigo503.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomImageView(
                                   url:image.toString(),
                                    height: getVerticalSize(108),
                                    width: getHorizontalSize(188),
                                    radius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            getHorizontalSize(12)),
                                        topRight: Radius.circular(
                                            getHorizontalSize(12))),
                                    alignment: Alignment.center,
                                    margin: getMargin(top: 12)),
                                Padding(
                                    padding: getPadding(top: 28),
                                    child: Text( carTitle.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtMontserratMedium2324)),
                                Padding(
                                    padding: getPadding(top: 13),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text( carType.toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtMontserratRegular1272),

                                              ]),
                                          Container(
                                              height: getVerticalSize(37),
                                              width: getHorizontalSize(93),
                                              margin: getMargin(bottom: 1),
                                              child: Stack(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                             price.toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtMontserratSemiBold1781)),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Text(
                                                            "lbl_per_day".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtMontserratLight1399))
                                                  ]))
                                        ]))
                              ])),
                      Spacer(),
                      Container(
                          height: getVerticalSize(136),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: double.maxFinite,
                                    padding: getPadding(
                                        left: 35,
                                        top: 11,
                                        right: 35,
                                        bottom: 11),
                                    decoration: AppDecoration.fillIndigo50,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  top: 88, bottom: 2),
                                              child: Text("lbl_total".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratRegular18)),
                                          Padding(
                                              padding: getPadding(top: 87),
                                              child: Text(   price.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratSemiBold20))
                                        ]))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: getPadding(top: 14),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 35, right: 35),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_sub_total".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratLight16),
                                                    Text(  price.toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratMedium16Indigo700)
                                                  ])),
                                          Padding(
                                              padding: getPadding(top: 7),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: ColorConstant
                                                      .indigo30090))
                                        ]))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: getPadding(bottom: 44),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 35, right: 35),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(

                                                        "lbl_taxes".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterRegular16),

                                                    Text(   "0",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratMedium16Indigo700)
                                                  ])),
                                          Padding(
                                              padding: getPadding(top: 17),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: ColorConstant
                                                      .indigo30090))
                                        ])))
                          ])),

                      isLogged == "yes" ?

                     Column(children: [  CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_reserve_now".tr,
                          margin: getMargin(
                              left: 27, top: 48, right: 26, bottom: 5),
                          onTap: () {
                            onTapReservenow();
                          }) ,
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_reserve_nowPay".tr,
                          margin: getMargin(
                              left: 27, top: 5, right: 26, bottom: 37),
                          onTap: () {
                            onTapReservenowCash();
                          })

                     ],)

                          :
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "Login_First_To_Reserve".tr,
                          margin: getMargin(
                              left: 27, top: 48, right: 26, bottom: 37),
                          onTap: () {
                            Get.toNamed(AppRoutes.logInScreen);
                          })



                    ])));
  }

  onTapReservenow() {
     controller.pay("online");
    // Get.toNamed(
    //   AppRoutes.paymentWebScreen,
    //   arguments: "flight",
    // );
  }

  onTapReservenowCash(){
    controller.pay("cash");
  }

  onTapArrowleft15() {
    Get.back();
  }
}

import '../home_hotels_container_page/controller/home_hotels_container_controller.dart';
import '../room_one_screen/controller/room_one_controller.dart';
import 'controller/payment_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends GetWidget<PaymentController> {


  @override
  Widget build(BuildContext context) {
    Rx<String> roomInfo = Get.find<RoomOneController>().roomOneModelObj.value.title;
    Rx<String> bed = Get.find<RoomOneController>().roomOneModelObj.value.bed;
    Rx<double> price = Get.find<RoomOneController>().roomOneModelObj.value.price;
    Rx<String> checkin = Get.find<HomeHotelsContainerController>().homeHotelsContainerModelObj.value.chekin;
    Rx<String> checkout = Get.find<HomeHotelsContainerController>().homeHotelsContainerModelObj.value.checkout;


    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 40,
                leading: IconButton(
                  onPressed: ()=> Get.back(),
                  icon:  Icon(Icons.chevron_left, color:Colors.white ,size:35 , ),
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
                          margin: getMargin(left: 8, right: 8),
                          padding: getPadding(
                              left: 12, top: 8, right: 12, bottom: 8),
                          decoration: AppDecoration.outlineIndigo50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: getPadding(top: 5),
                                    child: Text( roomInfo.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtMontserratMedium16)),
                                Padding(
                                    padding: getPadding(top: 14),
                                    child: Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgCurrentlocationicon,
                                          height: getSize(15),
                                          width: getSize(15)),
                                      Padding(
                                          padding: getPadding(left: 6),
                                          child: Text( bed.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratLight12)),
                                      Spacer(),
                                      Text("lbl_price_for".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtMontserratLight12),
                                      CustomImageView(
                                          svgPath:
                                              ImageConstant.imgUserIndigo300,
                                          height: getSize(15),
                                          width: getSize(15),
                                          margin: getMargin(left: 6)),
                                      CustomImageView(
                                          svgPath:
                                              ImageConstant.imgUserIndigo300,
                                          height: getSize(15),
                                          width: getSize(15),
                                          margin: getMargin(left: 2))
                                    ])),
                                Padding(
                                    padding: getPadding(top: 15),
                                    child: Row(children: [
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgAppointmentsinactive,
                                          height: getSize(15),
                                          width: getSize(15)),
                                      Padding(
                                          padding: getPadding(left: 6),
                                          child: Text(
                                               "Checkin ".tr + checkin.toString() ,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratLight12)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgAppointmentsinactive,
                                          height: getSize(15),
                                          width: getSize(15)),
                                      Padding(
                                          padding: getPadding(left: 6),
                                          child: Text(
                                              "Checkout ".tr + checkout.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratLight12))
                                    ])),
                                Padding(
                                    padding: getPadding(top: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding:
                                                  getPadding(top: 7, bottom: 7),
                                              // child: Text(
                                              //     "lbl_number_2_rooms".tr,
                                              //     overflow:
                                              //         TextOverflow.ellipsis,
                                              //     textAlign: TextAlign.left,
                                              //     style: AppStyle
                                              //         .txtMontserratMedium12)

                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(price.toString() + " OMR",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtMontserratSemiBold14),
                                                Text("lbl_per_night".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtMontserratLight11)
                                              ])
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
                                              child: Text(price.toString() + " OMR",
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
                                                    Text(price.toString() + " OMR",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratLight16),
                                                    Text( price.toString() + " OMR",
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
                                                    Text("lbl_taxes".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterRegular16),
                                                    Text( "0 OMR",
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
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_reserve_now".tr,
                          margin: getMargin(
                              left: 27, top: 48, right: 26, bottom: 37),
                          onTap: () {
                            onTapReservenow();
                          })
                    ])));
  }

  onTapReservenow() {
    controller.pay();
    // print("55555555555555555555555555555555555555555");

  }

  onTapArrowleft11() {
    Get.back();
  }
}

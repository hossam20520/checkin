import 'package:checkin/presentation/request_details_one_screen/widgets/CarDetail.dart';
import 'package:checkin/presentation/request_details_one_screen/widgets/FlightDetail.dart';
import 'package:checkin/presentation/request_details_one_screen/widgets/HotelDetail.dart';

import 'controller/request_details_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';

class RequestDetailsOneScreen extends GetWidget<RequestDetailsOneController> {
  // const RequestDetailsOneScreen({Key? key}) : super(key: key);
  // requestDetailsOneModelObj.value.paymentModel.value.status
  @override
  Widget build(BuildContext context) {
    return    Obx(()=>  SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(78),
                leadingWidth: 40,
                leading: IconButton(
                  onPressed: ()=> Get.back(),
                  icon: Icon(Icons.chevron_left, size: 35,),
                ),
                title:  Obx(()=>AppbarSubtitle(
                    text:  controller.requestDetailsOneModelObj.value.type.toString(),
                    margin: getMargin(left: 30)) ),
                styleType: Style.bgFillIndigo900),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 32, bottom: 32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.maxFinite,
                          child:  Container(
                              padding: getPadding(
                                  left: 27, top: 10, right: 27, bottom: 10),
                              decoration: AppDecoration.fillGray50,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 11, bottom: 2),
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("lbl_total_price".tr,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratLight16),
                                           Text(
                     controller.requestDetailsOneModelObj.value.paymentModel.value.totalPrice.toString()
                                               ,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratMedium16Indigo700)
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 11, bottom: 2),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("PaymentStatus".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratLight16),
                                            Obx(()=>  Text(controller.requestDetailsOneModelObj.value.paymentModel.value.status.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratMedium16Indigo700))
                                            ]))
                                  ]))),

                      controller.requestDetailsOneModelObj.value.type.toString() == "hotel" ?
                          HotelItemWedget() : SizedBox.shrink() ,

                      controller.requestDetailsOneModelObj.value.type.toString() == "flight" ?
                      FlightItemWedget() : SizedBox.shrink() ,
                      // FlightItemWedget(),


                      controller.requestDetailsOneModelObj.value.type.toString() == "car" ?
                      CarItemWedget() : SizedBox.shrink() ,


                      Padding(
                          padding: getPadding(left: 27, top: 19),
                          child: Text("msg_client_information".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold16)),
                      SizedBox(
                          width: double.maxFinite,
                          child: Container(
                              margin: getMargin(top: 19, bottom: 5),
                              padding: getPadding(
                                  left: 27, top: 10, right: 27, bottom: 10),
                              decoration: AppDecoration.fillGray50,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 11, bottom: 1),
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding:
                                                  getPadding(bottom: 1),
                                                  child: Text("nameE".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratLight16)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text(
          controller.requestDetailsOneModelObj.value.clientDataModel.value.name.toString(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratRegular16))
                                            ])),
                                    Padding(
                                        padding: getPadding(top: 11, bottom: 1),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding:
                                                      getPadding(bottom: 1),
                                                  child: Text("lbl_email2".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratLight16)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text(
                                                      controller.requestDetailsOneModelObj.value.clientDataModel.value.email.toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratRegular16)),



                                            ])),

                                    Padding(
                                        padding: getPadding(top: 11, bottom: 1),
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding:
                                                  getPadding(bottom: 1),
                                                  child: Text("phone".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratLight16)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text(
                                                      controller.requestDetailsOneModelObj.value.clientDataModel.value.phone.toString(),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratRegular16)),



                                            ])),



                                  ])))
                    ])),
            bottomNavigationBar: Container(
                margin: getMargin(left: 27, right: 26, bottom: 24),
                decoration: AppDecoration.fillGray50,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        onTap: ()=> controller.Accept("1"),
                          height: getVerticalSize(62),
                          text: "lbl_accept_request".tr,
                          variant: ButtonVariant.Primary,
                          shape: ButtonShape.RoundedBorder11,
                          padding: ButtonPadding.PaddingAll18,
                          fontStyle: ButtonFontStyle.MontserratSemiBold20),
                      InkWell(onTap: ()=>controller.Accept("0"),  child: Padding(
                          padding: getPadding(top: 19),
                          child: Text("lbl_reject_request".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratLight16Indigo300)) ,)
                    ])))));
  }



  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft6() {
    Get.back();
  }
}

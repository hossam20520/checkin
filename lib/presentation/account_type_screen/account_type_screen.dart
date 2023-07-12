import 'controller/account_type_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AccountTypeScreen extends GetWidget<AccountTypeController> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(

                width: double.maxFinite,
                padding: getPadding(all: 26),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                Padding(
                padding: getPadding(top: 40),
                child:Text("lbl_check_in".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratSemiBold24)),
                      Padding(
                          padding: getPadding(top: 36),
                          child: Text("msg_choose_account_type".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtDescription)),
                      Obx(() => InkWell(
                            onTap: controller
                                .selectUser, // Call the switchLanguage method on tap
                            child: Container(
                                margin: getMargin(left: 1, top: 24),
                                padding: getPadding(
                                    left: 32, top: 14, right: 32, bottom: 14),
                                decoration: controller.accountTypeModelObj.value
                                        .isUserSelected
                                    ? AppDecoration.fillIndigo700.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder11)
                                    : AppDecoration.fillIndigo50.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder11),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 16),
                                          child: Text("lbl_user".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: controller
                                                      .accountTypeModelObj
                                                      .value
                                                      .isUserSelected
                                                  ? AppStyle
                                                      .txtMontserratMedium18WhiteA700
                                                  : AppStyle
                                                      .txtMontserratRegular20lack)),
                                      controller.accountTypeModelObj.value
                                              .isUserSelected
                                          ? CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCheckmark,
                                              height: getSize(20),
                                              width: getSize(20),
                                              margin:
                                                  getMargin(top: 3, bottom: 3))
                                          : CustomImageView(
                                              svgPath: "",
                                              height: getSize(20),
                                              width: getSize(20),
                                              margin:
                                                  getMargin(top: 3, bottom: 3),
                                            )
                                    ])),
                          )),
                      Obx(() => InkWell(
                            onTap: controller
                                .selectServiceProvider, // Call the switchLanguage method on tap
                            child: Container(
                                margin: getMargin(left: 1, top: 24),
                                padding: getPadding(
                                    left: 32, top: 14, right: 32, bottom: 14),
                                decoration: controller.accountTypeModelObj.value
                                        .isUserSelected
                                    ? AppDecoration.fillIndigo50.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder11)
                                    : AppDecoration.fillIndigo700.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder11),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 16),
                                          child: Text("msg_service_provider".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: controller
                                                      .accountTypeModelObj
                                                      .value
                                                      .isUserSelected
                                                  ? AppStyle
                                                      .txtMontserratRegular20lack
                                                  : AppStyle
                                                      .txtMontserratMedium18WhiteA700)),
                                      controller.accountTypeModelObj.value
                                              .isUserSelected
                                          ? CustomImageView(
                                              svgPath: "",
                                              height: getSize(20),
                                              width: getSize(20),
                                              margin:
                                                  getMargin(top: 3, bottom: 3),
                                            )
                                          : CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCheckmark,
                                              height: getSize(20),
                                              width: getSize(20),
                                              margin:
                                                  getMargin(top: 3, bottom: 3))
                                    ])),
                          )),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_continue".tr,
                          margin: getMargin(bottom: 34),
                          onTap: () {
                            onTapContinue();
                          })
                    ])));
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountScreen,
    );
  }
}

import 'controller/choose_lang_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChooseLangScreen extends GetWidget<ChooseLangController> {
  @override
  Widget build(BuildContext context) {
      String logged =  Get.arguments ?? 'not';
    return  Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, top: 26, right: 26, bottom: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("lbl_check_in".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratSemiBold24),
                      Padding(
                          padding: getPadding(top: 31),
                          child: Text("msg_welcome_to_check".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold24Black900)),
                      Padding(
                          padding: getPadding(top: 36),
                          child: Text("msg_select_your_language".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtDescription)),
                      Obx(() => InkWell(
                            onTap: controller
                                .selectEnglishLang, // Call the switchLanguage method on tap
                            child: Container(
                                margin: getMargin(left: 1, top: 24),
                                padding: getPadding(
                                    left: 32, top: 13, right: 32, bottom: 13),
                                decoration: controller.chooseLangModelObj.value
                                        .isEnglish.value
                                    ?   AppDecoration.fillIndigo700.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder11) : AppDecoration.fillIndigo50.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder11) ,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 1, top: 2),
                                          child: Text("lbl_english".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: controller.chooseLangModelObj.value.isEnglish.value
                                                  ?  AppStyle
                                                  .txtMontserratMedium18WhiteA700 : AppStyle
                                                  .txtMontserratRegular20lack)),
                                      controller.chooseLangModelObj.value
                                              .isEnglish.value
                                          ?  CustomImageView(
                                          svgPath:
                                          ImageConstant.imgCheckmark,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin:
                                          getMargin(top: 3, bottom: 3)) :   CustomImageView(
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
                                .selectArabicLang, // Call the switchLanguage method on tap
                            child: Container(
                                margin: getMargin(left: 1, top: 24),
                                padding: getPadding(
                                    left: 32, top: 13, right: 32, bottom: 13),
                                decoration: controller.chooseLangModelObj.value
                                        .isEnglish.value
                                    ?   AppDecoration.fillIndigo50.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder11) :  AppDecoration.fillIndigo700.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder11),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: getPadding(left: 1, top: 2),
                                          child: Text("lbl_arabic".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: controller
                                                      .chooseLangModelObj
                                                      .value
                                                      .isEnglish.value
                                                  ?    AppStyle
                                                  .txtMontserratRegular20lack : AppStyle
                                                  .txtMontserratMedium18WhiteA700  )),
                                      controller.chooseLangModelObj.value
                                              .isEnglish.value
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
                      logged == "logged" ? CustomButton(
                          height: getVerticalSize(62),
                          text: "Save".tr,
                          onTap: () {
                            Back();
                          })   : CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_let_s_go".tr,
                          onTap: () {
                            onTapLetsgo();
                          }),
                      Container(
                          width: getHorizontalSize(274),
                          margin: getMargin(
                              left: 32, top: 34, right: 33, bottom: 2),
                          child: Text("msg_you_can_change_language".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtMontserratLight16))
                    ])));
  }
  Back(){
    Get.back();
  }


  onTapLetsgo() {
    Get.toNamed(
      AppRoutes.onboardingOneScreen,
    );
  }
}

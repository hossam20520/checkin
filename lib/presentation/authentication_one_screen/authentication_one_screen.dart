import 'controller/authentication_one_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthenticationOneScreen extends GetWidget<AuthenticationOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(69),
                leadingWidth: 43,
                leading: AppbarImage(
                    height: getVerticalSize(17),
                    width: getHorizontalSize(9),
                    svgPath: ImageConstant.imgArrowleftBlack900,
                    margin: getMargin(left: 34, top: 20, bottom: 18),
                    onTap: () {
                      onTapArrowleft1();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_check_in".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, top: 18, right: 26, bottom: 18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_enter_authentication".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratSemiBold24),
                      Container(
                          width: getHorizontalSize(274),
                          margin: getMargin(left: 34, top: 16, right: 32),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_enter_the_4_digit2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.fromHex("#8185c6"),
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300)),
                                TextSpan(
                                    text: "msg_62_813_8172_5977".tr,
                                    style: TextStyle(
                                        color: ColorConstant.fromHex("#f29f05"),
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500))
                              ]),
                              textAlign: TextAlign.center)),
                      GestureDetector(
                          onTap: () {
                            onTapdigitcode();
                          },
                          child: Padding(
                              padding: getPadding(left: 51, top: 34, right: 49),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: getSize(48),
                                        padding: getPadding(
                                            left: 18,
                                            top: 13,
                                            right: 18,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .txtOutlineIndigo300
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .txtCircleBorder24),
                                        child: Text("lbl_7".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtMontserratRegular16)),
                                    Container(
                                        width: getSize(48),
                                        margin: getMargin(left: 16),
                                        padding: getPadding(
                                            left: 18,
                                            top: 13,
                                            right: 18,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .txtOutlineIndigo300
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .txtCircleBorder24),
                                        child: Text("lbl_5".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtMontserratRegular16)),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgLaptop,
                                        height: getSize(48),
                                        width: getSize(48),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(24)),
                                        margin: getMargin(left: 16)),
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgLaptopIndigo300,
                                        height: getSize(48),
                                        width: getSize(48),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(24)),
                                        margin: getMargin(left: 16))
                                  ]))),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_continue".tr,
                          variant: ButtonVariant.FillIndigo50,
                          fontStyle:
                              ButtonFontStyle.MontserratSemiBold20Indigo300),
                      Padding(
                          padding: getPadding(top: 34, bottom: 19),
                          child: Text("lbl_resend_the_code".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratLight16))
                    ]))));
  }

  onTapdigitcode() {
    Get.toNamed(
      AppRoutes.authenticationFilledScreen,
    );
  }

  onTapArrowleft1() {
    Get.back();
  }
}

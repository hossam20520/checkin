import 'controller/success_two_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessTwoScreen extends GetWidget<SuccessTwoController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, right: 26),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgIllustration,
                          height: getVerticalSize(154),
                          width: getHorizontalSize(164),
                          margin: getMargin(top: 141)),
                      Padding(
                          padding: getPadding(top: 49),
                          child: Text("msg_congratulations".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold24)),
                      Container(
                          width: getHorizontalSize(228),
                          margin: getMargin(top: 23),
                          child: Text("msg_the_password_has".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtMontserratLight16Black900)),
                      Spacer(),
                      CustomButton(
                          margin: getMargin(bottom: 200),
                          height: getVerticalSize(62),
                          text: "lbl_log_in".tr,
                          onTap: () {
                            onTapLogin();
                          })
                    ])));
  }

  onTapLogin() {
    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}

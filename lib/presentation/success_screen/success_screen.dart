import 'controller/success_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SuccessScreen extends GetWidget<SuccessController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 26,
            right: 26,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgIllustration,
                height: getVerticalSize(
                  154,
                ),
                width: getHorizontalSize(
                  164,
                ),
                margin: getMargin(
                  top: 141,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 49,
                ),
                child: Text(
                  "msg_congratulations".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratSemiBold24,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  250,
                ),
                margin: getMargin(
                  left: 43,
                  top: 23,
                  right: 47,
                ),
                child: Text(
                  "msg_your_profile_is".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtMontserratLight16Black900,
                ),
              ),
              Spacer(),
              CustomButton(
                height: getVerticalSize(
                  62,
                ),
                text: "msg_let_s_get_started".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

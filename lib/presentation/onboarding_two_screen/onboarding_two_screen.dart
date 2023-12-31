import 'controller/onboarding_two_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, top: 41, right: 26, bottom: 41),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgOnboarding2,
                          height: getVerticalSize(250),
                          width: getHorizontalSize(273)),
                      Padding(
                          padding: getPadding(top: 73),
                          child: Text("lbl_select_the_date".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold24Black900)),
                      Container(
                          width: getHorizontalSize(274),
                          margin: getMargin(left: 33, top: 26, right: 33),
                          child: Text("msg_lorem_ipsum_dolor".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtMontserratLight18)),
                      Container(
                          height: getVerticalSize(10),
                          margin: getMargin(top: 63, right: 63),
                          child: SmoothIndicator(
                              offset: 1,
                              count: 3,
                              size: Size.zero,
                              effect: ScrollingDotsEffect(
                                  spacing: 12,
                                  activeDotColor: ColorConstant.indigo900,
                                  dotColor: ColorConstant.indigo50,
                                  dotHeight: getVerticalSize(10),
                                  dotWidth: getHorizontalSize(10)))),
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_next".tr,
                          margin: getMargin(top: 64),
                          onTap: () {
                            onTapNext();
                          }),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtSkip();
                              },
                              child: Padding(
                                  padding: getPadding(top: 49),
                                  child: Text("lbl_skip".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtMontserratLight16))))
                    ])) );
  }

  onTapNext() {
    Get.toNamed(
      AppRoutes.onboardingThreeScreen,
    );
  }

  onTapTxtSkip() {

    Get.toNamed(
      AppRoutes.logInScreen,
    );
  }
}

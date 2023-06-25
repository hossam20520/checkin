import 'controller/sort_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class SortBottomsheet extends StatelessWidget {
  SortBottomsheet(this.controller);

  SortController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 24,
            top: 16,
            right: 24,
            bottom: 16,
          ),
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgRectangle,
                height: getVerticalSize(
                  5,
                ),
                width: getHorizontalSize(
                  48,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    2,
                  ),
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: getPadding(
                  top: 17,
                ),
                child: Text(
                  "lbl_sort_by".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratSemiBold24Black900,
                ),
              ),
              Obx(
                () => CustomCheckbox(
                  width: getHorizontalSize(
                    345,
                  ),
                  text: "lbl_lowest_price".tr,
                  value: controller.isCheckbox.value,
                  margin: getMargin(
                    top: 29,
                  ),
                  fontStyle: CheckboxFontStyle.MontserratLight16,
                  isRightCheck: true,
                  onChange: (value) {
                    controller.isCheckbox.value = value;
                  },
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 25,
                ),
                child: Text(
                  "lbl_highest_price".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratLight16Black90001,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 22,
                ),
                child: Text(
                  "lbl_most_recent".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratLight16Black90001,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 24,
                ),
                child: Text(
                  "lbl_stars_0_to_5".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratLight16Black90001,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 24,
                  bottom: 32,
                ),
                child: Text(
                  "lbl_stars_5_to_0".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratLight16Black90001,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

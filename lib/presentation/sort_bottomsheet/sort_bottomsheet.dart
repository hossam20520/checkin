import '../../widgets/custom_button.dart';
import '../search_results_two_screen/controller/search_results_two_controller.dart';
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
                  text: "lbl_highest_price".tr,
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


              Obx(
                    () => CustomCheckbox(
                  width: getHorizontalSize(
                    345,
                  ),
                  text: "lbl_lowest_price".tr,
                  value: controller.highestPrice.value,
                  margin: getMargin(
                    top: 29,
                  ),
                  fontStyle: CheckboxFontStyle.MontserratLight16,
                  isRightCheck: true,
                  onChange: (value) {
                    controller.highestPrice.value = value;
                  },
                ),
              ),

              Container(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 49,
                    bottom: 25,
                  ),
                  padding: getPadding(
                    left: 26,
                    right: 26,
                  ),
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onTap: ()=> showResult() ,
                        height: getVerticalSize(
                          62,
                        ),
                        text: "msg_show_results".tr,
                        margin: getMargin(
                          top: 4,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showResult() {

    Get.find<SearchResultsTwoController>().fetchHotelsItems( "" , "" , controller.isCheckbox.value);
    Get.back();

  }
}

import '../controller/frame_10392_controller.dart';
import '../models/list988581417wxhone_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class List988581417wxhoneItemWidget extends StatelessWidget {
  List988581417wxhoneItemWidget(this.list988581417wxhoneItemModelObj);

  List988581417wxhoneItemModel list988581417wxhoneItemModelObj;

  var controller = Get.find<Frame10392Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 11,
          top: 8,
          right: 11,
          bottom: 8,
        ),
        decoration: AppDecoration.outlineIndigo503.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder11,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img988581417wxh195x148,
              height: getVerticalSize(
                95,
              ),
              width: getHorizontalSize(
                148,
              ),
              radius: BorderRadius.only(
                topLeft: Radius.circular(
                  getHorizontalSize(
                    10,
                  ),
                ),
                topRight: Radius.circular(
                  getHorizontalSize(
                    10,
                  ),
                ),
              ),
              alignment: Alignment.center,
              margin: getMargin(
                top: 14,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 22,
              ),
              child: Obx(
                () => Text(
                  list988581417wxhoneItemModelObj.economyTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratMedium1827,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 7,
                      bottom: 7,
                    ),
                    child: Text(
                      "msg_4_doors_5_seats".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratLight1279,
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      29,
                    ),
                    width: getHorizontalSize(
                      73,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "lbl_2000_omr".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMontserratSemiBold14,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "lbl_per_day".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMontserratLight11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

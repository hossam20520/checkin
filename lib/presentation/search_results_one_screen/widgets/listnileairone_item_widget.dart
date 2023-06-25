import '../controller/search_results_one_controller.dart';
import '../models/listnileairone_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListnileaironeItemWidget extends StatelessWidget {
  ListnileaironeItemWidget(this.listnileaironeItemModelObj);

  ListnileaironeItemModel listnileaironeItemModelObj;

  var controller = Get.find<SearchResultsOneController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          color: ColorConstant.indigo50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.circleBorder15,
          ),
          child: Container(
            height: getSize(
              30,
            ),
            width: getSize(
              30,
            ),
            padding: getPadding(
              left: 1,
              top: 6,
              right: 1,
              bottom: 6,
            ),
            decoration: AppDecoration.fillIndigo50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Stack(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgNileair1,
                  height: getVerticalSize(
                    15,
                  ),
                  width: getHorizontalSize(
                    27,
                  ),
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  listnileaironeItemModelObj.timeTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratRegular1279,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 2,
                ),
                child: Obx(
                  () => Text(
                    listnileaironeItemModelObj.flightTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratLight914,
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: getPadding(
            top: 7,
            bottom: 9,
          ),
          child: Text(
            "lbl_direct".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratLight1096,
          ),
        ),
      ],
    );
  }
}

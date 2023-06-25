import '../controller/search_results_one_controller.dart';
import '../models/listwizzairlogo_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListwizzairlogoItemWidget extends StatelessWidget {
  ListwizzairlogoItemWidget(this.listwizzairlogoItemModelObj);

  ListwizzairlogoItemModel listwizzairlogoItemModelObj;

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
              left: 3,
              top: 7,
              right: 3,
              bottom: 7,
            ),
            decoration: AppDecoration.fillIndigo50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Stack(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWizzairlogo1,
                  height: getVerticalSize(
                    15,
                  ),
                  width: getHorizontalSize(
                    22,
                  ),
                  alignment: Alignment.center,
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
                  listwizzairlogoItemModelObj.timeTxt.value,
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
                    listwizzairlogoItemModelObj.flightTxt.value,
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

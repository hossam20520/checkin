import '../controller/search_results_one_controller.dart';
import '../models/listgroup10342_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listgroup10342ItemWidget extends StatelessWidget {
  Listgroup10342ItemWidget(this.listgroup10342ItemModelObj);

  Listgroup10342ItemModel listgroup10342ItemModelObj;

  var controller = Get.find<SearchResultsOneController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          height: 30,
          width: 30,
          child: CustomImageView(
            imagePath: ImageConstant.imgGroup10342,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                listgroup10342ItemModelObj.timeTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtMontserratRegular1279,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 3,
              ),
              child: Obx(
                () => Text(
                  listgroup10342ItemModelObj.caibeywithegyptTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratLight914,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: getPadding(
            top: 8,
            bottom: 8,
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

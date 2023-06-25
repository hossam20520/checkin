import '../controller/bottom_sheet_controller.dart';
import '../models/bottomsheet_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class BottomsheetItemWidget extends StatelessWidget {
  // BottomsheetItemWidget(this.bottomsheetItemModelObj);

  // BottomsheetItemModel bottomsheetItemModelObj;

  // var controller = Get.find<BottomSheetController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 30,
          width: 30,
          shape: IconButtonShape.CircleBorder15,
          child: CustomImageView(
            imagePath: ImageConstant.imgHotelicon,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 12,
            top: 4,
            bottom: 5,
          ),
          child:  Text(
             "AAAA",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratRegular16Black900,
            ),

        ),
        Spacer(),
        CustomIconButton(
          height: 30,
          width: 30,
          variant: IconButtonVariant.OutlineIndigo300,
          child: CustomImageView(
            svgPath: ImageConstant.imgMinus,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 10,
            top: 4,
            bottom: 3,
          ),
          child:  Text(
               "1",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratMedium18,
            ),

        ),
        CustomIconButton(
          height: 30,
          width: 30,
          margin: getMargin(
            left: 13,
          ),
          variant: IconButtonVariant.OutlineIndigo900,
          child: CustomImageView(
            svgPath: ImageConstant.imgPlus,
          ),
        ),
      ],
    );
  }
}

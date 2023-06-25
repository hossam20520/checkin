import '../controller/bottom_sheet_controller.dart';
import '../models/bottomsheet_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AdultItemWidget extends StatelessWidget {
  // BottomsheetItemWidget(this.bottomsheetItemModelObj);

  // BottomsheetItemModel bottomsheetItemModelObj;
  BottomSheetController controller = Get.put(BottomSheetController());
  // var controller = Get.find<BottomSheetController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        CustomImageView(
          height: 50,
          width: 50,
          imagePath: ImageConstant.adulticon,

        ),

        Padding(
          padding: getPadding(
            left: 12,
            right: 5,
            top: 4,
            bottom: 5,
          ),
          child:  Text(
             "adults".tr,
              overflow: TextOverflow.ellipsis,

              style: AppStyle.txtMontserratRegular16Black900,
            ),

        ),
        Spacer(),
        CustomIconButton(
          onTap: controller.DecreaseFunAdults,
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
            right: 10,
            bottom: 3,
          ),
          child: Obx(() =>  Text(
            controller.bottomSheetModelObj.value.adults.toString(),
            overflow: TextOverflow.ellipsis,

            style: AppStyle.txtMontserratMedium18,
          ))


        ),
        CustomIconButton(
          onTap: controller.increaseFunAdults,
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

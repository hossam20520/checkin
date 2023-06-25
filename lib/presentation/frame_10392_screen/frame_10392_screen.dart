import '../frame_10392_screen/widgets/list988581417wxhone_item_widget.dart';
import 'controller/frame_10392_controller.dart';
import 'models/list988581417wxhone_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Frame10392Screen extends GetWidget<Frame10392Controller> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Obx(
          () => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: getVerticalSize(
                  64,
                ),
              );
            },
            itemCount: controller.frame10392ModelObj.value
                .list988581417wxhoneItemList.value.length,
            itemBuilder: (context, index) {
              List988581417wxhoneItemModel model = controller.frame10392ModelObj
                  .value.list988581417wxhoneItemList.value[index];
              return List988581417wxhoneItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }
}

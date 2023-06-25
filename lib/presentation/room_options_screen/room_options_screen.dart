import '../room_options_screen/widgets/roomoptions_item_widget.dart';
import 'controller/room_options_controller.dart';
import 'models/roomoptions_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RoomOptionsScreen extends GetWidget<RoomOptionsController> {
  @override
  Widget build(BuildContext context) {
    final parameter = Get.arguments;
    // controller.hotelModelObj.value.parama.value  = parameter;
    Get.find<RoomOptionsController>().roomOptionsModelObj.value.parama.value = parameter;

    return   Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(

                height: getVerticalSize(50),
                leadingWidth: 40,
                leading: IconButton(onPressed: ()=> Get.back(),  icon: Icon(Icons.chevron_left , size: 35,), ) ,
                title: AppbarSubtitle(
                    text: "lbl_room_options".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
        extendBodyBehindAppBar: true,
            body: Padding(
                padding: getPadding(left: 8, top: 24, right: 8),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: controller.roomOptionsModelObj.value
                        .roomoptionsItemList.value.length,
                    itemBuilder: (context, index) {
                      RoomoptionsItemModel model = controller
                          .roomOptionsModelObj
                          .value
                          .roomoptionsItemList
                          .value[index];
                      return RoomoptionsItemWidget(model, onTapRowwxh: () {
                        onTapRowwxh(model);
                      });
                    }))));
  }

  onTapRowwxh(ite) {
    Get.toNamed(AppRoutes.roomOneScreen,
  arguments:  ite.id.toString() ,
    );
  }

  onTapArrowleft10() {
    Get.back();
  }
}

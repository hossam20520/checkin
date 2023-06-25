import '../requests_screen/widgets/requests_item_widget.dart';
import 'controller/requests_controller.dart';
import 'models/requests_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

class RequestsScreen extends GetWidget<RequestsController> {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String argumant = Get.arguments;
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(78),
                leadingWidth: 40,
                leading: IconButton(
                  onPressed:()=> Get.back(), icon: Icon(Icons.chevron_left , size: 35,),
                )   ,
                title: AppbarSubtitle(
                    text: argumant.toString(),
                    margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Padding(
                padding: getPadding(left: 36, top: 32, right: 35),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(12));
                    },
                    itemCount: controller
                        .requestsModelObj.value.requestsItemList.value.length,
                    itemBuilder: (context, index) {
                      RequestsItemModel model = controller
                          .requestsModelObj.value.requestsItemList.value[index];
                      return RequestsItemWidget(model , index);
                    })))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft5() {
    Get.back();
  }
}

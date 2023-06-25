import 'package:checkin/presentation/notifications_screen/widgets/notification_item.dart';

import '../skip/skip.dart';
import 'controller/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

import 'models/NotificatonItem.dart';

class NotificationsScreen extends GetWidget<NotificationsController> {
  // const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetcheNotificationItems();
    String isLogged = Get.find<PrefUtils>().getIslogged();
    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 35,
                leading: IconButton(onPressed: ()=> Get.back() , icon: Icon(Icons.chevron_left , size: 35,),),
                title: AppbarSubtitle(
                    text: "lbl_notifications".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body:

            isLogged == "yes" ?

            Container(
                width: double.maxFinite,
                padding: getPadding(top: 32, bottom: 32),
                child:  Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: controller.notificationsModelObj.value
                        .notificationitem.value.length,
                    itemBuilder: (context, index) {

                      NotificatonItem model = controller
                          .notificationsModelObj
                          .value
                          .notificationitem
                          .value[index];
                      return NotificationWidget(model, onTapColumn: () {
                        onTapColumn(model);
                      });
                    })),




            ) :
            SkipWidget()
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft() {
    Get.back();
  }

  void onTapColumn(NotificatonItem model) {}
}

import '../controller/notifications_controller.dart';
import '../models/NotificatonItem.dart';

import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationWidget extends StatelessWidget {
  NotificationWidget(this.notiModel, {this.onTapColumn});

  NotificatonItem notiModel;

  var controller = Get.find<NotificationsController>();

  VoidCallback? onTapColumn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Container(
            width: double.maxFinite,
            padding: getPadding(
                left: 26, top: 7, right: 26, bottom: 7),
            decoration: AppDecoration.fillGray50,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: getSize(10),
                            width: getSize(10),
                            margin:
                            getMargin(top: 3, bottom: 6),
                            decoration: BoxDecoration(
                                color: ColorConstant.black900,
                                borderRadius:
                                BorderRadius.circular(
                                    getHorizontalSize(
                                        5)))),
                        Padding(
                            padding: getPadding(left: 14),
                            child: Text( notiModel.title.toString(),
                                overflow:
                                TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtMontserratMedium16))
                      ]),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: getHorizontalSize(303),
                          margin: getMargin(
                              left: 25,
                              top: 10,
                              right: 12,
                              bottom: 7),
                          child: Text(
                              notiModel.message.toString(),
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle
                                  .txtMontserratLight12Bluegray30001)))
                ])));
  }
}

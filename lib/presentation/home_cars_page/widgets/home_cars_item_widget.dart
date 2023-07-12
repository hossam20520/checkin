import '../controller/home_cars_controller.dart';
import '../models/home_cars_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';

// ignore: must_be_immutable
class HomeCarsItemWidget extends StatelessWidget {
  HomeCarsItemWidget(this.homeCarsItemModelObj);

  HomeCarsItemModel homeCarsItemModelObj;

  var controller = Get.find<HomeCarsController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Obx(() => InkWell(
              onTap: () => openCar(homeCarsItemModelObj.id),
              child: Container(
                width: 350,
                margin: getMargin(
                  right: 12,
                ),
                padding: getPadding(
                  top: 8,
                  right: 12,
                  bottom: 8,
                ),
                decoration: AppDecoration.outlineIndigo50.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder11,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomImageView(
                      fit: BoxFit.cover,
                      url: homeCarsItemModelObj.image.toString(),
                      height: getVerticalSize(
                        100,
                      ),
                      width: getHorizontalSize(
                        168,
                      ),
                      radius: BorderRadius.only(
                        topLeft: Radius.circular(
                          getHorizontalSize(
                            10,
                          ),
                        ),
                        topRight: Radius.circular(
                          getHorizontalSize(
                            10,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      margin: getMargin(
                        top: 13,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 0,
                          ),
                          child: Obx(
                            () => Text(
                              homeCarsItemModelObj.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.txtMontserratMedium1827,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: getVerticalSize(
                            29,
                          ),
                          width: getHorizontalSize(
                            67,
                          ),
                          margin: getMargin(),
                          child: Text(
                            homeCarsItemModelObj.carType.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.txtMontserratLight1279,
                          ),
                        ),
                        Padding(
                            padding: getPadding(
                              left: 10,
                            ),
                            child: Column(
                              children: [
                                Obx(
                                  () => Text(
                                    homeCarsItemModelObj.price.toString() +
                                        " " +
                                        homeCarsItemModelObj.coin.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtMontserratSemiBold14,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    bottom: 0,
                                  ),
                                  child: Text(
                                    "lbl_per_day".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratLight11,
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  void openCar(model) {
    Get.toNamed(AppRoutes.carScreen, arguments: model);
  }
}

import '../controller/room_options_controller.dart';
import '../models/roomoptions_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoomoptionsItemWidget extends StatelessWidget {
  RoomoptionsItemWidget(this.roomoptionsItemModelObj, {this.onTapRowwxh});

  RoomoptionsItemModel roomoptionsItemModelObj;

  var controller = Get.find<RoomOptionsController>();

  VoidCallback? onTapRowwxh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowwxh?.call();
      },
      child: Container(
        padding: getPadding(
          top: 11,
          bottom: 11,
        ),
        decoration: AppDecoration.outlineIndigo50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder11,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Padding(
        padding: getPadding(
         right: 10,
          left: 10

        ),

        child:
            CustomImageView(
              fit: BoxFit.cover,
              url: roomoptionsItemModelObj.image.toString(),
              height: getVerticalSize(
                102,
              ),
              width: getHorizontalSize(
                140,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  11,
                ),
              ),
            )),
            Padding(
              padding: getPadding(
                top: 10,

                bottom: 11,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Obx(
                    () => Text(

                      roomoptionsItemModelObj.title.toString(),
                      overflow: TextOverflow.ellipsis,

                      style: AppStyle.txtMontserratRegular14Black900,

                    ),
                  ),

                  Padding(
                    padding: getPadding(
                      top: 13,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    roomoptionsItemModelObj.bed.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratLight12,
                                  ),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCurrentlocationicon,
                                    height: getSize(
                                      15,
                                    ),
                                    width: getSize(
                                      15,
                                    ),
                                    margin: getMargin(
                                      left: 4,
                                      right: 6
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 7,
                                  right: 10
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "lbl_price_for".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtMontserratLight12,
                                    ),



                                    CustomImageView(
                                      svgPath: ImageConstant.imgUserIndigo300,
                                      height: getSize(
                                        15,
                                      ),
                                      width: getSize(
                                        15,
                                      ),
                                      margin: getMargin(
                                          left: 4,
                                          right: 4
                                      ),
                                    )




                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),




                        Padding(
                          padding: getPadding(

                            top: 12,
                            right: 10
                          ),
                          child:  Row(
                            children: [



                              Column(

                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx( () => Text(
                                    roomoptionsItemModelObj.price.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratSemiBold14,
                                  ),
                                  ),

                                  Text(
                                    "lbl_per_night".tr,
                                    overflow: TextOverflow.ellipsis,

                                    style: AppStyle.txtMontserratLight11,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

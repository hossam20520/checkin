import 'package:checkin/presentation/bottom_sheet_bottomsheet/widgets/Adult_item_widget.dart';
import 'package:checkin/presentation/bottom_sheet_bottomsheet/widgets/Child_item_widget.dart';
import 'package:checkin/presentation/bottom_sheet_bottomsheet/widgets/Room_item_widget.dart';

import '../bottom_sheet_bottomsheet/widgets/bottomsheet_item_widget.dart';
import 'controller/bottom_sheet_controller.dart';
import 'models/bottomsheet_item_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';

class BottomSheetBottomsheet extends StatelessWidget {
  BottomSheetBottomsheet(this.controller);

  BottomSheetController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder19,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgRectangle,
                height: getVerticalSize(
                  5,
                ),
                width: getHorizontalSize(
                  48,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    2,
                  ),
                ),
                margin: getMargin(
                  top: 12,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 29,
                    top: 25,
                  ),
                  child: Text(
                    "msg_select_rooms_and".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratSemiBold24Black900,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 29,
                  top: 29,
                  right: 29,
                ),
                child:  Column(
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 24.0,
                          bottom: 24.0,
                        ),
                        child: SizedBox(
                          width: getHorizontalSize(
                            334,
                          ),
                          child: Divider(
                            height: getVerticalSize(
                              1,
                            ),
                            thickness: getVerticalSize(
                              1,
                            ),
                            color: ColorConstant.indigo50,
                          ),
                        ),
                      ),



                      RoomItemWidget(),

                      Padding(
                        padding: getPadding(
                          top: 24.0,
                          bottom: 24.0,
                        ),
                        child: SizedBox(
                          width: getHorizontalSize(
                            334,
                          ),
                          child: Divider(
                            height: getVerticalSize(
                              1,
                            ),
                            thickness: getVerticalSize(
                              1,
                            ),
                            color: ColorConstant.indigo50,
                          ),
                        ),
                      ),
                      AdultItemWidget(),

                      Padding(
                        padding: getPadding(
                          top: 24.0,
                          bottom: 24.0,
                        ),
                        child: SizedBox(
                          width: getHorizontalSize(
                            334,
                          ),
                          child: Divider(
                            height: getVerticalSize(
                              1,
                            ),
                            thickness: getVerticalSize(
                              1,
                            ),
                            color: ColorConstant.indigo50,
                          ),
                        ),
                      ),

                      ChildItemWidget(),


                    ],
                  ),





              ),
              Container(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 48,
                  ),
                  padding: getPadding(
                    left: 26,
                    top: 32,
                    right: 26,
                    bottom: 32,
                  ),
                  decoration: AppDecoration.outlineBlack90019,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        onTap: controller.apply,
                        height: getVerticalSize(
                          62,
                        ),
                        text: "lbl_apply".tr,
                        variant: ButtonVariant.Primary,
                        padding: ButtonPadding.PaddingAll18,
                        fontStyle: ButtonFontStyle.MontserratSemiBold20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

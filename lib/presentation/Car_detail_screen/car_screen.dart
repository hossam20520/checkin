import 'package:checkin/presentation/Car_detail_screen/wedgets/facilitie_car_item_widget.dart';

import '../room_one_screen/models/facilities_item.dart';
import '../room_one_screen/widgets/facilitie_item_widget.dart';
import 'controller/car_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_icon_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'models/FacilitesITesmModel.dart';

class CarScreen extends GetWidget<CarController> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 18, top: 22, right: 18, bottom: 22),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(305),
                              width: getHorizontalSize(336),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                   Obx(() =>    CustomImageView(
                                         url: controller.roomModelObj.value.image.toString(),
                                        height: getVerticalSize(293),
                                        width: getHorizontalSize(329),
                                        alignment: Alignment.center) ),
                                    CustomIconButton(
                                        height: 35,
                                        width: 35,
                                        variant: IconButtonVariant.FillBlack900,
                                        shape: IconButtonShape.RoundedBorder17,
                                        padding: IconButtonPadding.PaddingAll10,
                                        alignment: Alignment.topLeft,
                                        onTap: () {
                                          onTapBtnArrowleft();
                                        },
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowleftWhiteA700))
                                  ]))),
                      Padding(
                          padding: getPadding(top: 41),
                          child: Obx(()=>  Text( controller.roomModelObj.value.title.toString()  ,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold24Black900))),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(()=>  Text(  controller.roomModelObj.value.carType.toString() ,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtMontserratRegular1272)),

                                    ]),
                                Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                         Obx(()=>   Text( controller.roomModelObj.value.price.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratSemiBold1781)),
                                          Text("lbl_per_day".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtMontserratLight1399)
                                        ]))
                              ])),
                      Padding(
                          padding: getPadding(top: 31),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text("lbl_car_details".tr,
                              overflow: TextOverflow.ellipsis,

                              style: AppStyle.txtMontserratMedium18Black90002) ,

                      SizedBox(height: 20,),
                      Padding(
                                padding: getPadding(left: 19, top: 12),
                                child: Obx(() => Wrap(
                                    runSpacing: getVerticalSize(5),
                                    spacing: getHorizontalSize(5),
                                    children:    List<Widget>.generate(
                                        controller.roomModelObj
                                            .value
                                            .facilities
                                            .value
                                            .length, (index) {
                                      FacilitesItems model = controller.roomModelObj.value.facilities.value[index];

                                      return FaceliteCarItemWidget(model);
                                    }))))
                          ],),
                      )




                    ],
                      )
            ),
            bottomNavigationBar: Container(
                margin: getMargin(left: 26, right: 26, bottom: 70),
                decoration: AppDecoration.outlineBlack90019,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_reserve".tr,
                          onTap: () {
                            onTapReserve();
                          })
                    ])));
  }

  onTapBtnArrowleft() {
    Get.back();
  }

  onTapReserve() {
    Get.toNamed(
      AppRoutes.paymentOneScreen,
    );
  }
}

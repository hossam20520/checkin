import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_hotels_container_page/models/HotelsItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/home_hotels_container_controller.dart';

class Hotels extends StatelessWidget {
  Hotels(this.HotelsItemModelObj);

  //
  HotelsItemModel HotelsItemModelObj;

  //
  var controller = Get.find<HomeHotelsContainerController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: () => GoToHotel(HotelsItemModelObj.id),
        child: Container(
            margin: getMargin(left: 13),
            decoration: AppDecoration.outlineIndigo50
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                      fit: BoxFit.cover,
                      url: HotelsItemModelObj.image.toString(),
                      height: getVerticalSize(171),
                      width: getHorizontalSize(189),
                      radius: BorderRadius.only(
                          topLeft: Radius.circular(getHorizontalSize(12)),
                          topRight: Radius.circular(getHorizontalSize(12)))),
                  Column(
                    children: [
                      Container(
                          width: getHorizontalSize(176),
                          margin: getMargin(right: 3, left: 3, top: 19),
                          child: Text(HotelsItemModelObj.title.toString(),
                              maxLines: null,
                              style: AppStyle.txtMontserratRegular1313)),

                      Container(
                          width: getHorizontalSize(176),
                          margin: getMargin(right: 3, left: 3, top: 8),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSignal,
                                height: getSize(9),
                                width: getSize(9)),
                            Padding(
                                padding: getPadding(left: 4),
                                child: Text(
                                    HotelsItemModelObj.country.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtMontserratLight1094))
                          ])),




                      Container(
                          width: getHorizontalSize(176),
                          margin: getMargin(right: 3, left: 3, top: 8 , bottom: 8),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: getHorizontalSize(42),
                                    margin: getMargin(top: 2, bottom: 2),
                                    padding: getPadding(
                                        left: 6, top: 3, right: 6, bottom: 5),
                                    decoration: AppDecoration.fillIndigo700
                                        .copyWith(
                                        borderRadius:
                                        BorderRadiusStyle.roundedBorder4),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgStar,
                                              height: getSize(10),
                                              width: getSize(10)),
                                          Padding(
                                              padding: getPadding(
                                                  left: 4, top: 1, bottom: 1),
                                              child: Text(HotelsItemModelObj.rate.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .txtMontserratRegular1018))
                                        ])),
                                Padding(
                                    padding: getPadding(left: 0),
                                    child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(HotelsItemModelObj.price.toString(),
                                              overflow: TextOverflow.ellipsis,

                                              style: AppStyle
                                                  .txtMontserratSemiBold1313),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Padding(
                                              padding: getPadding(top: 0),
                                              child: Text( HotelsItemModelObj.coin.toString(),
                                                  overflow: TextOverflow.ellipsis,

                                                  style: AppStyle
                                                      .txtMontserratSemiBold1313))
                                        ]))
                              ])),




                    ],
                  ),







                ]))));
  }

  void GoToHotel(model) {
    Get.toNamed(
      AppRoutes.hotelScreen,
      arguments: model.toString(),
    );
  }
}

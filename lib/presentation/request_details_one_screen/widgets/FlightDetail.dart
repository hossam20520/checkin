import '../../home_hotels_container_page/models/HotelsItemModel.dart';

import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';

import '../controller/request_details_one_controller.dart';

// ignore: must_be_immutable
class FlightItemWedget extends StatelessWidget {
  // FlightItemWedget(
  //     this.savedItemModelObj, {
  //       Key? key,
  //     }) : super(
  //   key: key,
  // );

  // HotelsItemModel savedItemModelObj;

  // var controller = Get.find<SavedController>();
  var controller = Get.find<RequestDetailsOneController>();
  // final id = Get.find<RequestDetailsOneController>().requestDetailsOneModelObj.value.id;
  final id = Get.find<RequestDetailsOneController>().requestDetailsOneModelObj.value.flightDataModelDetail.value.flightId;


  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Padding(padding: getPadding(left: 27, top: 21),
          child: Text("lbl_flight_details".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratSemiBold16)),
      SizedBox(
          width: double.maxFinite,
          child: Container(
              margin: getMargin(top: 17),
              padding: getPadding(
                  left: 27, top: 10, right: 27, bottom: 10),
              decoration: AppDecoration.fillGray50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: getPadding(top: 11, bottom: 2),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("from_tr".tr,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratLight16),
                              Text( controller.requestDetailsOneModelObj.value.flightDataModelDetail.value.from.toString(),
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratRegular16)
                            ])),
                    Padding(
                        padding: getPadding(top: 11, bottom: 2),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("lbl_to".tr,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratLight16),
                              Text(controller.requestDetailsOneModelObj.value.flightDataModelDetail.value.to.toString(),
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratRegular16)
                            ]))
                  ])))
    ],);
  }



}

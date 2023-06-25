import 'package:checkin/presentation/request_details_one_screen/controller/request_details_one_controller.dart';

import '../../home_hotels_container_page/models/HotelsItemModel.dart';

import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';

// ignore: must_be_immutable
class CarItemWedget extends StatelessWidget {
  // HotelItemWedget(
  //     this.savedItemModelObj, {
  //       Key? key,
  //     }) : super(
  //   key: key,
  // );

  // HotelsItemModel savedItemModelObj;

  var controller = Get.find<RequestDetailsOneController>();
  // final id = Get.find<RequestDetailsOneController>().requestDetailsOneModelObj.value.id;
  final id = Get.find<RequestDetailsOneController>().requestDetailsOneModelObj.value.carDataModel.value.carID;
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Padding(padding: getPadding(left: 27, top: 21),
          child: Text("lbl_Cars_details".tr,
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


                              Text("carName".tr,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratLight16),
                              Text( controller.requestDetailsOneModelObj.value.carDataModel.value.name.toString(),
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratRegular16)
                            ])),

                    SizedBox(height: 10,),
                    Padding(
                        padding: getPadding(top: 11, bottom: 2),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("pickUpData".tr,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratLight16),
                              Text(controller.requestDetailsOneModelObj.value.carDataModel.value.pickup.toString(),
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratRegular16)
                            ])),
                    SizedBox(height: 10,),
                    Padding(
                        padding: getPadding(top: 11, bottom: 2),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("dropOffDate".tr,
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratLight16),

                              Text( controller.requestDetailsOneModelObj.value.carDataModel.value.dropoff.toString(),
                                  overflow:
                                  TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtMontserratRegular16)
                            ])),

                    SizedBox(height: 10,),
                    Padding(
                        padding: getPadding(top: 11, bottom: 2),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                         Text( "DetailInof".tr,
                                   overflow:
                                   TextOverflow.ellipsis,
                                   textAlign: TextAlign.left,
                                   style: AppStyle
                                       .txtMontserratLight16),


                              InkWell(
                                  onTap: ()=> Get.toNamed(AppRoutes.carScreen , arguments: id.toString() ),
                                  child: Container(
                            width: 180,
                            child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [


                                 Padding(padding:  getPadding(right: 10, left: 10),
                                   child:
                                   Text("Show_detail".tr ,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .bottomTextBlack
                                  ), ),
                                  IconButton(onPressed: ()=>  GoToHotel(), icon: Icon(Icons.remove_red_eye_outlined))
                                            ], )
                             ,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.amber700,
                            ),
                          ))



                            ])),

                  ])))
    ],);
  }

void GoToHotel(){

}

}

import '../controller/home_flights_controller.dart';
import '../models/cards_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardsItemWidget extends StatelessWidget {
  CardsItemWidget(this.cardsItemModelObj);

  CardsItemModel cardsItemModelObj;

  var controller = Get.find<HomeFlightsController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: getPadding(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                fit: BoxFit.cover,
                 url: cardsItemModelObj.image.toString() ,
                height: getVerticalSize(
                  145,
                ),
                width: getHorizontalSize(
                  338,
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
              ),
              Container(
                width: getHorizontalSize(
                  338,
                ),
                padding: getPadding(
                  left: 10,
                  top: 9,
                  right: 10,
                  bottom: 9,
                ),
                decoration: AppDecoration.outlineIndigo502,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx( () => Text(
                        cardsItemModelObj.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium1827,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 17,
                        right: 7,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: getMargin(
                              bottom: 1,
                            ),
                            color: ColorConstant.indigo50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder15,
                            ),
                            child: Container(
                              height: getSize(
                                30,
                              ),
                              width: getSize(
                                30,
                              ),
                              padding: getPadding(
                                left: 3,
                                top: 7,
                                right: 3,
                                bottom: 7,
                              ),
                              decoration: AppDecoration.fillIndigo50.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder15,
                              ),
                              child: Stack(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgWizzairlogo1,
                                    height: getVerticalSize(
                                      15,
                                    ),
                                    width: getHorizontalSize(
                                      22,
                                    ),
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ],
                              ),
                            ),
                          ),
                       SizedBox(width: 5,),
                          Padding(
                            padding: getPadding(
                              left: 7,

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    cardsItemModelObj.departure_date.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratRegular1279,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 2,
                                  ),
                                  child: Obx(
                                    () => Text(
                                      cardsItemModelObj.airportFrom.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtMontserratLight914,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 15,
                        right: 7,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: getMargin(
                              bottom: 1,
                            ),
                            color: ColorConstant.indigo50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder15,
                            ),
                            child: Container(
                              height: getSize(
                                30,
                              ),
                              width: getSize(
                                30,
                              ),
                              padding: getPadding(
                                left: 3,
                                top: 7,
                                right: 3,
                                bottom: 7,
                              ),
                              decoration: AppDecoration.fillIndigo50.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder15,
                              ),
                              child: Stack(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgWizzairlogo1,
                                    height: getVerticalSize(
                                      15,
                                    ),
                                    width: getHorizontalSize(
                                      22,
                                    ),
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 7,
                              top: 1,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    cardsItemModelObj.return_date.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratRegular1279,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 1,
                                  ),
                                  child: Text(
                                    cardsItemModelObj.airportTo.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratLight914,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: getPadding(
                          //     left: 76,
                          //     top: 7,
                          //     bottom: 9,
                          //   ),
                          //   child: Text(
                          //     "lbl_direct".tr,
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.left,
                          //     style: AppStyle.txtMontserratLight1096,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 20,
                        right: 7,
                        bottom: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
     InkWell(
                          onTap:()=>  Get.toNamed(
                            AppRoutes.paymentTwoScreen,
                            arguments: cardsItemModelObj.id.toString()
                          ),
                    child:Container(
                            width: getHorizontalSize(
                              114,
                            ),
                            padding: getPadding(
                              left: 35,
                              top: 10,

                              bottom: 10,
                            ),
                            decoration: AppDecoration.fillIndigo900.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11,
                            ),
                            child: Text(
                              "lbl_select".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                              AppStyle.txtMontserratRegular14WhiteA700,
                            ),
                          ),
                          ) ,

                          SizedBox(width: 80,),

                          Text(
                            cardsItemModelObj.price.toString() + "ORM".tr ,
                            overflow: TextOverflow.ellipsis,

                            style: AppStyle.txtMontserratSemiBold16,
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
      ),
    );
  }
}

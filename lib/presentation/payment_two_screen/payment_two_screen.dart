import '../payment_two_screen/widgets/paymenttwo_item_widget.dart';
import 'controller/payment_two_controller.dart';
import 'models/paymenttwo_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentTwoScreen extends GetWidget<PaymentTwoController> {
  @override
  Widget build(BuildContext context) {
    String isLogged = Get.find<PrefUtils>().getIslogged();
    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(60),
                leadingWidth: 40,
                leading: IconButton( padding:EdgeInsets.only(left: 10) , iconSize: 40, icon: Icon(Icons.chevron_left), onPressed: () { Get.back();}, ) ,
                title: AppbarSubtitle(
                    text: "lbl_payment".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 24, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(left: 8, right: 8),
                          padding: getPadding(
                              left: 11, top: 18, right: 11, bottom: 18),
                          decoration: AppDecoration.outlineIndigo50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder11),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Obx(()=>  Text( controller.paymentTwoModelObj.value.title.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratMedium1827 )),
                                Padding(
                                    padding: getPadding(top: 25, bottom: 4),
                                    child:   Column(
                                      children: [
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
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
                                                  alignment: Alignment.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                              ()=>  Text(
                                                controller.paymentTwoModelObj.value.from.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtMontserratRegular1279,
                                              )),

                                              Padding(
                                                padding: getPadding(
                                                  top: 2,
                                                ),
                                                child: Obx(
                                                      ()=>  Text(
                                                  controller.paymentTwoModelObj.value.airportFrom.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtMontserratLight914,
                                                ),  )
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),

                                      ],
                                    ),

                                      SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: EdgeInsets.all(0),
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
                                                alignment: Alignment.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 7,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                           Obx(()=> Text(
                                              controller.paymentTwoModelObj.value.to.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtMontserratRegular1279,
                                            )) ,

                                            Padding(
                                              padding: getPadding(
                                                top: 2,
                                              ),
                                              child:  Obx(()=>   Text(
                                                controller.paymentTwoModelObj.value.airportTo.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtMontserratLight914,
                                              )),

                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: getPadding(
                                          top: 7,
                                          bottom: 9,
                                        ),

                                      ),
                                    ],
                                  )
                                      ],
                                    )  )
                              ])),


                      Container(
                          height: getVerticalSize(136),
                          width: double.maxFinite,
                          margin: getMargin(top: 227),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: double.maxFinite,
                                    padding: getPadding(
                                        left: 35,
                                        top: 11,
                                        right: 35,
                                        bottom: 11),
                                    decoration: AppDecoration.fillIndigo50,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  top: 88, bottom: 2),
                                              child: Text("lbl_total".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratRegular18)),
                                          Padding(
                                              padding: getPadding(top: 87),
                                              child:  Obx(()=>  Text(     controller.paymentTwoModelObj.value.price.toString()  ,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtMontserratSemiBold20) )  )
                                        ]))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: getPadding(top: 14),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(
                                                  left: 35, right: 35),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("lbl_sub_total".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratLight16),
                                                   Obx(()=>  Text(controller.paymentTwoModelObj.value.price.toString() ,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratMedium16Indigo700))
                                                  ])),
                                          Padding(
                                              padding: getPadding(top: 7),
                                              child: Divider(
                                                  height: getVerticalSize(1),
                                                  thickness: getVerticalSize(1),
                                                  color: ColorConstant
                                                      .indigo30090))
                                        ]))),

                          ])),


                      isLogged == "yes" ?


                          Column(children: [


                      CustomButton(

                          height: getVerticalSize(62),
                          text: "lbl_reserve_now".tr,
                          margin: getMargin(
                              left: 27, top: 48, right: 26, bottom: 5),
                          onTap: ()=>  controller.pay("online") ),
                      CustomButton(

                          height: getVerticalSize(62),
                          text: "lbl_reserve_nowPay".tr,
                          margin: getMargin(
                              left: 27, top: 5, right: 26, bottom: 5),
                          onTap: ()=>  controller.pay("cash") )
                          ],)

                          :

                      CustomButton(
                          height: getVerticalSize(62),
                          margin: getMargin(
                          left: 27, top: 48, right: 26, bottom: 5),
                          text: "Login_First_To_Reserve".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.logInScreen);
                          })



                    ])));
  }

  onTapReservenow() {

    onTapReservenow() {
      // controller.pay();
      // Get.toNamed(
      //   AppRoutes.paymentWebScreen,
      //   arguments: "flight",
      // );
    }
    // Get.toNamed(
    //   AppRoutes.successOneScreen,
    // );
  }

  onTapArrowleft13() {
    Get.back();
  }
}

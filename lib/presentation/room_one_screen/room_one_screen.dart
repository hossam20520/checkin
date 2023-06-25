import 'package:checkin/presentation/room_one_screen/models/facilities_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';

import '../room_one_screen/widgets/facilitie_item_widget.dart';
import 'controller/room_one_controller.dart';
import 'models/chipviewframe12_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_drop_down.dart';
import 'package:checkin/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class RoomOneScreen extends GetWidget<RoomOneController> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    String isLogged = Get.find<PrefUtils>().getIslogged();
    final parameter = Get.arguments;

    Get.find<RoomOneController>().roomOneModelObj.value.parama.value = parameter;

    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(309),
                                  width: double.maxFinite,
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [


                                        Obx(() => Container(

                                          child: CarouselSlider(
                                            options: CarouselOptions(),
                                            carouselController: _controller,
                                            items: controller.roomOneModelObj.value.images.value
                                                .map((item) => Container(
                                              child: Center(child:  Image.network(item, fit: BoxFit.cover, width: 1000 , height: 1000,)  ),


                                            ))
                                                .toList(),
                                          ),
                                        )  ),



                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 25,
                                                    top: 22,
                                                    right: 25),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomIconButton(
                                                          height: 35,
                                                          width: 35,
                                                          variant:
                                                              IconButtonVariant
                                                                  .White,
                                                          shape: IconButtonShape
                                                              .RoundedBorder17,
                                                          padding:
                                                              IconButtonPadding
                                                                  .PaddingAll10,
                                                          onTap: () {
                                                            onTapBtnArrowleft();
                                                          },
                                                          child: CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowleftBlack900)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 78),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Card(
                                                                    clipBehavior:
                                                                        Clip
                                                                            .antiAlias,
                                                                    elevation:
                                                                        0,
                                                                    margin: EdgeInsets
                                                                        .all(0),
                                                                    color: ColorConstant
                                                                        .black900Cc,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadiusStyle.roundedBorder11),
                                                                    child: Container(
                                                                        height: getVerticalSize(30),
                                                                        width: getHorizontalSize(36),
                                                                        padding: getPadding(all: 10),
                                                                        decoration: AppDecoration.fillBlack900cc.copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
                                                                        child: Stack(children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgArrowleft,
                                                                              height: getVerticalSize(10),
                                                                              width: getHorizontalSize(16),
                                                                              alignment: Alignment.center)
                                                                        ]))),
                                                                Card(
                                                                    clipBehavior:
                                                                        Clip
                                                                            .antiAlias,
                                                                    elevation:
                                                                        0,
                                                                    margin: EdgeInsets
                                                                        .all(0),
                                                                    color: ColorConstant
                                                                        .black900Cc,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadiusStyle.roundedBorder11),
                                                                    child: Container(
                                                                        height: getVerticalSize(30),
                                                                        width: getHorizontalSize(36),
                                                                        padding: getPadding(all: 10),
                                                                        decoration: AppDecoration.fillBlack900cc.copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
                                                                        child: Stack(children: [
                                                                          CustomImageView(
                                                                              svgPath: ImageConstant.imgArrowright,
                                                                              height: getVerticalSize(10),
                                                                              width: getHorizontalSize(16),
                                                                              alignment: Alignment.center)
                                                                        ])))
                                                              ]))
                                                    ])))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 19, top: 10 , right: 10),
                                  child:Obx(()=> Text(  controller.roomOneModelObj.value.title.value.toString()   ,
                                      overflow: TextOverflow.ellipsis,

                                      style: AppStyle
                                          .txtMontserratSemiBold24Black900)) ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 19, top: 21, right: 19),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 5 , right: 5  ),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Obx(() =>    Padding(
                                                    padding: getPadding( left: 6, right: 5  ),
                                                child: Text(
                                                                    controller.roomOneModelObj.value.bed.value.toString()
                                                                        ,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtMontserratLight12)) ),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgCurrentlocationicon,
                                                                    height:
                                                                        getSize(
                                                                            15),
                                                                    width:
                                                                        getSize(
                                                                            15),
                                                                    margin: getMargin(
                                                                        left:
                                                                            4))
                                                              ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 7),
                                                          child: Row(children: [
                                                            Text(
                                                                "lbl_price_for"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtMontserratLight12),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgUserIndigo300,
                                                                height:
                                                                    getSize(15),
                                                                width:
                                                                    getSize(15),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            4)),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgUserIndigo300,
                                                                height:
                                                                    getSize(15),
                                                                width:
                                                                    getSize(15),
                                                                margin:
                                                                    getMargin(
                                                                        left:

                                                                            2))
                                                          ]))
                                                    ])),
                                            Padding(
                                                padding: getPadding(top: 2),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Obx(() =>  Text(
                                                          controller.roomOneModelObj.value.price.value.toString()+ " "+ "ORM".tr ,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratSemiBold18)),
                                                      Text("lbl_per_night".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratLight14)
                                                    ]))
                                          ]))),
                              // Padding(
                              //     padding: getPadding(left: 19, top: 28),
                              //     child: Text("msg_only_3_rooms_left".tr,
                              //         overflow: TextOverflow.ellipsis,
                              //         textAlign: TextAlign.left,
                              //         style: AppStyle
                              //             .txtMontserratLight12Black90002)),
                              // CustomDropDown(
                              //     focusNode: FocusNode(),
                              //     icon: Container(
                              //         margin: getMargin(left: 30, right: 40),
                              //         child: CustomImageView(
                              //             svgPath: ImageConstant.imgArrowdown)),
                              //     hintText: "lbl_select_rooms".tr,
                              //     margin:
                              //         getMargin(left: 19, top: 10, right: 19),
                              //     alignment: Alignment.center,
                              //     items: controller.roomOneModelObj.value
                              //         .dropdownItemList.value,
                              //     onChanged: (value) {
                              //       controller.onSelected(value);
                              //     }),
                              Padding(
                                  padding: getPadding(left: 19, top: 32 , right: 10),
                                  child: Text("lbl_description".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtMontserratMedium18Black90002)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Obx(()=> Container(
                                      width: getHorizontalSize(346),
                                      margin: getMargin(
                                          left: 19, top: 13, right: 27),
                                      child:  Html(
                                        data: controller.roomOneModelObj.value.description.value,

                                      ),

                                  )) ),
                              Padding(
                                  padding: getPadding(left: 19, top: 29 , right: 10),
                                  child: Text("lbl_facilities".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtMontserratMedium18Black90002)),
                              Padding(
                                  padding: getPadding(left: 19, top: 12 , right: 15),
                                  child: Obx(() => Wrap(
                                      runSpacing: getVerticalSize(5),
                                      spacing: getHorizontalSize(5),
                                      children:    List<Widget>.generate(
                                          controller.roomOneModelObj
                                              .value
                                              .facilitesITems
                                              .value
                                              .length, (index) {
                                        FacilitesItem model = controller.roomOneModelObj.value.facilitesITems.value[index];

                                        return FaceliteItemWidget(model);
                                      }))))
                            ])))),
            bottomNavigationBar: Container(
                margin: getMargin(left: 26, right: 26, bottom: 60),
                decoration: AppDecoration.outlineBlack90019,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


            
                 isLogged == "yes" ?
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_reserve".tr,
                          onTap: () {
                            onTapReserve();
                          }) :

                 CustomButton(
                     height: getVerticalSize(62),
                     text: "Login_First_To_Reserve".tr,
                     onTap: () {
                      Get.toNamed(AppRoutes.logInScreen);
                     }) 
                    ])));
  }

  onTapBtnArrowleft() {
    Get.back();
  }

  onTapReserve() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }
}

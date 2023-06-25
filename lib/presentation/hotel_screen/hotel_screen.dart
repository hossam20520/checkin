import 'package:flutter/services.dart';

import '../hotel_screen/widgets/chipviewframe10_item_widget.dart';
import 'controller/hotel_controller.dart';
import 'models/chipviewframe10_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_iconbutton.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/style.dart';


class HotelScreen extends GetWidget<HotelController> {
  int _current = 0;

  final CarouselController _controller = CarouselController();


  @override
  Widget build(BuildContext context) {
    final List<String> imgList = controller.hotelModelObj.value.images.value;
    final parameter = Get.arguments;
    // controller.hotelModelObj.value.parama.value  = parameter;
    Get.find<HotelController>().hotelModelObj.value.parama.value = parameter;
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // controller.fetchHotelsItems();
    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          // height: getVerticalSize(309),

                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [

                               Obx(() => Container(

                                    child: CarouselSlider(
                                        options: CarouselOptions(),
                                       carouselController: _controller,
                                        items: controller.hotelModelObj.value.images.value
                                            .map((item) => Container(
                                          child: Center(child:  Image.network(item, fit: BoxFit.cover, width: 1000 , height: 1000,)  ),


                                        ))
                                            .toList(),
                                    ),
                                )  ),






                                // CustomImageView(
                                //     imagePath: ImageConstant.img988581417wxh3,
                                //     height: getVerticalSize(309),
                                //     width: getHorizontalSize(393),
                                //     radius: BorderRadius.only(
                                //         bottomRight:
                                //         Radius.circular(getHorizontalSize(49))),
                                //     alignment: Alignment.center),




                            Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                    padding: getPadding(
                                        left: 25, top: 22, right: 25),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [




                                          CustomAppBar(
                                              height: getVerticalSize(35),
                                              leadingWidth: 60,
                                              leading: AppbarIconbutton(
                                                  svgPath: ImageConstant
                                                      .imgArrowleftBlack900,
                                                  margin: getMargin(left: 25),
                                                  onTap: () {
                                                    onTapArrowleft8();
                                                  }),
                                              actions: [
                                                AppbarIconbutton(
                                                  onTap: ()=> controller.SaveFav(),
                                                    svgPath: ImageConstant
                                                        .imgFavorite,
                                                    margin: getMargin(
                                                        left: 25, right: 25))
                                              ]),



                                          Padding(
                                              padding: getPadding(top: 78),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [

                                                    Card(
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        elevation: 0,
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        color: ColorConstant
                                                            .black900Cc,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder11),
                                                        child: Container(
                                                            height:
                                                                getVerticalSize(
                                                                    30),
                                                            width:
                                                                getHorizontalSize(
                                                                    36),
                                                            padding: getPadding(
                                                                all: 10),
                                                            decoration: AppDecoration
                                                                .fillBlack900cc
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder11),
                                                            child: Stack(
                                                                children: [


                                                                  CustomImageView(
                                                                    onTap: () => _controller.nextPage(),
                                                                      svgPath: ImageConstant.imgArrowleft,
                                                                      height: getVerticalSize(10),
                                                                      width: getHorizontalSize(16),
                                                                      alignment: Alignment.center)
                                                                ]))),
                                                    Card(
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        elevation: 0,
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        color: ColorConstant
                                                            .black900Cc,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder11),
                                                        child: Container(
                                                            height:
                                                                getVerticalSize(
                                                                    30),
                                                            width:
                                                                getHorizontalSize(
                                                                    36),
                                                            padding: getPadding(
                                                                all: 10),
                                                            decoration: AppDecoration
                                                                .fillBlack900cc
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder11),
                                                            child: Stack(
                                                                children: [

                                                                  CustomImageView(
                                                                    onTap: ()=> _controller.previousPage(),
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgArrowright,
                                                                      height:
                                                                          getVerticalSize(
                                                                              10),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              16),
                                                                      alignment:
                                                                          Alignment
                                                                              .center)
                                                                ])))
                                                  ]))
                                        ])

                                )

                            )
                          ])),
                      Expanded(
                          child: SingleChildScrollView(
                              padding: getPadding(top: 16),
                              child: Padding(
                                  padding: getPadding(
                                      left: 19, right: 19, bottom: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(282),
                                            margin: getMargin(right: 5 , left: 5),
                                            child: Obx(()=> Text( controller.hotelModelObj.value.title.toString() , maxLines: null,


                                                style: AppStyle
                                                    .txtMontserratSemiBold24Black900)) ),
                                        Padding(
                                            padding: getPadding(top: 11),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgSignal,
                                                  height: getSize(11),
                                                  width: getSize(11),
                                                  margin: getMargin(
                                                      top: 6, bottom: 6)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 4,
                                                      top: 3,
                                                      bottom: 1),
                                                  child: Obx(()=> Text(

                                                      controller.hotelModelObj.value.country.toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratLight1515))),
                                              Spacer(),
                                              CustomButton(
                                                  height: getVerticalSize(24),
                                                  width: getHorizontalSize(64),
                                                  text: "lbl_4_5".tr,
                                                  variant: ButtonVariant
                                                      .FillIndigo700,
                                                  shape: ButtonShape
                                                      .RoundedBorder5,
                                                  padding:
                                                      ButtonPadding.PaddingT1,
                                                  fontStyle: ButtonFontStyle
                                                      .MontserratRegular1533,
                                                  prefixWidget: Container(
                                                      margin:
                                                          getMargin(right: 6),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgStar)))
                                            ])),
                                        Padding(
                                            padding: getPadding(top: 32),
                                            child: Text("lbl_description".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratMedium18Black90002)),
                                        Obx(() =>   Container(
                                            width: getHorizontalSize(346),
                                            margin:
                                                getMargin(top: 13, right: 8),
                                            child:  Html(
                                              data: controller.hotelModelObj.value.decsription.value,

                                            ),



                                        )),
                                        Padding(
                                            padding: getPadding(top: 31),
                                            child: Text(
                                                "lbl_location_on_map".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratMedium18Black90002)),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgMapofbirmingham,
                                            height: getVerticalSize(150),
                                            width: getHorizontalSize(355),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(11)),
                                            margin: getMargin(top: 11),
                                            onTap: () {
                                              onTapImgMapofbirmingham();
                                            }),
                                        SizedBox(height: 20,)

                                      ]))))
                    ])),
            bottomNavigationBar: Container(
                margin: getMargin(left: 26, right: 26, bottom: 70),
                decoration: AppDecoration.outlineBlack90019,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "msg_see_room_options".tr,
                          onTap: () {
                            onTapSeeroom();
                          })
                    ])));
  }

  onTapArrowleft8() {
    Get.back();
  }

  onTapImgMapofbirmingham() {
    openGoogleMaps(37.7749, -122.4194);
    // Get.toNamed(
    //   AppRoutes.hotelLocationScreen,
    // );
  }

  void openGoogleMaps(double latitude, double longitude) async {
    final urls = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    final Uri url = Uri.parse(urls);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch  ');
    }
  }

  onTapSeeroom() {



    Get.toNamed(
      AppRoutes.roomOptionsScreen,
      arguments: controller.hotelModelObj.value.id.toString() ,
    );
  }
}

import 'controller/about_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

class AboutUsScreen extends GetWidget<AboutUsController> {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(78),
                leadingWidth: 40,
                leading: IconButton(   onPressed: ()=> Get.back() , icon: Icon(Icons.chevron_left , size: 35,),),
                title: AppbarSubtitle(
                    text: "lbl_about_us".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, right: 26),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      CustomImageView(
                          imagePath: ImageConstant.imgLogo1,
                          height: getSize(74),
                          width: getSize(74)),
                      Padding(
                          padding: getPadding(top: 32),
                          child: Text("About_US".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold18)),
                     Obx(()=> Container(

                          width: getHorizontalSize(339),
                          margin: getMargin(top: 11, bottom: 5),
                          child: Text(  controller.aboutUsModelObj.value.about.toString() ,
                              maxLines: null,

                              style:
                                  AppStyle.txtMontserratRegular14Bluegray800)) )


                    ])   )));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft2() {
    Get.back();
  }
}

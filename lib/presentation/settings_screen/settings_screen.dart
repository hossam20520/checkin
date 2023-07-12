
import '../skip/skip.dart';
import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';

import 'models/NotificatonItem.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  // const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String isLogged = Get.find<PrefUtils>().getIslogged();
    return  Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 35,
                leading: IconButton(onPressed: ()=> Get.back() , icon: Icon(Icons.chevron_left , size: 35,),),
                title: AppbarSubtitle(
                    text: "Settings".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body:

            isLogged == "yes" ?

            Container(

              color: Colors.white,
                width: double.maxFinite,
                padding: getPadding(top: 32, bottom: 32 , right: 20 , left: 20 ),
              child:Column(

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Container(child:

                      Text(
                      "Device Setting".tr,
                      overflow: TextOverflow.ellipsis,
                        style: AppStyle.txtMontserratMedium18,


                    )
                      ,)
                  ],),


              InkWell(  onTap: ()=> Get.toNamed(AppRoutes.chooseLangScreen)   ,  child: Padding(
                padding: getPadding(
                  top: 20,
                  bottom: 20
                ),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                          Text(
                            "Language".tr,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.txtMontserratRegular16,


                          ) ,

                          Icon(Icons.chevron_right)



                    ],))),


                      // Padding(
                      // padding: getPadding(
                      //   top: 20,
                      //     bottom: 20
                      // ),
                      // child:Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //
                      //
                      //     Text(
                      //       "Currency".tr,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: AppStyle.txtMontserratRegular16,
                      //
                      //
                      //     ) ,
                      //
                      //     Icon(Icons.chevron_right)
                      //
                      //
                      //
                      //   ],)),

              InkWell(  onTap: ()=> Get.toNamed(AppRoutes.notificationsScreen)   ,  child: Padding(
                      padding: getPadding(
                        top: 20,
                          bottom: 20
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Text(
                            "Notification".tr,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.txtMontserratRegular16,


                          ) ,

                          Icon(Icons.chevron_right)



                        ],))),


              Padding(
                padding: getPadding(
                    top: 40,
                    bottom: 20
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                      child:
                      Text(
                        "lbl_about_us".tr,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.txtMontserratMedium18,
                      )
                        ,)
                    ],)),

              InkWell(  onTap: ()=> Get.toNamed(AppRoutes.aboutUsScreen)   ,  child: Padding(
                      padding: getPadding(
                          top: 20,
                          bottom: 20
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Text(
                            "Terms_condition".tr,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.txtMontserratRegular16,


                          ) ,






                        ],))),


                  InkWell(  onTap: ()=> Get.toNamed(AppRoutes.termsConditionsScreen)   ,  child: Padding(
                      padding: getPadding(
                          top: 20,
                          bottom: 20
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Text(
                            "lbl_about_us".tr,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.txtMontserratRegular16,


                          ) ,






                        ],))),


                ],) ,
              )




             :
            SkipWidget()
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft() {
    Get.back();
  }

  void onTapColumn(NotificatonItem model) {}
}

import 'package:logger/logger.dart';

import '../../domain/googleauth/google_auth_helper.dart';
import '../log_in_screen/controller/log_in_controller.dart';
import 'controller/side_menu_controller.dart';

// import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart' hide DrawerController;

class SideMenuDraweritem extends StatelessWidget {
  // SideMenuDraweritem(  this.controller ) ;

  // SideMenuController controller;

  @override
  Widget build(BuildContext context) {
    String isLogged = Get.find<PrefUtils>().getIslogged();
    double screenWidth = MediaQuery.of(context).size.width;
    double drawerWidthPercentage = 0.8; // 50% of the screen width
    double drawerWidth = screenWidth * drawerWidthPercentage;
    final avatar = Constants.imageAvatar + Get.find<PrefUtils>().getAvatar();
    final Name = Get.find<PrefUtils>().getName();
    final email = Get.find<PrefUtils>().getEmail();
    final isProvider = Get.find<PrefUtils>().getIsProvider();
    // final isProvider =  Get.find<LogInController>().logInModelObj.value.isProvider;

print(isProvider);
    return Drawer(
      width: drawerWidth,
      child: Container(
        width: getHorizontalSize(
          drawerWidth,
        ),
        decoration: AppDecoration.outlineBlack9000c,
        child: SingleChildScrollView(

            // scrollDirection: Axis.vertical,
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(
                261,
              ),
              width: getHorizontalSize(
                333,
              ),
              padding: getPadding(
                top: 39,
                bottom: 39,
              ),
              decoration: AppDecoration.primary,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: getPadding(
                        left: 5,
                        top: 4,
                        right: 5,
                        bottom: 4,
                      ),
                      decoration: AppDecoration.primary,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 108,
                            ),
                            child: Text(
                              Name.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold18,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Text(
                              email.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterMedium16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: getMargin(
                        top: 10,
                      ),
                      color: ColorConstant.whiteA700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusStyle.roundedBorder49,
                      ),
                      child: Container(
                        height: getSize(
                          99,
                        ),
                        width: getSize(
                          99,
                        ),
                        padding: getPadding(
                          all: 3,
                        ),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder49,
                        ),
                        child: Stack(
                          children: [
                            CustomImageView(
                              url: avatar,
                              height: getSize(
                                92,
                              ),
                              width: getSize(
                                92,
                              ),
                              radius: BorderRadius.circular(
                                getHorizontalSize(
                                  46,
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          InkWell( onTap: ()=>  Notification() ,    child:    Container(
              margin: getMargin(
                top: 12,
              ),
              padding: getPadding(
                left: 24,
                top: 10,
                right: 24,
                bottom: 10,
              ),
              decoration: AppDecoration.fillGray50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgNotificationIndigo300,
                    height: getSize(
                      20,
                    ),
                    width: getSize(
                      20,
                    ),
                    margin: getMargin(
                      top: 2,
                      bottom: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 2,
                      right: 10,
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_notifications".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular14Black90001,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  )
                ],
              ),
            ),),
            InkWell( onTap: ()=>  Settings() ,    child:    Container(
              margin: getMargin(
                top: 12,
              ),
              padding: getPadding(
                left: 24,
                top: 10,
                right: 24,
                bottom: 10,
              ),
              decoration: AppDecoration.fillGray50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(Icons.settings , color:ColorConstant.indigo300 ,),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 2,
                      right: 10,
                      bottom: 3,
                    ),
                    child: Text(
                      "Settins".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular14Black90001,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  )
                ],
              ),
            ),),


            isProvider == "true" ? InkWell(
              onTap: () => OpenServiceProvider(),
              child:    Container(
                margin: getMargin(
                  top: 12,
                ),
                padding: getPadding(
                  left: 24,
                  top: 10,
                  right: 24,
                  bottom: 10,
                ),
                decoration: AppDecoration.fillGray50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.bags,
                      height: getSize(
                        20,
                      ),
                      width: getSize(
                        20,
                      ),
                      margin: getMargin(
                        top: 2,
                        bottom: 2,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 16,
                        top: 2,
                        right: 10,
                        bottom: 3,
                      ),
                      child: Text(
                        "lbl_ServiceProvider".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRegular14Black90001,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.chevron_right,
                      size: 35,
                    )
                  ],
                ),
              ),
            ) :  SizedBox.shrink() ,


          InkWell(
            onTap: () => Get.toNamed(AppRoutes.chooseLangScreen , arguments: "logged"),
            child: Container(
              margin: getMargin(
                top: 12,
              ),
              padding: getPadding(
                left: 24,
                top: 10,
                right: 24,
                bottom: 10,
              ),
              decoration: AppDecoration.fillGray50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgSearchIndigo300,
                    height: getSize(
                      20,
                    ),
                    width: getSize(
                      20,
                    ),
                    margin: getMargin(
                      top: 2,
                      bottom: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 4,
                      right: 10,
                      bottom: 1,
                    ),
                    child: Text(
                      "lbl_language".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular14Black90001,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  )
                ],
              ),
            )),
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.contactUsScreen ),
            child: Container(
              margin: getMargin(
                top: 12,
              ),
              padding: getPadding(
                left: 24,
                top: 10,
                right: 24,
                bottom: 10,
              ),
              decoration: AppDecoration.fillGray50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgYoutube,
                    height: getSize(
                      20,
                    ),
                    width: getSize(
                      20,
                    ),
                    margin: getMargin(
                      top: 2,
                      bottom: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 3,
                      right: 10,
                      bottom: 2,
                    ),
                    child: Text(
                      "lbl_contact_us".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular14Black90001,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  )
                ],
              ),
            )),
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.aboutUsScreen ),
            child:  Container(
              margin: getMargin(
                top: 12,
              ),
              padding: getPadding(
                left: 24,
                top: 10,
                right: 24,
                bottom: 10,
              ),
              decoration: AppDecoration.fillGray50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomImageView(
                    svgPath: ImageConstant.imgQuestion,
                    height: getSize(
                      20,
                    ),
                    width: getSize(
                      20,
                    ),
                    margin: getMargin(
                      top: 2,
                      bottom: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 2,
                      right: 10,
                      bottom: 3,
                    ),
                    child: Text(
                      "lbl_about_us".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular14Black90001,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  )
                ],
              ),
            )),
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.termsConditionsScreen ),
            child:  Container(
              margin: getMargin(
                top: 12,
              ),
              padding: getPadding(
                left: 24,
                top: 10,
                right: 24,
                bottom: 10,
              ),
              decoration: AppDecoration.fillGray50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgWarning,
                    height: getSize(
                      20,
                    ),
                    width: getSize(
                      20,
                    ),
                    margin: getMargin(
                      top: 2,
                      bottom: 2,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                      top: 2,
                      right: 10,
                      bottom: 3,
                    ),
                    child: Text(
                      "msg_terms_conditions".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular14Black90001,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ],
              ),
            )),



          InkWell(
            onTap: () => Logout(),
            child:  Padding(
              padding: getPadding(
                top: 30,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgMinimizeRed900,
                    height: getVerticalSize(
                      16,
                    ),
                    width: getHorizontalSize(
                      17,
                    ),
                    margin: getMargin(
                      bottom: 3,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 17,
                      right: 10
                    ),
                    child: Text(
                      isLogged == "yes" ?
                      "lbl_log_out".tr : "Login".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular154,
                    ),
                  ),
                ],
              ),
            )),
          ],
        )),
      ),
    );
  }
Notification(){
  Get.back();
  Get.toNamed(AppRoutes.notificationsScreen);

}

  Settings(){
    Get.back();
    Get.toNamed(AppRoutes.settings);

  }


Logout(){

    GoogleAuthHelper().googleSignOutProcess();
    Get.find<PrefUtils>().clearPreferencesData();
    Get.offAllNamed(AppRoutes.logInScreen);
}
  OpenServiceProvider() {
    Get.back();
    Get.toNamed(AppRoutes.serviceProviderScreen);
  }
}

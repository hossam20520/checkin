import '../bottom_sheet_bottomsheet/bottom_sheet_bottomsheet.dart';
import '../bottom_sheet_bottomsheet/controller/bottom_sheet_controller.dart';
import '../profile_edit_bottomsheet/controller/profile_edit_controller.dart';
import '../profile_edit_bottomsheet/profile_edit_bottomsheet.dart';
import '../profile_one_bottomsheet/controller/profile_one_controller.dart';
import '../profile_one_bottomsheet/profile_one_bottomsheet.dart';
import '../resources/font_manager.dart';
import '../skip/skip.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));


  @override
  Widget build(BuildContext context) {
    String isLogged = Get.find<PrefUtils>().getIslogged();
   // controller.loadData();
    return  SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,

        body:

        isLogged == "yes" ?
        Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 24,
            bottom: 24,
          ),
          child: SingleChildScrollView(
    child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Padding(
                  padding: getPadding(

                    right: 40,
                  ),
                child: Obx(()=> CustomImageView(
          fit: BoxFit.cover,
           url: controller.profileModelObj.value.image.toString(),
            height: getSize(
              78,
            ),
            width: getSize(
              78,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                39,
              ),
            ),
            margin: getMargin(
              left: 29,
            ),
          ) ),
                ),
        // Padding(
        //   padding: getPadding(
        //   right: 28
        //
        //   ),
        //   child:   CustomButton(
        //         height: getVerticalSize(
        //           32,
        //         ),
        //         width: getHorizontalSize(
        //           96,
        //         ),
        //         text: "lbl_change".tr,
        //         margin: getMargin(
        //           left: 29,
        //           top: 17,
        //         ),
        //         variant: ButtonVariant.FillIndigo50,
        //         shape: ButtonShape.CircleBorder16,
        //         padding: ButtonPadding.PaddingAll6,
        //         fontStyle: ButtonFontStyle.MontserratMedium16,
        //       )),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 27,
                    top: 43,
                    right: 27,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text(
                        "msg_account_information".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14,
                      ),
                      InkWell( onTap: ()=>     Get.bottomSheet(
                        ProfileEditBottomsheet(
                          Get.put(
                            ProfileEditController(),
                          ),
                        ),
                        isScrollControlled: true,
                      ) , child: Text(
                        "lbl_edit".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14Indigo300,
                      ) ,),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 19,
                  ),
                  padding: getPadding(
                    left: 27,
                    top: 10,
                    right: 27,
                    bottom: 10,
                  ),
                  decoration: AppDecoration.fillGray50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: getPadding(
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: AppDecoration.fillGray50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 9,
                              ),
                              child: Text(
                                "lbl_first_name".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratLight16,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                bottom: 9,
                              ),
                              child:Obx(() =>   Text(
                                 controller.profileModelObj.value.name.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratRegular16,
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          top: 8,
                        ),
                        padding: getPadding(
                          top: 2,
                          bottom: 2,
                        ),
                        decoration: AppDecoration.fillGray50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 9,
                              ),
                              child: Text(
                                "lbl_last_name".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratLight16,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                bottom: 10,
                              ),
                              child:Obx(() =>   Text(
                                controller.profileModelObj.value.lastname.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratRegular16,
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          top: 8,
                        ),
                        padding: getPadding(
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: AppDecoration.fillGray50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 9,
                              ),
                              child: Text(
                                "lbl_username".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratLight16,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                bottom: 9,
                              ),
                              child: Obx(() =>   Text(
                                controller.profileModelObj.value.username.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratRegular16,
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          top: 8,
                        ),
                        padding: getPadding(
                          top: 3,
                          bottom: 3,
                        ),
                        decoration: AppDecoration.fillGray50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 9,
                              ),
                              child: Text(
                                "lbl_emial".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratLight16,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 1,
                                bottom: 8,
                              ),
                              child:Obx(() =>   Text(
                                controller.profileModelObj.value.email.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratRegular16,
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 11,
                          right: 2,
                          bottom: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "lbl_mobile_number".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratLight16,
                            ),
                        Obx(() =>   Text(
                          controller.profileModelObj.value.phone.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratRegular16,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),



              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 27,
                    top: 44,
                    right: 27,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_password".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14,
                      ),
                      InkWell(
                        onTap:()=> Get.bottomSheet(
                        ProfileOneBottomsheet(
                          Get.put(
                            ProfileOneController(),
                          ),
                        ),
                        isScrollControlled: true,
                      )  ,  child:  Text(
                        "lbl_edit".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14Indigo300,
                      ),),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: getMargin(
                  top: 20,
                  bottom: 5,
                ),
                padding: getPadding(
                  left: 27,
                  top: 9,
                  right: 27,
                  bottom: 9,
                ),
                decoration: AppDecoration.fillGray50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 3,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_password".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratLight16,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 6,
                      ),
                      child: Text(
                        "lbl".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRegular16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ) :
        SkipWidget()



      )




    );
  }
}

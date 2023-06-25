import 'controller/profile_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';

class ProfileEditBottomsheet extends StatelessWidget {
  ProfileEditBottomsheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfileEditController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 16,
            bottom: 16,
          ),
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              CustomImageView(
                svgPath: ImageConstant.imgRectangle,
                height: getVerticalSize(
                  5,
                ),
                width: getHorizontalSize(
                  48,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    2,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 26,
                    top: 25,
                  ),
                  child: Text(
                    "EditProfile".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratSemiBold24Black900,
                  ),
                ),
              ),
             CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.firstname,
                  hintText: "lbl_first_name".tr,
                  margin: getMargin(
                    left: 26,
                    top: 16,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputAction: TextInputAction.done,

                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: Icon(Icons.person , size: 20,),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),

                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "Please enter valid password";
                    }
                    return null;
                  },

                ),

    CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.lastname,
                  hintText: "lbl_last_name".tr,
                  margin: getMargin(
                    left: 26,
                    top: 16,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputAction: TextInputAction.done,

                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: Icon(Icons.person , size: 20,),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),

                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "Please enter valid password";
                    }
                    return null;
                  },

                ),

          CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.email,
                  hintText: "lbl_emial".tr,
                  margin: getMargin(
                    left: 26,
                    top: 16,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputAction: TextInputAction.done,

                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: Icon(Icons.email_outlined , size: 20,),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),

                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "Please enter valid password";
                    }
                    return null;
                  },

                ),

         CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.phone,
                  hintText: "lbl_mobile_number".tr,
                  margin: getMargin(
                    left: 26,
                    top: 16,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputAction: TextInputAction.done,

                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: Icon(Icons.phone_outlined , size: 20,),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),

                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "Please enter valid password";
                    }
                    return null;
                  },

                ),

              SizedBox(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 48,
                    bottom: 19,
                  ),
                  padding: getPadding(
                    left: 26,
                    right: 26,
                  ),
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onTap: ()=> controller.Save(),
                        height: getVerticalSize(
                          62,
                        ),
                        text: "lbl_confirm".tr,
                        margin: getMargin(
                          top: 4,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 27,
                        ),
                        child: Text(
                          "lbl_cancel".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratRegular16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

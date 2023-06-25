import 'controller/profile_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';

class ProfileOneBottomsheet extends StatelessWidget {
  ProfileOneBottomsheet(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  ProfileOneController controller;

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
                    "lbl_change_password".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratSemiBold24Black900,
                  ),
                ),
              ),
              Obx(
                () => CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.passwordController,
                  hintText: "lbl_old_password".tr,
                  margin: getMargin(
                    left: 26,
                    top: 29,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgLock,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      controller.isShowPassword.value =
                          !controller.isShowPassword.value;
                    },
                    child: Container(
                      margin: getMargin(
                        left: 30,
                        top: 17,
                        right: 18,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: controller.isShowPassword.value
                            ? ImageConstant.imgEye
                            : ImageConstant.imgEye,
                      ),
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
                  isObscureText: controller.isShowPassword.value,
                ),
              ),
              Obx(
                () => CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.newpasswordController,
                  hintText: "lbl_new_password".tr,
                  margin: getMargin(
                    left: 26,
                    top: 48,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgLock,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      controller.isShowPassword1.value =
                          !controller.isShowPassword1.value;
                    },
                    child: Container(
                      margin: getMargin(
                        left: 30,
                        top: 17,
                        right: 18,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: controller.isShowPassword1.value
                            ? ImageConstant.imgEye
                            : ImageConstant.imgEye,
                      ),
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
                  isObscureText: controller.isShowPassword1.value,
                ),
              ),
              Obx(
                () => CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: controller.confirmpasswordController,
                  hintText: "msg_confirm_password".tr,
                  margin: getMargin(
                    left: 26,
                    top: 16,
                    right: 26,
                  ),
                  padding: TextFormFieldPadding.PaddingT16,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                    margin: getMargin(
                      left: 29,
                      top: 17,
                      right: 14,
                      bottom: 17,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgLock,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      54,
                    ),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      controller.isShowPassword2.value =
                          !controller.isShowPassword2.value;
                    },
                    child: Container(
                      margin: getMargin(
                        left: 30,
                        top: 17,
                        right: 18,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: controller.isShowPassword2.value
                            ? ImageConstant.imgEye
                            : ImageConstant.imgEye,
                      ),
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
                  isObscureText: controller.isShowPassword2.value,
                ),
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
                        onTap: ()=> controller.ChangePassowrd(),
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

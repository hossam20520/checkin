import 'controller/reset_password_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(69),
                leadingWidth: 43,
                leading: AppbarImage(
                    height: getVerticalSize(17),
                    width: getHorizontalSize(9),
                    svgPath: ImageConstant.imgArrowleftBlack900,
                    margin: getMargin(left: 34, top: 20, bottom: 18),
                    onTap: () {
                      onTapArrowleft6();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_check_in".tr)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 26, top: 20, right: 26, bottom: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("lbl_reset_password".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold24),
                          Container(
                              width: getHorizontalSize(308),
                              margin: getMargin(left: 17, top: 13, right: 15),
                              child: Text("msg_set_the_new_password".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtMontserratLight16)),
                          Obx(() => CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.newpasswordController,
                              hintText: "lbl_new_password".tr,
                              margin: getMargin(top: 33),
                              padding: TextFormFieldPadding.PaddingT16,
                              fontStyle:
                                  TextFormFieldFontStyle.MontserratLight18,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 29, top: 17, right: 14, bottom: 17),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
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
                                          bottom: 17),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: controller.isShowPassword.value)),
                          Obx(() => CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.confirmpasswordController,
                              hintText: "msg_confirm_password".tr,
                              margin: getMargin(top: 16),
                              padding: TextFormFieldPadding.PaddingT16,
                              fontStyle:
                                  TextFormFieldFontStyle.MontserratLight18,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 29, top: 17, right: 14, bottom: 17),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
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
                                          bottom: 17),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword1.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: controller.isShowPassword1.value)),
                          Spacer(),
                          CustomButton(
                              height: getVerticalSize(62),
                              text: "lbl_confirm".tr,
                              margin: getMargin(bottom: 40),
                              onTap: () {
                                onTapConfirm();
                              })
                        ]))));
  }

  onTapConfirm() {
    controller.ResetPassowrd();

  }

  onTapArrowleft6() {
    Get.back();
  }
}

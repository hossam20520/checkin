import '../forgot_password_screen/controller/forgot_password_controller.dart';
import 'controller/authentication_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthenticationScreen extends GetWidget<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
     String phone = Get.find<ForgotPasswordController>().forgotPasswordModelObj.value.phone.toString();
    return Scaffold(
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
                      onTapArrowleft5();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_check_in".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, top: 18, right: 26, bottom: 18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_enter_authentication".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratSemiBold24),
                      Container(
                          width: getHorizontalSize(274),
                          margin: getMargin(left: 34, top: 16, right: 32),
                          child: RichText(
                              text: TextSpan(children: [

                                TextSpan(
                                    text: "msg_enter_the_4_digit2".tr,
                                    style: TextStyle(
                                        color: ColorConstant.fromHex("#8185c6"),
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w300)),


                                TextSpan(
                                    text:  phone.toString(),
                                    style: TextStyle(
                                        color: ColorConstant.fromHex("#f29f05"),
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500))
                              ]),
                              textAlign: TextAlign.center)),
                      Padding(
                          padding: getPadding(  top: 34  ),
                          child: Obx(() => PinCodeTextField(
                              appContext: context,
                              controller: controller.otpController.value,
                              length: 6,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType.number,
                              autoDismissKeyboard: true,
                              enableActiveFill: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (value) {},
                              textStyle: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400),
                              pinTheme: PinTheme(
                                  fieldHeight: getHorizontalSize(48),
                                  fieldWidth: getHorizontalSize(48),
                                  shape: PinCodeFieldShape.circle,
                                  selectedFillColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  activeFillColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  inactiveFillColor:
                                      ColorConstant.fromHex("#1212121D"),
                                  inactiveColor: ColorConstant.indigo300,
                                  selectedColor: ColorConstant.indigo300,
                                  activeColor: ColorConstant.indigo300)))),
                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_continue".tr,
                          onTap: () {
                            controller.signInWithOTP();
                            // onTapContinue();
                          }),
                      SizedBox(height: 130,)
                      // Padding(
                      //     padding: getPadding(top: 34, bottom: 19),
                      //     child: Text("lbl_resend_the_code".tr,
                      //         overflow: TextOverflow.ellipsis,
                      //         textAlign: TextAlign.left,
                      //         style: AppStyle.txtMontserratLight16))
                    ])) );
  }

  onTapContinue() {
    // controller.otpController;

    // Get.toNamed(
    //   AppRoutes.resetPasswordScreen,
    // );
  }

  onTapArrowleft5() {
    Get.back();
  }
}

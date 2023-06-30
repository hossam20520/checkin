import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/forgot_password_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                      onTapArrowleft4();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_check_in".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 26, top: 20, right: 26, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      Text("msg_forgot_password2".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratSemiBold24),

                      CustomTextFormField(
                          focusNode: FocusNode(),
                          controller: controller.mobilenumberController,
                          hintText: "Example +20********** ".tr,
                          margin: getMargin(top: 24),
                          fontStyle:
                          TextFormFieldFontStyle.MontserratLight18,
                          textInputType: TextInputType.phone,
                          prefix: Container(
                              margin: getMargin(
                                  left: 29, top: 17, right: 14, bottom: 17),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgCall)),
                          prefixConstraints: BoxConstraints(
                              maxHeight: getVerticalSize(54)),
                          validator: (value) {
                            if (!isValidPhone(value)) {
                              return "Please enter valid phone number";
                            }
                            return null;
                          }),

                      // Container(
                      //     width: getHorizontalSize(227),
                      //     margin: getMargin(top: 13),
                      //     child: RichText(
                      //         text: TextSpan(children: [
                      //           TextSpan(
                      //               text: "msg_we_will_send_4_digits2".tr,
                      //               style: TextStyle(
                      //                   color: ColorConstant.fromHex("#8185c6"),
                      //                   fontSize: getFontSize(16),
                      //                   fontFamily: 'Montserrat',
                      //                   fontWeight: FontWeight.w300)),
                      //           TextSpan(
                      //               text: "lbl_20_234_2443".tr,
                      //               style: TextStyle(
                      //                   color: ColorConstant.fromHex("#f29f05"),
                      //                   fontSize: getFontSize(16),
                      //                   fontFamily: 'Montserrat',
                      //                   fontWeight: FontWeight.w500))
                      //         ]),
                      //         textAlign: TextAlign.center)),


                      Spacer(),
                      CustomButton(
                          height: getVerticalSize(62),
                          text: "lbl_continue".tr,
                          margin: getMargin(bottom: 40),
                          onTap: () {
                            onTapContinue();
                          })
                    ])) );
  }

  onTapContinue() {

    controller.verifyPhoneNumber();
    // FirebaseAuth _auth = FirebaseAuth.instance;
    //
    // _auth.verifyPhoneNumber(
    //     phoneNumber: "01013403016",
    //     timeout: Duration(seconds: 60),
    //     verificationCompleted: null,
    //     verificationFailed: null,
    //     codeSent: null,
    //     codeAutoRetrievalTimeout: null
    // );
    Logger.PretteyLogger("aaaa");

    Get.toNamed(
      AppRoutes.authenticationScreen,
    );
  }

  // Future<void> verifyPhoneNumber() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final phoneNumber =  "+201013403016";
  //
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) {
  //       print('Verification completed with auto-retrieval: ${credential.smsCode}');
  //     },
  //     verificationFailed: (FirebaseAuthException e,  ) {
  //       print('Verification failed: $e');
  //       Logger.PretteyLogger("faildd");
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       Logger.PretteyLogger(verificationId);
  //       // setState(() {
  //       //   _verificationId = verificationId;
  //       // });
  //       print('Verification code sent to $phoneNumber');
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       print('Verification code retrieval timed out');
  //     },
  //   );
  // }

  // Future<void> signInWithOTP() async {
  //   try {
  //     final credential = PhoneAuthProvider.credential(
  //       verificationId: "",
  //       smsCode:  "723373",
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     print('User signed in successfully');
  //   } catch (e) {
  //     print('Failed to sign in: $e');
  //   }
  // }
  onTapArrowleft4() {
    Get.back();
  }
}

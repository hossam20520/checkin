import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/authentication_screen/models/authentication_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../forgot_password_screen/controller/forgot_password_controller.dart';

class AuthenticationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<AuthenticationModel> authenticationModelObj = AuthenticationModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code!;

  }

  // AIE-54Xy1gh7hfiPKONqYSKXPJHaULTzitxBdGi_GcOwcPEEfQRGOO74Cov-3CNPBFBifC2m9USWVxiRnmstKI8RnKqYHT5PSt99WfwKh3eoaQxlnd6gtxYHsiP2tb-S7Pg_ak_M9G8ZtgHbYQR8Amjs8xoK6NDD6g
  test(){
    Logger.PretteyLogger(otpController.toString());
  }



    Future<void> signInWithOTP() async {
      String verificationId = Get.find<ForgotPasswordController>().forgotPasswordModelObj.value.verificationId.toString();
      String code = Get.find<ForgotPasswordController>().forgotPasswordModelObj.value.code.toString();
      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode:  otpController.value.text,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        print('User signed in successfully');
        Logger.PretteyLogger("yeeeeeeeee");
        Get.toNamed(
          AppRoutes.resetPasswordScreen,
        );

      } catch (e) {
        Get.rawSnackbar(message: "Incorrect Code".tr ,
            snackPosition:SnackPosition.TOP  ,
            backgroundColor: ColorConstant.red900  ,
            margin: EdgeInsets.all(20.0),
            borderRadius: 10,
            animationDuration: Duration(seconds: 1),
            icon: Icon(Icons.error , color: ColorConstant.whiteA700,)

        );
      }
    }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

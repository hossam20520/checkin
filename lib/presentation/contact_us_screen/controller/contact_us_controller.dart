import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/contact_us_screen/models/contact_us_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ContactUsScreen.
///
/// This class manages the state of the ContactUsScreen, including the
/// current contactUsModelObj
class ContactUsController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  Rx<ContactUsModel> contactUsModelObj = ContactUsModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
  }

  sendContact(){

    Get.rawSnackbar(
        message: "MessageHasBeenSent".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: Colors.green  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.check , color: ColorConstant.whiteA700,)

    );
  }




}

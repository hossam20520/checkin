import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/create_account_screen/models/create_account_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/data/models/register/post_register_resp.dart';
import 'package:checkin/data/apiClient/api_client.dart';

class CreateAccountController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobilenumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  Rx<CreateAccountModel> createAccountModelObj = CreateAccountModel().obs;
  Rx<bool> isShowPassword = true.obs;
  PostRegisterResp postRegisterResp = PostRegisterResp();




  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobilenumberController.dispose();
    passwordController.dispose();
  }




  Future<void> callCreateRegister(Map req) async {
    try {
      postRegisterResp = await Get.find<ApiClient>().createRegister(
        headers: {
          'Content-Type': 'application/json',
        },
        requestData: req,
      );
      _handleCreateRegisterSuccess();
    } on PostRegisterResp catch (e) {
      postRegisterResp = e;
      rethrow;
    }
  }

  void _handleCreateRegisterSuccess() {



  }
}

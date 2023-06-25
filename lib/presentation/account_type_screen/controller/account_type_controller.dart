import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/account_type_screen/models/account_type_model.dart';
import 'package:flutter/material.dart';

class AccountTypeController extends GetxController {
  TextEditingController serviceproviderController = TextEditingController();

  Rx<AccountTypeModel> accountTypeModelObj = AccountTypeModel().obs;

  void selectUser() {
    accountTypeModelObj.update((model) {
      model!.isUserSelected = true;
    });
    Get.find<PrefUtils>().setType('user');
  }

  void selectServiceProvider() {
    accountTypeModelObj.update((model) {
      model!.isUserSelected = false;
    });
    Get.find<PrefUtils>().setType('provider');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    serviceproviderController.dispose();
  }
}

import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();



    Future.delayed(const Duration(milliseconds: 3000), () {
      String isLogged = Get.find<PrefUtils>().getIslogged();
      if(isLogged == "yes"){

        Get.offNamed(
          AppRoutes.homeHotelsContainer1Screen,
        );
      }else{
        Get.offNamed(
          AppRoutes.chooseLangScreen,
        );
      }

    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}

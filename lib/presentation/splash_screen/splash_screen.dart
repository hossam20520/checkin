import 'package:flutter/services.dart';

import 'controller/splash_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../resources/font_manager.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: ColorConstant.indigo900,
      body: Center(
        child: Text(
          "lbl_check_in".tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeightManager.medium,
            fontFamily: FontConstants.fontFamily,
          ),
        ),
      ),
    ) ;
  }
}

import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_hotels_container1_screen/models/home_hotels_container1_model.dart';
import 'package:checkin/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeHotelsContainer1Controller extends GetxController {
  Rx<HomeHotelsContainer1Model> homeHotelsContainer1ModelObj =
      HomeHotelsContainer1Model().obs;

  @override
  void onReady() {
    super.onReady();
    // hideStatusBar();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {


  }

  void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
}

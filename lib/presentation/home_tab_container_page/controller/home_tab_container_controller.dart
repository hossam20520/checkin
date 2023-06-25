import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_tab_container_page/models/home_tab_container_model.dart';
import 'package:flutter/material.dart';
import '../models/home_tab_container_model.dart';



class HomeTabContainerController extends GetxController  with GetSingleTickerProviderStateMixin {
  HomeTabContainerController(this.homeTabContainerModelObj);

  Rx<HomeTabContainerModel> homeTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

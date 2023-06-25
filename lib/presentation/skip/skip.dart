import 'package:checkin/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/utils/size_utils.dart';
import '../../widgets/custom_button.dart';
import '../resources/font_manager.dart';



class SkipWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(
              "Please Login First".tr,
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 22,

                fontWeight: FontWeightManager.medium,
                fontFamily: FontConstants.fontFamily,
              ),
            ),
            CustomButton(
                height: getVerticalSize(62),
                text: "Login".tr,
                margin: getMargin(
                    left: 27, top: 48, right: 26, bottom: 37),
                onTap: () {
                  Get.toNamed(AppRoutes.logInScreen);
                })
          ],)),);
  }

}
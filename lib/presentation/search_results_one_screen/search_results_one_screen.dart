import 'package:checkin/presentation/search_results_one_screen/widgets/serachItem.dart';

import '../search_results_one_screen/widgets/listgroup10342_item_widget.dart';
import '../search_results_one_screen/widgets/listnileairone_item_widget.dart';
import '../search_results_one_screen/widgets/listwizzairlogo_item_widget.dart';
import 'controller/search_results_one_controller.dart';
import 'models/flightItemModel.dart';
import 'models/listgroup10342_item_model.dart';
import 'models/listnileairone_item_model.dart';
import 'models/listwizzairlogo_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SearchResultsOneScreen extends GetWidget<SearchResultsOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(76),
                leadingWidth: 40,
                leading: IconButton(
                 iconSize: 40,
                  icon: Icon(Icons.chevron_left), onPressed: () {

                   Get.back();
                },
                ),
                title: AppbarSubtitle1(
                    text: "lbl_search_results".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 24),
                    child: Obx(() => ListView.separated(
                            physics:
                            NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder:
                                (context, index) {
                              return SizedBox(
                                  height:
                                  getVerticalSize(
                                      15));
                            },
                            itemCount: controller
                                .searchResultsOneModelObj
                                .value
                                .flightItem
                                .value
                                .length,
                            itemBuilder:
                                (context, index) {
                                  FlightItemModel
                              model = controller
                                  .searchResultsOneModelObj
                                  .value
                                  .flightItem
                                  .value[index];
                              return   ResultFlightItemWedget(
                                  model);
                            })
                    )




                ))

        ));
  }

  onTapSelect() {
    Get.toNamed(
      AppRoutes.paymentTwoScreen,
    );
  }

  onTapSelectone() {
    Get.toNamed(
      AppRoutes.paymentTwoScreen,
    );
  }

  onTapArrowleft12() {
    Get.back();
  }
}

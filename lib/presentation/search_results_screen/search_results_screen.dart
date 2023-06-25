import '../search_results_screen/widgets/searchresults1_item_widget.dart';
import 'controller/search_results_controller.dart';
import 'models/searchresults1_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchResultsScreen extends GetWidget<SearchResultsController> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(76),
                leadingWidth: 40,
                leading:IconButton(
                  onPressed: ()=> Get.back(),
                  icon: Icon(Icons.chevron_left , size: 35,),
                ),
                title: AppbarSubtitle1(
                    text: "lbl_search_results".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Padding(
                padding: getPadding(left: 18, top: 24, right: 18),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: controller.searchResultsModelObj.value
                        .searchresults1ItemList.value.length,
                    itemBuilder: (context, index) {
                      Searchresults1ItemModel model = controller
                          .searchResultsModelObj
                          .value
                          .searchresults1ItemList
                          .value[index];
                      return Searchresults1ItemWidget(model, onTapColumn: () {
                        onTapColumn(model);
                      });
                    }))
            )
        )
    );
  }

  onTapColumn(model) {
    Get.toNamed(AppRoutes.carScreen,
    arguments: model.id.toString()
    );

  }

  onTapArrowleft14() {
    Get.back();
  }
}

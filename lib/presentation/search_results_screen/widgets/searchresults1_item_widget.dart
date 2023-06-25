import '../controller/search_results_controller.dart';
import '../models/searchresults1_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Searchresults1ItemWidget extends StatelessWidget {
  Searchresults1ItemWidget(this.searchresults1ItemModelObj, {this.onTapColumn});

  Searchresults1ItemModel searchresults1ItemModelObj;

  var controller = Get.find<SearchResultsController>();

  VoidCallback? onTapColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapColumn?.call();
        },
        child: Container(
          padding: getPadding(
            all: 15,
          ),
          decoration: AppDecoration.outlineIndigo503.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
               url: searchresults1ItemModelObj.image.toString(),
                height: getVerticalSize(
                  108,
                ),
                width: getHorizontalSize(
                  188,
                ),
                radius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      12,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      12,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                margin: getMargin(
                  top: 12,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 28,
                ),
                child: Text(
                  searchresults1ItemModelObj.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratMedium2324,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            searchresults1ItemModelObj.carType.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMontserratRegular1272,
                          ),
                        ),

                      ],
                    ),
                    Container(
                      height: getVerticalSize(
                        37,
                      ),
                      width: getHorizontalSize(
                        93,
                      ),
                      margin: getMargin(
                        bottom: 1,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              searchresults1ItemModelObj.price.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratSemiBold1781,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "lbl_per_day".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratLight1399,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

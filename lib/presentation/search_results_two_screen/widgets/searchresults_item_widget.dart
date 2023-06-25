import '../../home_hotels_container_page/models/HotelsItemModel.dart';
import '../controller/search_results_two_controller.dart';
import '../models/searchresults_item_model.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchresultsItemWidget extends StatelessWidget {
  SearchresultsItemWidget(this.searchresultsItemModelObj, {this.onTapRowwxh});

  HotelsItemModel searchresultsItemModelObj;

  var controller = Get.find<SearchResultsTwoController>();

  VoidCallback? onTapRowwxh;

  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: () {
        onTapRowwxh?.call();
      },
      child: Container(
        padding: getPadding(
          top: 7,
          bottom: 7,
        ),
        decoration: AppDecoration.outlineIndigo50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder11,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageView(
              fit: BoxFit.cover,
              url: searchresultsItemModelObj.image.toString()  ,
              imagePath: ImageConstant.img988581417wxh2,
              height: getVerticalSize(
                130,
              ),
              width: getHorizontalSize(
                140,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  11,
                ),
              ),
              margin: getMargin(
                top: 4,
                bottom: 4,
              ),
            ),




            Padding(
              padding: getPadding(
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          162,
                        ),
                        child: Obx(
                          () => Text(
                            searchresultsItemModelObj.title.toString(),
                            maxLines: null,

                            style: AppStyle.txtMontserratRegular14Black900,
                          ),
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgFavorite,
                        height: getSize(
                          15,
                        ),
                        width: getSize(
                          15,
                        ),
                        margin: getMargin(
                          left: 19,
                          right: 19,
                          bottom: 19,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgSignal,
                          height: getSize(
                            8,
                          ),
                          width: getSize(
                            8,
                          ),
                          margin: getMargin(
                            top: 1,
                            bottom: 4,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 4,
                          ),
                          child: Obx(
                            () => Text(
                              searchresultsItemModelObj.country.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratLight12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 18,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          height: getVerticalSize(
                            20,
                          ),
                          width: getHorizontalSize(
                            53,
                          ),
                          text: "lbl_4_5".tr,
                          margin: getMargin(
                            top: 4,
                            bottom: 4,
                          ),
                          variant: ButtonVariant.FillIndigo700,
                          shape: ButtonShape.RoundedBorder5,
                          padding: ButtonPadding.PaddingT1,
                          fontStyle: ButtonFontStyle.MontserratRegular1291,
                          prefixWidget: Container(
                            margin: getMargin(
                              right: 5,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgStar,
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Padding(
                          padding: getPadding(
                            left: 70,

                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                searchresultsItemModelObj.price.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratSemiBold14,
                              ),
                              Text(
                                "lbl_per_night".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratLight11,
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
          ],
        ),
      ),
    );
  }
}

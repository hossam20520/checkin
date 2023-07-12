import '../search_results_two_screen/controller/search_results_two_controller.dart';
import 'controller/filter_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FilterBottomsheet extends StatelessWidget {
  FilterBottomsheet(this.controller);
  Rx<RangeValues> _currentRangeValues = Rx<RangeValues>(RangeValues(0, 82.26));


  FilterController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 16,
            bottom: 16,
          ),
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgRectangle,
                height: getVerticalSize(
                  5,
                ),
                width: getHorizontalSize(
                  48,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    2,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 33,
                    top: 14,
                  ),
                  child: Text(
                    "lbl_filter".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratSemiBold24Black900,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 33,
                    top: 35,
                  ),
                  child: Text(
                    "lbl_price_range".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratMedium14.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 33,
                  top: 15,
                  right: 34,
                ),
                child: Obx(()=> Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        158,
                      ),
                      padding: getPadding(
                        left: 16,
                        top: 13,
                        right: 16,
                        bottom: 13,
                      ),
                      decoration: AppDecoration.txtOutlineIndigo50.copyWith(
                        borderRadius: BorderRadiusStyle.txtRoundedBorder8,
                      ),
                      child: Text(
                        _currentRangeValues.value.start.round().toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14Indigo300.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.5,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        158,
                      ),
                      margin: getMargin(
                        left: 10,
                      ),
                      padding: getPadding(
                        left: 16,
                        top: 13,
                        right: 16,
                        bottom: 13,
                      ),
                      decoration: AppDecoration.txtOutlineIndigo50.copyWith(
                        borderRadius: BorderRadiusStyle.txtRoundedBorder8,
                      ),
                      child: Text(
                        _currentRangeValues.value.end.round().toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14Indigo300.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ),
              ),
              Obx(() =>  Padding(
                padding: getPadding(
                  left: 33,
                  top: 16,
                  right: 33,
                ),
                child: SliderTheme(
                  data: SliderThemeData(
                    trackShape: RoundedRectSliderTrackShape(),
                    activeTrackColor: ColorConstant.amber700,
                    inactiveTrackColor: ColorConstant.indigo50,
                    thumbColor: ColorConstant.amber700,
                    thumbShape: RoundSliderThumbShape(),
                  ),
                  child: RangeSlider(

                    values:_currentRangeValues.value,
                    min: 0.0,
                    max: 1500,
                    onChanged: (RangeValues values) {

                      _currentRangeValues.value = values;

                    },



                  ),
                ),
              )),
              Padding(
                padding: getPadding(
                  left: 33,
                  top: 5,
                  right: 33,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "lbl_min".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratSemiBold12.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.5,
                        ),
                      ),
                    ),
                    Text(
                      "lbl_max".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratSemiBold12.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    top: 49,
                    bottom: 25,
                  ),
                  padding: getPadding(
                    left: 26,
                    right: 26,
                  ),
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onTap: ()=> showResult() ,
                        height: getVerticalSize(
                          62,
                        ),
                        text: "msg_show_results".tr,
                        margin: getMargin(
                          top: 4,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  showResult(){

   // Get.toNamed(AppRoutes.searchResultsTwoScreen ,
   // arguments: {"start": _currentRangeValues.value.start.round().toString() , "end":_currentRangeValues.value.end.round().toString() }
   // );

   Get.find<SearchResultsTwoController>().fetchHotelsItems(_currentRangeValues.value.start.round().toString() ,_currentRangeValues.value.end.round().toString() , false );
   Get.back();


  }
}



class RingSliderPainter extends CustomPainter {
  final double value;

  RingSliderPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);

    Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double angle = (value / 100) * 2 * 3.14;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57,
      angle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

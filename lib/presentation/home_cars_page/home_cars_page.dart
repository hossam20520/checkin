import '../home_cars_page/widgets/home_cars_item_widget.dart';
import 'controller/home_cars_controller.dart';
import 'models/home_cars_item_model.dart';
import 'models/home_cars_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_search_view.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';

class HomeCarsPage extends StatelessWidget {
  HomeCarsController controller =
      Get.put(HomeCarsController(HomeCarsModel().obs));

  
  @override
  Widget build(BuildContext context) {
    // controller.fetchCarsItems();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Container(
                          padding: getPadding(
                            left: 11,
                            top: 15,
                            right: 11,
                            bottom: 15,
                          ),
                          decoration: AppDecoration.fillIndigo700,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSearchView(
                                controller: controller.searchController,
                                hintText: "msg_pick_up_location".tr,
                                prefix: Container(
                                  margin: getMargin(
                                    left: 30,
                                    top: 17,
                                    right: 8,
                                    bottom: 17,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(
                                    50,
                                  ),
                                ),
                                suffix: Padding(
                                  padding: EdgeInsets.only(
                                    right: getHorizontalSize(
                                      15,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.searchController.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ),
                              CustomSearchView(
                                controller: controller.searchoneController,
                                hintText: "msg_drop_off_location".tr,
                                margin: getMargin(
                                  top: 10,
                                ),
                                prefix: Container(
                                  margin: getMargin(
                                    left: 30,
                                    top: 17,
                                    right: 8,
                                    bottom: 17,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                  ),
                                ),
                                prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(
                                    50,
                                  ),
                                ),
                                suffix: Padding(
                                  padding: EdgeInsets.only(
                                    right: getHorizontalSize(
                                      15,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.searchoneController.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        margin: getMargin(
                                          right: 5,
                                        ),
                                        padding: getPadding(
                                          left: 30,
                                          top: 13,
                                          right: 30,
                                          bottom: 13,
                                        ),
                                        decoration: AppDecoration
                                            .outlineIndigo3001
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder11,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgGrid,
                                              height: getSize(
                                                15,
                                              ),
                                              width: getSize(
                                                15,
                                              ),
                                              margin: getMargin(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                              padding: getPadding(
                                                  left: 0, top: 2, right: 0),
                                              child: Obx(() => InkWell(
                                                  onTap: () =>
                                                      openDatePickerPickupDate(),
                                                  child: Text(
                                                    controller.homeCarsModelObj
                                                        .value.PickUpDate
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtMontserratLight16,
                                                  ))),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),


                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        margin: getMargin(
                                          right: 5,
                                        ),
                                        padding: getPadding(
                                          left: 30,
                                          top: 13,
                                          right: 30,
                                          bottom: 13,
                                        ),
                                        decoration: AppDecoration
                                            .outlineIndigo3001
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder11,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgClock,
                                              height: getSize(
                                                15,
                                              ),
                                              width: getSize(
                                                15,
                                              ),
                                              margin: getMargin(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                              padding: getPadding(
                                                  left: 0, top: 2, right: 0),
                                              child: Obx(() => InkWell(
                                                    onTap: () =>
                                                        openDatePickerDropTime(),
                                                    child: Text(
                                                      controller
                                                          .homeCarsModelObj
                                                          .value
                                                          .PickUpTime
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratLight16,
                                                    ),
                                                  )),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        margin: getMargin(
                                          right: 5,
                                        ),
                                        padding: getPadding(
                                          left: 30,
                                          top: 13,
                                          right: 30,
                                          bottom: 13,
                                        ),
                                        decoration: AppDecoration
                                            .outlineIndigo3001
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder11,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgGrid,
                                              height: getSize(
                                                15,
                                              ),
                                              width: getSize(
                                                15,
                                              ),
                                              margin: getMargin(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                  padding: getPadding(
                                                      left: 0,
                                                      top: 2,
                                                      right: 0),
                                                  child: Obx(() => InkWell(
                                                        onTap: () =>
                                                            openDatePickerDropDate(),
                                                        child: Text(
                                                          controller
                                                              .homeCarsModelObj
                                                              .value
                                                              .DropDate
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratLight16,
                                                        ),
                                                      ))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        margin: getMargin(
                                          right: 5,
                                        ),
                                        padding: getPadding(
                                          left: 30,
                                          top: 13,
                                          right: 30,
                                          bottom: 13,
                                        ),
                                        decoration: AppDecoration
                                            .outlineIndigo3001
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder11,
                                        ),
                                        child: Row(
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgClock,
                                              height: getSize(
                                                15,
                                              ),
                                              width: getSize(
                                                15,
                                              ),
                                              margin: getMargin(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                                    padding: getPadding(
                                                        left: 8,
                                                        top: 2,
                                                        right: 8),
                                                    child: Obx(
                                                      () => InkWell(
                                                        onTap: () =>
                                                            openDatePickerPickTime(),
                                                        child: Text(
                                                          controller
                                                              .homeCarsModelObj
                                                              .value
                                                              .PickUpTime
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratLight16,
                                                        ),
                                                      ),
                                                    ))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomButton(
                                onTap: () => Get.toNamed(
                                  AppRoutes.searchResultsScreen,
                                ),
                                height: getVerticalSize(
                                  50,
                                ),
                                text: "lbl_search".tr,
                                margin: getMargin(
                                  top: 10,
                                  bottom: 4,
                                ),
                                variant: ButtonVariant.FillAmber700,
                                padding: ButtonPadding.PaddingAll14,
                                fontStyle: ButtonFontStyle.MontserratRegular18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 11,
                          top: 27,
                          right: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "msg_best_car_hire_deals".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratMedium20,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 1,
                                bottom: 3,
                              ),
                              // child: Text(
                              //   "lbl_see_all".tr,
                              //   overflow: TextOverflow.ellipsis,
                              //   textAlign: TextAlign.left,
                              //   style: AppStyle.txtMontserratLight16,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            height: getVerticalSize(
                              223,
                            ),
                            child: FutureBuilder<void>(
                                future: controller.fetchCarsItems(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    // Widget tree when data fetching is complete
                                    return Obx(
                                      () => ListView.separated(
                                        padding: getPadding(
                                          left: 11,
                                          top: 17,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (
                                          context,
                                          index,
                                        ) {
                                          return SizedBox(
                                            height: getVerticalSize(
                                              12,
                                            ),
                                          );
                                        },
                                        itemCount: controller
                                            .homeCarsModelObj
                                            .value
                                            .homeCarsItemList
                                            .value
                                            .length,
                                        itemBuilder: (context, index) {
                                          HomeCarsItemModel model = controller
                                              .homeCarsModelObj
                                              .value
                                              .homeCarsItemList
                                              .value[index];
                                          return HomeCarsItemWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    // Widget tree while data is being fetched
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                })),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openDatePickerPickupDate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedopenDatePickUp,
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2050));
    if (dateTime != null) {
      controller.homeCarsModelObj.value.PickUpDate.value =
          dateTime.toIso8601String().split('T').first;

      controller.selectedopenDatePickUp = dateTime;
    }
  }

  Future<void> openDatePickerDropDate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedopenDateDrop,
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2050));
    if (dateTime != null) {
      controller.homeCarsModelObj.value.DropDate.value =
          dateTime.toIso8601String().split('T').first;
      controller.selectedopenDateDrop = dateTime;
    }
  }

  Future<void> openDatePickerPickTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String hour = selectedTime!.hour.toString();
      String min = selectedTime!.minute.toString();

      String period = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
      String date = hour + ":" + min + ": " + period;
      controller.homeCarsModelObj.value.PickUpTime.value = date;
      controller.selectedopenTimePickUp = selectedTime;
    }
  }

  Future<void> openDatePickerDropTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String hour = selectedTime!.hour.toString();
      String min = selectedTime!.minute.toString();

      String period = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
      String date = hour + ":" + min + ": " + period;
      controller.homeCarsModelObj.value.DropTime.value = date;
      controller.selectedopenTimeDrop = selectedTime;
    }
  }
}

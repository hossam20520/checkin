import 'package:checkin/presentation/home_hotels_container_page/wedgets/Hotels.dart';
import 'package:flutter/services.dart';

import '../bottom_sheet_bottomsheet/bottom_sheet_bottomsheet.dart';
import '../bottom_sheet_bottomsheet/controller/bottom_sheet_controller.dart';
import '../search_results_two_screen/controller/search_results_two_controller.dart';
import 'controller/home_hotels_container_controller.dart';
import 'models/home_hotels_container_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';

//ignore_for_file: must_be_immutable
class HomeHotelsContainerPage extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  HomeHotelsContainerController controller =
      Get.put(HomeHotelsContainerController(HomeHotelsContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    controller.fetchHotelsItems();

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                     Form(
                              key: _formKey,
                              child: Container(
                                  width: double.maxFinite,
                                  padding: getPadding(top: 4, bottom: 4),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: double.maxFinite,
                                            child: Container(
                                                margin: getMargin(top: 16),
                                                padding: getPadding(
                                                    left: 11,
                                                    top: 15,
                                                    right: 11,
                                                    bottom: 15),
                                                decoration:
                                                    AppDecoration.fillIndigo700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [


                                                      CustomTextFormField(
                                                          variant:
                                                              TextFormFieldVariant
                                                                  .OutlineIndigo300_1,
                                                          focusNode:
                                                              FocusNode(),
                                                          autofocus: false,
                                                          controller: controller
                                                              .nameController,
                                                          hintText:
                                                              "msg_enter_destination"
                                                                  .tr,
                                                          prefix: Container(
                                                              margin: getMargin(
                                                                  left: 30,
                                                                  top: 17,
                                                                  right: 8,
                                                                  bottom: 17),
                                                              child: CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgSearch)),
                                                          prefixConstraints:
                                                              BoxConstraints(
                                                                  maxHeight:
                                                                      getVerticalSize(
                                                                          50)),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                (!isValidName(
                                                                    value,
                                                                    isRequired:
                                                                        true))) {
                                                              return "Please_Enter_valid_Destnation";
                                                            }
                                                            return null;
                                                          }),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                    onTap: () =>   print("Aa"),

                                                                        // openDatePickerDialogCheckin(),
                                                                    child:   Container(
                                                                            width: MediaQuery.of(context).size.width * 0.45,
                                                                            margin: getMargin(left: 5),
                                                                            padding: getPadding(left: 30, top: 14, right: 30, bottom: 14),
                                                                            decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.roundedBorder9),
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              CustomImageView(
                                                                                  svgPath: ImageConstant.imgGrid,
                                                                                  height: getSize(15),
                                                                                  width: getSize(15),
                                                                                  margin: getMargin(top: 2, bottom: 2),
                                                                                  onTap: () {
                                                                                    openDatePickerDialogCheckin();
                                                                                  }),
                                                                              Padding(padding: getPadding(right: 5, left: 5), child: Obx(() => Text(controller.homeHotelsContainerModelObj.value.chekin.value, overflow: TextOverflow.ellipsis, style: AppStyle.txtMontserratLight16)))
                                                                            ]))),
                                                                InkWell(
                                                                    onTap: () =>
                                                                        openDatePickerDialog(),
                                                                    child:   Container(
                                                                            width: MediaQuery.of(context).size.width * 0.46,
                                                                            margin: getMargin(left: 5),
                                                                            padding: getPadding(left: 30, top: 14, right: 30, bottom: 14),
                                                                            decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.roundedBorder9),
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              CustomImageView(
                                                                                  svgPath: ImageConstant.imgGrid,
                                                                                  height: getSize(15),
                                                                                  width: getSize(15),
                                                                                  margin: getMargin(top: 2, bottom: 2),
                                                                                  onTap: () {
                                                                                    openDatePickerDialog();
                                                                                  }),
                                                                              Padding(padding: getPadding(right: 5, left: 5), child: Obx(() => Text(controller.homeHotelsContainerModelObj.value.checkout.value, overflow: TextOverflow.ellipsis, style: AppStyle.txtMontserratLight16)))
                                                                            ])))
                                                              ])),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                    child: Container(
                                                                        margin: getMargin(left: 5),
                                                                        padding: getPadding(left: 30, top: 14, right: 30, bottom: 14),
                                                                        decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.roundedBorder9),
                                                                        child: InkWell(
                                                                            onTap: () => Rooms(),
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              CustomImageView(svgPath: ImageConstant.imgUser, height: getSize(15), width: getSize(15), margin: getMargin(top: 2, bottom: 2), onTap: () => Rooms()),
                                                                              Padding(padding: getPadding(right: 5, left: 5), child: Obx(() => Text(controller.homeHotelsContainerModelObj.value.gustsRooms.value, overflow: TextOverflow.ellipsis, style: AppStyle.txtMontserratLight16)))
                                                                            ])))),
                                                              ])),
                                                      CustomButton(
                                                          onTap: () => Search(),
                                                          padding: ButtonPadding
                                                              .PaddingAll14,
                                                          fontStyle: ButtonFontStyle
                                                              .MontserratRegular18,
                                                          variant: ButtonVariant
                                                              .FillAmber700,
                                                          height:
                                                              getVerticalSize(
                                                                  50),
                                                          text: "lbl_search".tr,
                                                          margin: getMargin(
                                                              top: 10,
                                                              bottom: 4))
                                                    ]))),
                                        Padding(
                                            padding: getPadding(
                                                left: 11, top: 3, right: 11),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("lbl_nearby_options".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratMedium20),
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 5, bottom: 10),
                                                      child: InkWell(
                                                        onTap: () => Get
                                                            .toNamed(AppRoutes
                                                                .searchResultsTwoScreen),
                                                        child: Text("".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtMontserratLight16Indigo900),
                                                      ))
                                                ])),

                                        SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            padding: getPadding(
                                                left: 5,
                                                top: 3,
                                                right: 5,
                                                bottom: 5),
                                            child: IntrinsicWidth(
                                                child: Obx(
                                              () => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                  controller
                                                      .homeHotelsContainerModelObj
                                                      .value
                                                      .HotelsItems
                                                      .value
                                                      .length,
                                                  (index) => Hotels(controller
                                                      .homeHotelsContainerModelObj
                                                      .value
                                                      .HotelsItems
                                                      .value[index]),
                                                ),
                                              ),

                                              // hotel: hotels[index]
                                            ))),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ])))
                    ])))));
  }

  Future<void> openDatePickerDialogCheckin() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedopenDatePickerDialogCheckinDate,
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2050));
    if (dateTime != null) {
      controller.homeHotelsContainerModelObj.value.chekin.value =
          dateTime.toIso8601String().split('T').first;
      controller.selectedopenDatePickerDialogCheckinDate = dateTime;
    }
  }

  void Search() {
    if (_formKey.currentState!.validate()) {
      controller.homeHotelsContainerModelObj.value.search.value =
          controller.nameController.text;

      // controller.homeHotelsContainerModelObj.value.chekin.value = controller.nameController.text;

      Get.toNamed(
        AppRoutes.searchResultsTwoScreen,
        arguments: {"search": controller.nameController.text  , "start":"", "end":""},
      );
    }
  }

  Future<void> openDatePickerDialog() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedopenDatePickerDialogDate,
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2050));
    if (dateTime != null) {
      controller.homeHotelsContainerModelObj.value.checkout.value =
          dateTime.toIso8601String().split('T').first;
      controller.selectedopenDatePickerDialogDate = dateTime;
    }
  }




  Rooms() {
    Get.bottomSheet(
      BottomSheetBottomsheet(
        Get.put(
          BottomSheetController(),
        ),
      ),
      isScrollControlled: true,
    );
  }
}

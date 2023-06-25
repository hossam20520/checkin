import 'controller/contact_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_subtitle.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ContactUsScreen extends GetWidget<ContactUsController> {
  ContactUsScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(78),
                leadingWidth: 40,
                leading:  IconButton(   onPressed: ()=> Get.back() ,  icon:Icon(Icons.chevron_left, size: 35,)),
                title: AppbarSubtitle(
                    text: "lbl_contact_us".tr, margin: getMargin(left: 30)),
                styleType: Style.bgFillIndigo900),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 26, top: 32, right: 26, bottom: 32),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgLogo1,
                              height: getSize(74),
                              width: getSize(74)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: controller.nameController,
                              hintText: "lbl_name".tr,
                              margin: getMargin(top: 32),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 24, top: 17, right: 14, bottom: 17),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgUser)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: controller.emailController,
                              hintText: "lbl_email".tr,
                              margin: getMargin(top: 16),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 24, top: 17, right: 14, bottom: 17),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgMail)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(54)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          Container(
                              margin: getMargin(left: 1, top: 16, bottom: 5),
                              padding: getPadding(all: 24),
                              decoration: AppDecoration.outlineIndigo3001
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder11),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Expanded(
                                      child: TextFormField(
                                        maxLines: 4,
                                        decoration: InputDecoration(
                                          hintText: 'enmsHer'.tr,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ]))
                        ]))),
            bottomNavigationBar: CustomButton(
              onTap: ()=> controller.sendContact(),
                height: getVerticalSize(62),
                text: "lbl_send".tr,
                margin: getMargin(left: 27, right: 26, bottom: 54))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleft1() {
    Get.back();
  }
}

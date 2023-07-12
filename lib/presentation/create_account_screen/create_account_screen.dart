import '../../widgets/custom_drop_down.dart';
import 'controller/create_account_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:checkin/data/models/register/post_register_req.dart';
import 'package:checkin/data/models/register/post_register_resp.dart';
import 'package:checkin/domain/facebookauth/facebook_auth_helper.dart';
import 'package:checkin/domain/facebookauth/facebook_user.dart';

// ignore_for_file: must_be_immutable
class CreateAccountScreen extends GetWidget<CreateAccountController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    controller.fetchCountryItems();
    return   Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(69),
                leadingWidth: 36,
                leading: AppbarImage(
                    height: getVerticalSize(17),
                    width: getHorizontalSize(9),
                    svgPath: ImageConstant.imgArrowleftBlack900,
                    margin: getMargin(left: 27, top: 20, bottom: 18),
                    onTap: () {
                      onTapArrowleft();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_check_in".tr)),
            body: SingleChildScrollView(

                // scrollDirection: Axis.vertical,
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding:
                            getPadding(left: 26, top: 21, right: 26, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("msg_create_a_new_account".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtDescription),
                              Padding(
                                  padding: getPadding(left: 1, top: 26),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: CustomTextFormField(
                                              focusNode: FocusNode(),

                                              controller: controller
                                                  .firstNameController,
                                              hintText: "lbl_first_name".tr,
                                              margin: getMargin(top: 16),
                                              fontStyle: TextFormFieldFontStyle
                                                  .MontserratLight18,
                                              textInputType: TextInputType.name,
                                              prefix: Container(
                                                  margin: getMargin(
                                                      left: 29,
                                                      top: 17,
                                                      right: 14,
                                                      bottom: 17),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgUser)),
                                              prefixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(54)),
                                              validator: (value) {
                                                if (value == null || (!isValidName(value, isRequired: true))) {
                                                  return "Please enter valid Name";
                                                }
                                                return null;
                                              }),
                                        ),
                                        SizedBox(
                                          width:
                                              8, // Replace with your desired width
                                        ),
                                        Expanded(
                                          child: CustomTextFormField(
                                              focusNode: FocusNode(),
                                              controller:
                                                  controller.lastNameController,
                                              hintText: "lbl_last_name".tr,
                                              margin: getMargin(top: 16),
                                              fontStyle: TextFormFieldFontStyle
                                                  .MontserratLight18,
                                              textInputType: TextInputType.name,
                                              prefix: Container(
                                                  margin: getMargin(
                                                      left: 29,
                                                      top: 17,
                                                      right: 14,
                                                      bottom: 17),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgUser)),
                                              prefixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(54)),
                                              validator: (value) {
                                                if (value == null ||
                                                    (!isValidName(value,
                                                        isRequired: true))) {
                                                  return "Please enter valid Name";
                                                }
                                                return null;
                                              }),
                                        )
                                      ])),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.emailController,
                                  hintText: "lbl_email".tr,
                                  margin: getMargin(top: 16),
                                  fontStyle:
                                      TextFormFieldFontStyle.MontserratLight18,
                                  textInputType: TextInputType.emailAddress,
                                  prefix: Container(
                                      margin: getMargin(
                                          left: 29,
                                          top: 17,
                                          right: 14,
                                          bottom: 17),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgMail)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(54)),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),





                             Obx(() =>   CustomDropDown(
                                  focusNode: FocusNode(),
                                  icon: Container(
                                      margin: getMargin(left: 30, right: 40),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgArrowdown)  ),
                                  hintText: "selcectCountry".tr,
                                  padding: DropDownPadding.PaddingT15 ,
                                  margin:  getMargin( top: 10   ),
                                  alignment: Alignment.center,
                                  items: controller.createAccountModelObj.value
                                      .dropdownItemList.value,
                                  onChanged: (value) {
                                    controller.onSelected(value);
                                  }) ),


                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.mobilenumberController,
                                  hintText: "lbl_mobile_number".tr,
                                  margin: getMargin(top: 16),
                                  fontStyle:
                                      TextFormFieldFontStyle.MontserratLight18,
                                  textInputType: TextInputType.phone,
                                  prefix: Container(
                                      margin: getMargin(
                                          left: 29,
                                          top: 17,
                                          right: 14,
                                          bottom: 17),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgCall)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(54)),
                                  validator: (value) {
                                    if (!isValidPhone(value)) {
                                      return "Please enter valid phone number";
                                    }
                                    return null;
                                  }),
                              Obx(() => CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.passwordController,
                                  hintText: "lbl_password".tr,
                                  margin: getMargin(top: 16),
                                  padding: TextFormFieldPadding.PaddingT16,
                                  fontStyle:
                                      TextFormFieldFontStyle.MontserratLight18,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  prefix: Container(
                                      margin: getMargin(
                                          left: 29,
                                          top: 17,
                                          right: 14,
                                          bottom: 17),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgLock)),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(54)),
                                  suffix: InkWell(
                                      onTap: () {
                                        controller.isShowPassword.value =
                                            !controller.isShowPassword.value;
                                      },
                                      child: Container(
                                          margin: getMargin(
                                              left: 30,
                                              top: 17,
                                              right: 28,
                                              bottom: 17),
                                          child: CustomImageView(
                                              svgPath: controller
                                                      .isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                                  suffixConstraints: BoxConstraints(
                                      maxHeight: getVerticalSize(54)),
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  },
                                  isObscureText:
                                      controller.isShowPassword.value)),
                              Container(
                                  width: getHorizontalSize(296),
                                  margin:
                                      getMargin(left: 22, top: 40, right: 23),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_by_creating_an_account2"
                                                .tr,
                                            style: TextStyle(
                                                color: ColorConstant.indigo300,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300)),
                                        TextSpan(
                                            text: "msg_terms_conditions".tr,
                                            style: TextStyle(
                                                color: ColorConstant.indigo700,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300,
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(
                                            text: "lbl_and".tr,
                                            style: TextStyle(
                                                color: ColorConstant.indigo300,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300)),
                                        TextSpan(
                                            text: "msg_privacy_statement".tr,
                                            style: TextStyle(
                                                color: ColorConstant.indigo700,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300,
                                                decoration:
                                                    TextDecoration.underline))
                                      ]),
                                      textAlign: TextAlign.center)),
                              CustomButton(
                                  height: getVerticalSize(62),
                                  text: "lbl_create_account".tr,
                                  margin: getMargin(top: 30),
                                  onTap: () {
                                    onTapCreateaccount();
                                  }),
                              Padding(
                                  padding:
                                      getPadding(left: 1, top: 40, right: 1),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Padding(
                                        //     padding:
                                        //         getPadding(top: 9, bottom: 9),
                                        //     child: SizedBox(
                                        //         width: getHorizontalSize(65),
                                        //         child: Divider(
                                        //             height: getVerticalSize(1),
                                        //             thickness:
                                        //                 getVerticalSize(1),
                                        //             color: ColorConstant
                                        //                 .black900))),
                                        // Text("msg_or_create_account".tr,
                                        //     overflow: TextOverflow.ellipsis,
                                        //     textAlign: TextAlign.left,
                                        //     style: AppStyle
                                        //         .txtMontserratLight16Black900),
                                        // Padding(
                                        //     padding:
                                        //         getPadding(top: 9, bottom: 9),
                                        //     child: SizedBox(
                                        //         width: getHorizontalSize(65),
                                        //         child: Divider(
                                        //             height: getVerticalSize(1),
                                        //             thickness:
                                        //                 getVerticalSize(1),
                                        //             color: ColorConstant
                                        //                 .black900)))
                                      ])),
                              Padding(
                                  padding: getPadding(left: 1, top: 25),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Expanded(
                                        //     child: CustomButton(
                                        //         height: getVerticalSize(55),
                                        //         text: "lbl_google".tr,
                                        //         margin: getMargin(right: 4),
                                        //         variant: ButtonVariant
                                        //             .OutlineIndigo300,
                                        //         padding:
                                        //             ButtonPadding.PaddingT16,
                                        //         fontStyle: ButtonFontStyle
                                        //             .MontserratRegular18,
                                        //         prefixWidget: Container(
                                        //             margin:
                                        //                 getMargin(right: 14 , left: 14),
                                        //             child: CustomImageView(
                                        //                 svgPath: ImageConstant
                                        //                     .imgBrands)))),

                                        // SizedBox(width: 20,),

                                        // Expanded(
                                        //     child: Container(
                                        //         margin: getMargin(left: 4),
                                        //         padding: getPadding(
                                        //             left: 12,
                                        //             top: 15,
                                        //             right: 12,
                                        //             bottom: 15),
                                        //         decoration: AppDecoration
                                        //             .outlineIndigo300
                                        //             .copyWith(
                                        //                 borderRadius:
                                        //                     BorderRadiusStyle
                                        //                         .roundedBorder11),
                                        //         child: Row(children: [
                                        //           CustomImageView(
                                        //               svgPath: ImageConstant
                                        //                   .imgFacebook,
                                        //               height: getSize(24),
                                        //               width: getSize(24)),
                                        //           Padding(
                                        //               padding: getPadding(
                                        //                   left: 10, bottom: 1 , right: 12),
                                        //               child: Text(
                                        //                   "lbl_facebook".tr,
                                        //                   overflow: TextOverflow
                                        //                       .ellipsis,
                                        //                   textAlign:
                                        //                       TextAlign.left,
                                        //                   style: AppStyle
                                        //                       .txtMontserratRegular18))
                                        //         ])))
                                      ])),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtHaveanaccount();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 35, bottom: 5),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "msg_have_an_account2".tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.indigo300,
                                                    fontSize: getFontSize(16),
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w300)),
                                            TextSpan(
                                                text: "lbl_log_in".tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.indigo700,
                                                    fontSize: getFontSize(16),
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline))
                                          ]),
                                          textAlign: TextAlign.left)))
                            ])))));
  }



  Future<void> onTapCreateaccount() async {
   String type =  Get.find<PrefUtils>().getType();
    if (_formKey.currentState!.validate()) {
      PostRegisterReq postRegisterReq = PostRegisterReq(

        password: controller.passwordController.text,
        mobile: controller.mobilenumberController.text,
        firstname: controller.firstNameController.text,
        lastname: controller.lastNameController.text,
        email: controller.emailController.text,
        type: type,
        cce_id: controller.createAccountModelObj.value.selectedId.toString()

      );
      try {
        await controller.callCreateRegister(
          postRegisterReq.toJson(),
        );
        _onRegisterSuccess();
      } on PostRegisterResp {
        _onRegisterError();
      } on NoInternetException catch (e) {
        Get.rawSnackbar(message: e.toString());
      } catch (e) {
        _onRegisterError();
       Logger.PretteyLogger(e);
        print(e);

      }
    }
  }

  void _onRegisterSuccess() {

    Get.rawSnackbar(message: "SuccessCreated".tr ,
      snackPosition:SnackPosition.TOP  ,
      backgroundColor: Colors.green  ,
      margin: EdgeInsets.all(20.0),
      borderRadius: 10,
      animationDuration: Duration(seconds: 1),
      icon: Icon(Icons.error , color: ColorConstant.whiteA700,));

    Get.toNamed(
      AppRoutes.logInScreen,
    );


  }

  void _onRegisterError() {

    Get.rawSnackbar(message: "exist_".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: ColorConstant.red900  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.error , color: ColorConstant.whiteA700,)

    );

    // Logger.PretteyLogger(controller.postRegisterResp.status);

    // Get.defaultDialog(
    //     onConfirm: () => Get.back(),
    //     title: 'Failddd',
    //     middleText: controller.postRegisterResp.message!.toString());
  }

  onTapTxtHaveanaccount() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      onSuccessFacebookAuthResponse(facebookUser);
    }).catchError((onError) {
      onErrorFacebookAuthResponse();
    });
  }

  onSuccessFacebookAuthResponse(FacebookUser facebookUser) {
    // Get.toNamed(
    //   AppRoutes.logInScreen,
    // );
  }

  onErrorFacebookAuthResponse() {
    Get.defaultDialog(
        onConfirm: () => Get.back(), title: "faild", middleText: "faild");
  }

  onTapArrowleft() {
    Get.back();
  }
}

// onSuccessFacebookAuthResponse(FacebookUser facebookUser) {
//   Get.toNamed(
//     AppRoutes.homeHotelsFilledContainerScreen,
//   );
// }
//
// onErrorFacebookAuthResponse() {
//   Get.defaultDialog(
//       onConfirm: () => Get.back(), title: "faild", middleText: "faild");
// }
//
// onTapArrowleft() {
//   Get.back();
// }
// }

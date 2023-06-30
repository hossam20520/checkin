import '../../core/utils/progress_dialog_utils.dart';
import '../../domain/facebookauth/facebook_auth_helper.dart';
import '../../domain/facebookauth/facebook_user.dart';
import 'controller/log_in_controller.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/core/utils/validation_functions.dart';
import 'package:checkin/widgets/app_bar/appbar_image.dart';
import 'package:checkin/widgets/app_bar/appbar_title.dart';
import 'package:checkin/widgets/app_bar/custom_app_bar.dart';
import 'package:checkin/widgets/custom_button.dart';
import 'package:checkin/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:checkin/data/models/login/post_login_req.dart';
import 'package:checkin/data/models/login/post_login_resp.dart';
import 'package:checkin/domain/googleauth/google_auth_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends GetWidget<LogInController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      onTapArrowleft3();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_check_in".tr)),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 26, top: 23, right: 26, bottom: 23),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("msg_log_in_to_your_account".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtDescription),
                          CustomTextFormField(

                              focusNode: FocusNode(),
                              controller: controller.mobilenumberController,
                              hintText: "lbl_mobile_number".tr,
                              margin: getMargin(top: 24),
                              fontStyle:
                                  TextFormFieldFontStyle.MontserratLight18,
                              textInputType: TextInputType.phone,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 29, top: 17, right: 14, bottom: 17),
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





                          Obx(()=>     CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: controller.mobilenumbervalController,
                            hintText: "lbl_password".tr,
                            margin: getMargin(
                              // left: 26,
                              top: 15,
                              // right: 26,
                            ),
                            padding: TextFormFieldPadding.PaddingT16,
                            textInputType: TextInputType.visiblePassword,
                            prefix: Container(
                              margin: getMargin(
                                left: 29,
                                top: 17,
                                right: 14,
                                bottom: 17,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgLock,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(

                              maxHeight: getVerticalSize(
                                54,
                              ),
                            ),
                            suffix:  InkWell(

                              onTap: () {
                                controller.isShowPassword.value =
                                !controller.isShowPassword.value;
                              },
                              child: Container(
                                margin: getMargin(
                                  left: 30,
                                  top: 17,
                                  right: 20,
                                  bottom: 17,
                                ),
                                child: CustomImageView(
                                  svgPath: controller.isShowPassword.value
                                      ? ImageConstant.imgEye
                                      : ImageConstant.imgEye,
                                ),
                              ),

                            ) ,
                            suffixConstraints: BoxConstraints(
                              maxHeight: getVerticalSize(
                                54,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "Please enter valid password";
                              }
                              return null;
                            },
                            isObscureText: controller.isShowPassword.value,
                          )),





                          // CustomTextFormField(
                          //     focusNode: FocusNode(),
                          //     controller: controller.mobilenumbervalController,
                          //     hintText: "lbl_12345678".tr,
                          //     margin: getMargin(top: 16),
                          //     padding: TextFormFieldPadding.PaddingT16,
                          //     fontStyle:
                          //         TextFormFieldFontStyle.MontserratLight18,
                          //     textInputAction: TextInputAction.done,
                          //     textInputType: TextInputType.phone,
                          //     prefix: Container(
                          //         margin: getMargin(
                          //             left: 29, top: 17, right: 14, bottom: 17),
                          //         child: CustomImageView(
                          //             svgPath: ImageConstant.imgLock)),
                          //     prefixConstraints: BoxConstraints(
                          //         maxHeight: getVerticalSize(54)),
                          //     suffix: Container(
                          //         margin: getMargin(
                          //             left: 30, top: 17, right: 23, bottom: 17),
                          //         child: CustomImageView(
                          //             svgPath: ImageConstant.imgSettings)),
                          //     suffixConstraints: BoxConstraints(
                          //         maxHeight: getVerticalSize(54)),
                          //     validator: (value) {
                          //       if (!isValidPhone(value)) {
                          //         return "Please enter valid phone number";
                          //       }
                          //       return null;
                          //     }),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotpassword();
                                  },
                                  child: Padding(
                                      padding: getPadding(left: 1, top: 19),
                                      child: Text("msg_forgot_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtMontserratRegular14)))),
                          Spacer(),
                          CustomButton(
                              height: getVerticalSize(62),
                              text: "lbl_log_in".tr,
                              onTap: () {
                                Login();
                              }),
                          Padding(
                              padding: getPadding(top: 41, right: 1),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Padding(
                                    //     padding: getPadding(top: 8, bottom: 10),
                                    //     child: SizedBox(
                                    //         width: getHorizontalSize(99),
                                    //         child: Divider(
                                    //             height: getVerticalSize(1),
                                    //             thickness: getVerticalSize(1),
                                    //             color:
                                    //                 ColorConstant.black900))),
                                    // Text("lbl_or_log_in_with".tr,
                                    //     overflow: TextOverflow.ellipsis,
                                    //     textAlign: TextAlign.left,
                                    //     style: AppStyle
                                    //         .txtMontserratLight16Black900),
                                    // Padding(
                                    //     padding: getPadding(top: 8, bottom: 10),
                                    //     child: SizedBox(
                                    //         width: getHorizontalSize(99),
                                    //         child: Divider(
                                    //             height: getVerticalSize(1),
                                    //             thickness: getVerticalSize(1),
                                    //             color: ColorConstant.black900)))
                                  ])),
                          Padding(
                              padding: getPadding(left: 1, top: 24),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    // Expanded(
                                    //     child:  CustomButton(
                                    //         height: getVerticalSize(55),
                                    //         text: "lbl_google".tr,
                                    //         margin: getMargin(right: 4),
                                    //         variant:
                                    //             ButtonVariant.OutlineIndigo300,
                                    //         padding: ButtonPadding.PaddingT16,
                                    //         fontStyle: ButtonFontStyle
                                    //             .MontserratRegular18,
                                    //         prefixWidget: Container(
                                    //             margin: getMargin(right:0 , left: 8),
                                    //             child: CustomImageView(
                                    //                 svgPath: ImageConstant
                                    //                     .imgBrands)),
                                    //         onTap: () {
                                    //           googleLogin();
                                    //         })
                                    //
                                    //
                                    // ),
                                    // SizedBox(width: 15,),

                                    // Expanded(
                                    //     child:  CustomButton(
                                    //         height: getVerticalSize(55),
                                    //         text: "lbl_facebook".tr,
                                    //         margin: getMargin(right: 4),
                                    //         variant:
                                    //         ButtonVariant.OutlineIndigo300,
                                    //         padding: ButtonPadding.PaddingT16,
                                    //         fontStyle: ButtonFontStyle
                                    //             .MontserratRegular18,
                                    //         prefixWidget: Container(
                                    //             margin: getMargin(right:0 , left: 8),
                                    //             child: CustomImageView(
                                    //                 svgPath: ImageConstant
                                    //                     .imgFacebook)),
                                    //         onTap: () {
                                    //            FacebookLoginFun();
                                    //           // googleLogin();
                                    //         })
                                    //
                                    //
                                    // ),







                                  ])),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount();
                              },
                              child: Padding(
                                  padding: getPadding(top: 34, bottom: 40),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.fromHex(
                                                    "#8185c6"),
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w300)),
                                        TextSpan(
                                            text: "lbl_create_one".tr,
                                            style: TextStyle(
                                                color: ColorConstant.fromHex(
                                                    "#353ba3"),
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline))
                                      ]),
                                      textAlign: TextAlign.left)))
                        ]))));
  }

FacebookLoginFun() async {

  FacebookUser user = await FacebookAuthHelper().facebookSignInProcess();

  Logger.PretteyLogger(user.email);


}
  FirebaseLogin(){
    FirebaseAuth auth = FirebaseAuth.instance;

  }
  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  Future<void> Login() async {
    if (_formKey.currentState!.validate()) {
      PostLoginReq postLoginReq = PostLoginReq(
        phone: controller.mobilenumberController.text,
        password: controller.mobilenumbervalController.text,
      );
      try {
        await controller.callCreateLogin(
          postLoginReq.toJson(),
        );
        _onLoginSuccess();
      } on PostLoginResp {
        _onLoginError();
      } on NoInternetException catch (e) {
        Get.rawSnackbar(message: e.toString());
      } catch (e) {
        print("0000000000000000000000000000000000000");
        // _onLoginSuccess();
        print(e);
        //TODO: Handle generic errors
      }
    }
  }

  void _onLoginSuccess() {

    Get.offAllNamed(AppRoutes.homeHotelsContainer1Screen);

  }

  void _onLoginError() {


    Get.rawSnackbar(message: "passwordIncorrect".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: ColorConstant.red900  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.error , color: ColorConstant.whiteA700,)

    );
    // Get.defaultDialog(
    //     onConfirm: () => Get.back(),
    //     title: 'Falid',
    //     middleText:  "fff");
  }

  googleLogin() async {
    ProgressDialogUtils.showProgressDialog();
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {

          controller.loginSocail(googleUser);





        onSuccessGoogleAuthResponse(googleUser);
      } else {

        onErrorGoogleAuthResponse();
      }
    }).catchError((onError) {
      print("666666666666666666666666666666");
      print(onError);
      print("666666688888888888888888888888666");
      onErrorGoogleAuthResponse();
    });
  }

  onSuccessGoogleAuthResponse(GoogleSignInAccount googleUser) {
// Logger.PretteyLogger(googleUser);
    // Get.toNamed(
    //   AppRoutes.homeHotelsFilledContainerScreen,
    // );
  }

  onErrorGoogleAuthResponse() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: "faild",
        middleText: "faild message");
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.createAccountScreen,
    );
  }

  onTapArrowleft3() {
    Get.back();
  }
}

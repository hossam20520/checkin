import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/reset_password_screen/models/reset_password_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/password/post_passowrd_req.dart';
import '../../../data/models/password/post_passowrd_resp.dart';
import '../../forgot_password_screen/controller/forgot_password_controller.dart';

class ResetPasswordController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  Rx<ResetPasswordModel> resetPasswordModelObj = ResetPasswordModel().obs;


  PostPasswordResp PasswordResponse = PostPasswordResp();
  void ResetPassowrd(){
    final phone = Get.find<PrefUtils>().getPhone();




    if(newpasswordController.text.toString() == confirmpasswordController.text.toString()){
      PostPassowrdReq request = PostPassowrdReq(

        password: newpasswordController.text,
        phone: Get.find<ForgotPasswordController>().forgotPasswordModelObj.value.phone.value.toString(),

      );

      CallApi(request);
    }else{

      Get.rawSnackbar(message: "passwordnotmatch".tr ,
          snackPosition:SnackPosition.TOP  ,
          backgroundColor: ColorConstant.red900  ,
          margin: EdgeInsets.all(20.0),
          borderRadius: 10,
          animationDuration: Duration(seconds: 1),
          icon: Icon(Icons.error , color: ColorConstant.whiteA700,)

      );
    }


  }








  Future<void> ChnagePasswordCall(Map req) async {
    // final requestData = json.encode(req.toJson());
    try {
      PasswordResponse = await Get.find<ApiClient>().ResetPassword(
        headers: {
          'Content-Type': 'application/json',

        },
        requestData: req,

      );
      _handleBookSuccess();
      print(  "8888888888888888888888888888888888888");
      print( req.toString());
    } on PostPasswordResp catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }

  void _handleBookSuccess() {


  }


  Future<void> CallApi(data) async {
    try {
      await  ChnagePasswordCall(data.toJson());
      _onChangeSuccess();
    } on PostPasswordResp {
      _onPostPasswordError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      _onError();
      print(e);
      //TODO: Handle generic errors
    }
  }



  void _onPostPasswordError(){
    Get.rawSnackbar(message: "passwordIncorrect".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: ColorConstant.red900  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.error , color: ColorConstant.whiteA700,)

    );
  }

  void _onChangeSuccess() {
    Get.toNamed(
      AppRoutes.successTwoScreen,
    );

    Get.rawSnackbar(message: "PasswordChanged".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: Colors.green  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.check , color: ColorConstant.whiteA700,)

    );

    // Get.toNamed(
    //   AppRoutes.paymentWebScreen,
    //
    // );

  }
  void _onError() {

    Get.rawSnackbar(message: "messageServer".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: ColorConstant.red900  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.error , color: ColorConstant.whiteA700,)
    );

  }




  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }
}

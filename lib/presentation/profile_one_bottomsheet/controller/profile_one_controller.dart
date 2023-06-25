import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/password/post_passowrd_req.dart';
import 'package:checkin/data/models/password/post_passowrd_resp.dart';
import 'package:checkin/presentation/profile_one_bottomsheet/models/profile_one_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';

/// A controller class for the ProfileOneBottomsheet.
///
/// This class manages the state of the ProfileOneBottomsheet, including the
/// current profileOneModelObj
class ProfileOneController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();



  Rx<ProfileOneModel> profileOneModelObj = ProfileOneModel().obs;
  PostPasswordResp PasswordResponse = PostPasswordResp();
  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  Rx<bool> isShowPassword2 = true.obs;

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }


  void ChangePassowrd(){
      final phone = Get.find<PrefUtils>().getPhone();
    if(newpasswordController.text.toString() == confirmpasswordController.text.toString()){
      PostPassowrdReq request = PostPassowrdReq(
        oldPassword: passwordController.text,
        password: newpasswordController.text,
        phone: phone.toString(),

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


  String token =  Get.find<PrefUtils>().getToken();





  Future<void> ChnagePasswordCall(Map req) async {
    // final requestData = json.encode(req.toJson());
    try {
      PasswordResponse = await Get.find<ApiClient>().ChangePassword(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer  '+ token
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
    Get.back();
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


  // ChangePassword
}

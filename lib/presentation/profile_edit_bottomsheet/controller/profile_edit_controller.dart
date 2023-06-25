import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/password/post_passowrd_req.dart';
import 'package:checkin/data/models/password/post_passowrd_resp.dart';
import 'package:checkin/presentation/profile_one_bottomsheet/models/profile_one_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/profile/profileRequest.dart';

/// A controller class for the ProfileOneBottomsheet.
///
/// This class manages the state of the ProfileOneBottomsheet, including the
/// current profileOneModelObj
class ProfileEditController extends GetxController {


  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();


  Rx<ProfileOneModel> profileOneModelObj = ProfileOneModel().obs;
  PostPasswordResp PasswordResponse = PostPasswordResp();



  @override

  void onReady() {
    super.onReady();
     String fistname = Get.find<PrefUtils>().getName();
    String lastnamee = Get.find<PrefUtils>().getLastname();
    String emaiil = Get.find<PrefUtils>().getEmail();
    String phonee = Get.find<PrefUtils>().getPhone();

    firstname.text = fistname;
    lastname.text = lastnamee;
    email.text = emaiil;
    phone.text = phonee;

  }


  @override
  void onClose() {
    super.onClose();
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    phone.dispose();
  }


  void Save(){
    // Logger.PretteyLogger(firstname.text);
      // final phone = Get.find<PrefUtils>().getPhone();
      //
      ProfileRequest request = ProfileRequest(
        firstname: firstname.text,
        lastname: lastname.text,
        email: email.text,
        phone: phone.text
      );

         CallApi(request);


    // }else{
    //
    //   Get.rawSnackbar(message: "passwordnotmatch".tr ,
    //       snackPosition:SnackPosition.TOP  ,
    //       backgroundColor: ColorConstant.red900  ,
    //       margin: EdgeInsets.all(20.0),
    //     borderRadius: 10,
    //     animationDuration: Duration(seconds: 1),
    //         icon: Icon(Icons.error , color: ColorConstant.whiteA700,)
    //
    //   );
    // }


  }








  Future<void> ChangeProfile(Map req) async {
    // final requestData = json.encode(req.toJson());
    String token =  Get.find<PrefUtils>().getToken();
    try {
      PasswordResponse = await Get.find<ApiClient>().ChangeProfile(
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
      await  ChangeProfile(data.toJson());
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

           Get.find<PrefUtils>().setName( firstname.text) ;

             Get.find<PrefUtils>().setLastname(lastname.text) ;

          Get.find<PrefUtils>().setEmail(email.text) ;
            Get.find<PrefUtils>().setPhone(phone.text) ;







    Get.back();
    Get.rawSnackbar(message: "ProfileUpdated".tr ,
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

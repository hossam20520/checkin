import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/register/post_register_req.dart';
import 'package:checkin/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/data/models/login/post_login_resp.dart';
import 'package:checkin/data/apiClient/api_client.dart';

class LogInController extends GetxController {
  TextEditingController mobilenumberController = TextEditingController();

  TextEditingController mobilenumbervalController = TextEditingController();

  Rx<LogInModel> logInModelObj = LogInModel().obs;

  PostLoginResp postLoginResp = PostLoginResp();
  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  Rx<bool> isShowPassword2 = true.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    mobilenumberController.dispose();
    mobilenumbervalController.dispose();
  }


  loginSocail(user){
    LogInWithSocal(user);
  }



  Future<void> LoginCont(postLoginReq) async {


      try {
        await callCreateLogin(
          postLoginReq.toJson(),
        );
        _onLoginSuccessv();
      } on PostLoginResp {
        // _onLoginError();
      } on NoInternetException catch (e) {
        Get.rawSnackbar(message: e.toString());
      } catch (e) {
        print("0000000000000000000000000000000000000");
        // _onLoginSuccess();
        print(e);
        //TODO: Handle generic errors
      }

  }


  void _onLoginSuccessv() {

    Get.offAllNamed(AppRoutes.homeHotelsContainer1Screen);

  }



  Future<void> callCreateLogin(Map req) async {
    try {
      postLoginResp = await Get.find<ApiClient>().createLogin(
        headers: {
          'Content-Type': 'application/json',
        },
        requestData: req,
      );
      _handleCreateLoginSuccess();
    } on PostLoginResp catch (e) {
      postLoginResp = e;
      rethrow;
    }
  }






  void _handleCreateLoginSuccess() {
    Get.find<PrefUtils>().isLogged('yes');
    Get.find<PrefUtils>().setName(postLoginResp.data!.user!.firstname.toString());
    Get.find<PrefUtils>().setEmail(postLoginResp.data!.user!.email.toString());
    Get.find<PrefUtils>().setAvatar(postLoginResp.data!.user!.avatar.toString());
    Get.find<PrefUtils>().setUsername(postLoginResp.data!.user!.username.toString());
    Get.find<PrefUtils>().setPhone(postLoginResp.data!.user!.phone.toString());
    Get.find<PrefUtils>().setLastname(postLoginResp.data!.user!.lastname.toString());
    Get.find<PrefUtils>().setId(postLoginResp.data!.user!.id.toString());
    Get.find<PrefUtils>().setToken(postLoginResp.data!.token.toString());


    Get.find<PrefUtils>().setIsProvider(postLoginResp.data!.serviceProvider!.isProvider.toString());
    // final prov = postLoginResp.data.serviceProvider.isProvider;


    if(postLoginResp.data?.serviceProvider?.isProvider == true){
      logInModelObj.value.isProvider.value = postLoginResp.data!.serviceProvider!.isProvider!;
      Get.find<PrefUtils>().setIsProvider(postLoginResp.data!.serviceProvider!.isProvider.toString());
      Get.find<PrefUtils>().setIsProvider(postLoginResp.data!.serviceProvider!.isProvider.toString());
      Get.find<PrefUtils>().setFlight(postLoginResp.data!.serviceProvider!.flight.toString());
      Get.find<PrefUtils>().setCar(postLoginResp.data!.serviceProvider!.car.toString());
      Get.find<PrefUtils>().setHotel(postLoginResp.data!.serviceProvider!.hotel.toString());
    }


  }








  Future<void> LogInWithSocal(user) async {
    String type =  Get.find<PrefUtils>().getType();
    List<String> nameParts = user.displayName.split(" ");

    String firstName = nameParts[0]; // "Hossam"
    String lastName = nameParts[1]; // "Hassan"



      PostRegisterReq postRegisterReq = PostRegisterReq(
        password: user.id,
        mobile: user.id,
        firstname: firstName,
        lastname:lastName,
        email: user.email,
        type: type,

      );

      try {
        await  CallSocal(
          postRegisterReq.toJson(),
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

  void _onLoginSuccess() {
    // Get.toNamed(AppRoutes.homeHotelsContainer1Screen);
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

  Future<void> CallSocal(Map req) async {
    try {
      postLoginResp = await Get.find<ApiClient>().LoginWithSocal(
        headers: {
          'Content-Type': 'application/json',
        },
        requestData: req,
      );
      _handleCreateLoginSuccess();
    } on PostLoginResp catch (e) {
      postLoginResp = e;
      rethrow;
    }
  }






}

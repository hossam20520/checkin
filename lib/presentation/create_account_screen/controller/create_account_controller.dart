import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/create_account_screen/models/create_account_model.dart';
import 'package:flutter/material.dart';
import 'package:checkin/data/models/register/post_register_resp.dart';
import 'package:checkin/data/apiClient/api_client.dart';

import '../../../data/models/Country/CountryResp.dart';
import '../../../data/models/login/post_login_req.dart';
import '../../log_in_screen/controller/log_in_controller.dart';

class CreateAccountController extends GetxController {

  SelectionPopupModel? selectedDropDownValue;
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobilenumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  Rx<CreateAccountModel> createAccountModelObj = CreateAccountModel().obs;
  Rx<bool> isShowPassword = true.obs;
  PostRegisterResp postRegisterResp = PostRegisterResp();




  onSelected(dynamic value) {



    selectedDropDownValue = value as SelectionPopupModel;

    createAccountModelObj.update((model) {
      model!.selectedId.value = value.id.toString();
    });

    createAccountModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });



    createAccountModelObj.value.dropdownItemList.refresh();
  }



  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      await  CallGetCountries();
      // _onGetHotelSuccess();
    } on CountryResp {
      // _onGetHotelError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onGetHotelError();
      print(e);
      //TODO: Handle generic errors
    }

  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobilenumberController.dispose();
    passwordController.dispose();
  }


  CountryResp countryResp = CountryResp();


  Future<void> CallGetCountries() async {

    try {
      countryResp = await Get.find<ApiClient>().GetCountries(
          headers: {
            'Content-Type': 'application/json',
          },


      );

      _handleGetHotelSuccess();

    } on CountryResp catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }




  void _handleGetHotelSuccess() {

    final Itemslist = (countryResp.countries ?? []).map((items) {
      final countryCode =   Get.find<PrefUtils>().getLang();
      int? id = items.id;
      if(countryCode == "ar"){

        String title = items.ar_title.toString();
        return SelectionPopupModel(
          id: id,
          title: title,
          isSelected: false,
        );

      }else{
        String title = items.enTitle.toString();

        return SelectionPopupModel(
          id: id,
          title: title,
          isSelected: false,
        );

      }
      // Provide a default value for nullable string




    }).toList();

    createAccountModelObj.value.dropdownItemList.value = Itemslist;






  }


  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}

  // controller.hotelModelObj.value.id.value









  void fetchCountryItems() async {

    try {
      await  CallGetCountries();
      // _onLoginSuccess();
    } on CountryResp {
      // _onLoginError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onLoginSuccess();
      print(e);
      //TODO: Handle generic errors
    }

  }











  Future<void> callCreateRegister(Map req) async {
    try {
      postRegisterResp = await Get.find<ApiClient>().createRegister(
        headers: {
          'Content-Type': 'application/json',
        },
        requestData: req,
      );
      _handleCreateRegisterSuccess();
    } on PostRegisterResp catch (e) {
      postRegisterResp = e;
      rethrow;
    }
  }

  void _handleCreateRegisterSuccess() {
    PostLoginReq postLoginReq = PostLoginReq(
      phone: mobilenumberController.text,
      password: passwordController.text,
    );
   Get.find<LogInController>().LoginCont(postLoginReq);


  }
}

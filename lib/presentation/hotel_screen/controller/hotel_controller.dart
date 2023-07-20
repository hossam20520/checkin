
import 'dart:ui';

import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/password/post_passowrd_resp.dart';
import 'package:checkin/presentation/hotel_screen/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Hotel/get_hotel_detail.dart';

class HotelController extends GetxController {
  Rx<HotelModel> hotelModelObj = HotelModel().obs;
  HotelResponse hotelResponse = HotelResponse();




  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      await  CallGetHotelDetail();
      // _onGetHotelSuccess();
    } on HotelResponse {
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
  }


  SaveFav(){
    SaveFavItem();
  }


  Future<void> CallGetHotelDetail() async {

    try {
      hotelResponse = await Get.find<ApiClient>().GetHotelDetail(
          headers: {
            'Content-Type': 'application/json',
          },
          id: hotelModelObj.value.parama.value.toString()

      );

      _handleGetHotelSuccess();

    } on HotelResponse catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }




  void _handleGetHotelSuccess() {


    final countryCode =   Get.find<PrefUtils>().getLang();


    final ImagesHotel = (hotelResponse.images ?? []).map((image) {
      final item = image?.toString() ?? '';
      String url = Constants.imageHotels + item;
      return url;
    }).toList();

    hotelModelObj.value.images.value = ImagesHotel!;
    hotelModelObj.value.id.value = hotelResponse.id!;
    hotelModelObj.value.lat.value = hotelResponse.lat!;
    hotelModelObj.value.long.value = hotelResponse.long!;
    hotelModelObj.value.rate.value = hotelResponse.rate!;
    if (countryCode == 'ar') {
      hotelModelObj.value.title.value  =  hotelResponse.arName.toString() ;
      hotelModelObj.value.country.value  =  hotelResponse.country!.arName.toString();
      hotelModelObj.value.decsription.value  =  hotelResponse.arDescription!.toString();

    } else {
      hotelModelObj.value.title.value =  hotelResponse.enName.toString();
      hotelModelObj.value.country.value  =  hotelResponse.country!.enName.toString();
      hotelModelObj.value.decsription.value  =  hotelResponse.enDescription!.toString();
    }
  }


  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}

  // controller.hotelModelObj.value.id.value









  void fetchHotelsItems() async {

    try {
      await  CallGetHotelDetail();
      // _onLoginSuccess();
    } on HotelResponse {
      // _onLoginError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onLoginSuccess();
      print(e);
      //TODO: Handle generic errors
    }

  }





  PostPasswordResp  resp = PostPasswordResp();


  Future<void> SavFav() async {
    String token =  Get.find<PrefUtils>().getToken();
    try {
      resp = await Get.find<ApiClient>().SavFav(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer  '+ token
          },
          requestData: {

            'hotel':   hotelModelObj.value.id.value.toString(),

          }
      );
      _handleGetCarSuccess();
    } on PostPasswordResp catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }




  void _handleGetCarSuccess() {


    Get.rawSnackbar(message: "HotelAddedToFav".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: Colors.green  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.check , color: ColorConstant.whiteA700,)

    );

  }


  SaveFavItem() async {

    try {
      await  SavFav();
      // _onLoginSuccess();
    } on PostPasswordResp {
      // _onLoginError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onLoginSuccess();
      print(e);
      //TODO: Handle generic errors
    }

  }






}

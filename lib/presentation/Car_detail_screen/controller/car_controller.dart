import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Car/get_cars_resp.dart';

import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Car/get_car_resp.dart';
import '../models/FacilitesITesmModel.dart';
import '../models/car_model.dart';

class CarController extends GetxController {
  TextEditingController airconditioningController = TextEditingController();

  Rx<CarModel> roomModelObj = CarModel().obs;
  CarResp carResponse = CarResp();
  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      await  CallGetCarDetail();
      // _onGetHotelSuccess();
    } on CarResp {
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
    airconditioningController.dispose();
  }


final param = Get.arguments;



  Future<void> CallGetCarDetail() async {

    try {
      carResponse = await Get.find<ApiClient>().GetCar(
        headers: {
          'Content-Type': 'application/json',
        },
        id: param.toString() ,

      );
      _handleGetRoomSuccess();

    } on CarResp catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }




  void _handleGetRoomSuccess() {

    final countryCode =   Get.find<PrefUtils>().getLang();

    final facilites = (carResponse.facilitie ?? []).map((itms) {


      final image = itms.icon.toString() ?? "";

      if (countryCode == 'ar') {
        final title = itms.arName.toString() ?? "";
        return FacilitesItems( title: Rx(title), icon: Rx(image) );
      }else{
        final title = itms.enName.toString() ?? "";
        return FacilitesItems( title: Rx(title), icon: Rx(image) );
      }


    }).toList();


    roomModelObj.value.id.value = carResponse.id.toString();
    roomModelObj.value.carType.value = carResponse.cartype.toString();
    roomModelObj.value.image.value =   Constants.cars + carResponse.image.toString();
    roomModelObj.value.price.value = carResponse.priceperday.toString();
    roomModelObj.value.facilities.value = facilites;
    if (countryCode == 'ar') {
      roomModelObj.value.title.value = carResponse.arName.toString();

    }else{
      roomModelObj.value.title.value = carResponse.enName.toString();
    }




    // roomOneModelObj.value.facilitesITems = Rx(facilites);
    // print(roomResponse.room!.enName.toString());

    // roomOneModelObj.value.id.value  =  roomResponse.room!.id!.toInt();

    // roomOneModelObj.value.price.value  =  roomResponse.room!.pricePerNight!.toDouble();




    //
    // if (countryCode == 'ar') {
    //   roomOneModelObj.value.title.value  =  roomResponse.room!.arName.toString() ;
    //
    //   roomOneModelObj.value.description.value  =  roomResponse.room!.arDescription!.toString();
    //   roomOneModelObj.value.bed.value  =  roomResponse.room!.bed!.first.qty.toString() + " " +roomResponse.room!.bed!.first.arName!.toString();
    // } else {
    //   roomOneModelObj.value.title.value  =  roomResponse.room!.enName.toString() ;
    //   roomOneModelObj.value.description.value  =  roomResponse.room!.enDescription!.toString();
    //   roomOneModelObj.value.bed.value  =   roomResponse.room!.bed!.first.qty.toString() + " " + roomResponse.room!.bed!.first.enName!.toString();
    //
    //
    // }



  }


  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}




}

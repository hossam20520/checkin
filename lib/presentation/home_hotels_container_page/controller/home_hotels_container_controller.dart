import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';
import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_hotels_container_page/models/home_hotels_container_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Hotel/get_hotel_resp.dart';
import '../models/HotelsItemModel.dart';
import '../models/home_hotels_container_model.dart';

class HomeHotelsContainerController extends GetxController {
  HomeHotelsContainerController(this.homeHotelsContainerModelObj);

  TextEditingController nameController = TextEditingController();

  TextEditingController guestsroomsController = TextEditingController();

  TextEditingController destinationoneController = TextEditingController();

  TextEditingController destinationtwoController = TextEditingController();

  Rx<HomeHotelsContainerModel> homeHotelsContainerModelObj;

  DateTime selectedopenDatePickerDialogCheckinDate = DateTime.now();

  DateTime selectedopenDatePickerDialogDate = DateTime.now();


  HotelsResponse hotelsResponse = HotelsResponse();

  void search(){
    // if (_formKey.currentState!.validate()) {
    //   Get.toNamed(
    //     AppRoutes.searchResultsTwoScreen,
    //   );
    // }

  }

  @override
  void onReady() {
    super.onReady();
  Logger.PretteyLogger("One");
    fetchHotelsItems();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    guestsroomsController.dispose();
    destinationoneController.dispose();

    destinationtwoController.dispose();
  }





  Future<void> callGetHotels() async {
    // final parameter = Get.arguments;
    // print("0000000000000000000000000000000000");
    // print(parameter);
    try {
      hotelsResponse = await Get.find<ApiClient>().GetHotels(
        headers: {
          'Content-Type': 'application/json',
        },
          requestData: {
            'SortField': 'id',
            'SortType': 'desc',
            'search': '',
            'limit': 8,
            'page':1
          }
      );
      _handleCreateLoginSuccess();
    } on HotelsResponse catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }

  void _handleCreateLoginSuccess() {

    final hotelsItems = (hotelsResponse.hotels ?? []).map((hotel) {
      final imageUrl = Constants.imageHotels + hotel.image.toString() ?? ''; // Provide a default value for nullable string
     // Provide a default value for nullable string
      final id = hotel.id?.toInt() ?? 0; // Convert nullable int to string with a default value
      final price = hotel.price?.toDouble() ?? 0;

      final language =   Get.find<PrefUtils>().getLang();
      String title = "";
      String country = "";
      String coin = "";
      String rate = hotel.rate.toString();

      if(language == "ar"){
        title = hotel.arName.toString();
        country = hotel.country!.arName.toString();
        coin = hotel.ar_currency.toString();
      }else{
        country = hotel.country!.enName.toString();
        title = hotel.enName.toString();
        coin = hotel.en_currency.toString();


      }

      return HotelsItemModel(
        rate: Rx(rate),
        image: Rx(imageUrl),
        title: Rx(title),
        id: Rx(id),
        country: Rx(country),
        price: Rx(price),
        coin: Rx(coin)
      );




    }).toList();
    homeHotelsContainerModelObj.value.HotelsItems.value = hotelsItems;

  }


  void fetchHotelsItems() async {

    try {
      await  callGetHotels( );
      // _onLoginSuccess();
    } on HotelsResponse {
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
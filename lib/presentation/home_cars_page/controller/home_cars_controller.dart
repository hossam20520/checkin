import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Car/get_cars_resp.dart';
import 'package:checkin/presentation/home_cars_page/models/home_cars_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../models/home_cars_item_model.dart';

class HomeCarsController extends GetxController {
  HomeCarsController(this.homeCarsModelObj);

  TextEditingController searchController = TextEditingController();

  TextEditingController searchoneController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController dateoneController = TextEditingController();

  Rx<HomeCarsModel> homeCarsModelObj;
  CarsResp carssResponse = CarsResp();



  DateTime selectedopenDatePickUp = DateTime.now();
  DateTime selectedopenDateDrop = DateTime.now();
  TimeOfDay selectedopenTimePickUp = TimeOfDay.now();
  TimeOfDay selectedopenTimeDrop = TimeOfDay.now();

  @override
  void onReady() {
    super.onReady();
    // fetchCarsItems();

  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    searchoneController.dispose();
    dateController.dispose();
    dateoneController.dispose();
  }









  Future<void> callGetCars() async {
    try {
      carssResponse = await Get.find<ApiClient>().GetCars(
          headers: {
            'Content-Type': 'application/json',
          },
          requestData: {
            'SortField': 'id',
            'SortType': 'desc',
            'search':  '',
            'limit': 5,
            'page':1
          }
      );
      _handleGetCarSuccess();
    } on CarsResp catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }




  void _handleGetCarSuccess() {

    final CarsItems = (carssResponse.cars ?? []).map((car) {
       print(car.image);
      String price = car.priceperday.toString();
      String iamge = Constants.cars + car.image.toString();
       String cartype =   car.cartype.toString();
      String id = car.id.toString();
      final countryCode =   Get.find<PrefUtils>().getLang();
      String title =  "";
      if (countryCode == 'ar') {
         title = car.arName.toString();
      }else{
        title = car.enName.toString();
      }

      return HomeCarsItemModel(id:Rx(id) ,

        title: Rx(title) , price: Rx(price), image: Rx(iamge), carType: Rx(cartype)

      );




    }).toList();

     homeCarsModelObj.value.homeCarsItemList.value = CarsItems;


  }


    fetchCarsItems() async {

    try {
      await  callGetCars( );
      // _onLoginSuccess();
    } on CarsResp {
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

import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_flights_page/models/home_flights_model.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Flight/flight_response.dart';
import '../models/cards_item_model.dart';

class HomeFlightsController extends GetxController {
  HomeFlightsController(this.homeFlightsModelObj);

  TextEditingController searchController = TextEditingController();

  TextEditingController searchoneController = TextEditingController();

  DateTime selectedopenDatePickerDialogCheckinDate = DateTime.now();

  DateTime selectedopenDatePickerDialogDate = DateTime.now();

  Rx<HomeFlightsModel> homeFlightsModelObj;

  FlightsResponse flightsResponse = FlightsResponse();

  void search(){

    // homeFlightsModelObj.value.to.value = searchoneController.text;
    // homeFlightsModelObj.value.from.value = searchController.text;
    //


    Get.toNamed( AppRoutes.searchResultsOneScreen, );

  }

  @override
  void onReady() {
    super.onReady();
    fetchFlightssItems();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    searchoneController.dispose();
  }




  Future<void> callGetFlights() async {
    try {
      flightsResponse = await Get.find<ApiClient>().GetFlights(
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
      _handleCreateFlightSuccess();
    } on FlightsResponse catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }




  void _handleCreateFlightSuccess() {

    final FlightsItems = (flightsResponse.flights ?? []).map((flight) {
       String title = flight.countryIdTo.toString();
       String ariFrom = flight.airportFrom.toString();
       String departure_date = flight.departureDate.toString();
       String return_date = flight.returnDate.toString();
       double price = flight.price!.toDouble();
       String image =   Constants.flights + flight.image.toString();

       String id = flight.id.toString();
       return CardsItemModel(title: Rx(title) , id:Rx(id) ,
           airportFrom: Rx(ariFrom) ,
           price: Rx(price),
           departure_date: Rx(departure_date),
         return_date: Rx(return_date),
         image: Rx(image),

       );

    }).toList();


    homeFlightsModelObj.value.cardsItemList.value = FlightsItems;


  }


  void fetchFlightssItems() async {

    try {
      await  callGetFlights( );
      // _onLoginSuccess();
    } on FlightsResponse {
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



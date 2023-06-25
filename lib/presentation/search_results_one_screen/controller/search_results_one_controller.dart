import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Flight/flight_response.dart';
import 'package:checkin/presentation/home_flights_page/controller/home_flights_controller.dart';
import 'package:checkin/presentation/home_flights_page/home_flights_page.dart';
import 'package:checkin/presentation/search_results_one_screen/models/search_results_one_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../models/flightItemModel.dart';

class SearchResultsOneController extends GetxController {
  Rx<SearchResultsOneModel> searchResultsOneModelObj =
      SearchResultsOneModel().obs;


  FlightsResponse flightsResponse = FlightsResponse();

  @override
  void onReady() {
    super.onReady();
    fetchHotelsItems();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Rx<String> from = Get.find<HomeFlightsController>().homeFlightsModelObj.value.from;
  Rx<String> to = Get.find<HomeFlightsController>().homeFlightsModelObj.value.to;
  Rx<String> checkin = Get.find<HomeFlightsController>().homeFlightsModelObj.value.chekin;
  Rx<String> checkout = Get.find<HomeFlightsController>().homeFlightsModelObj.value.checkout;

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
            'from':from.toString(),
            'to':to.toString(),
            'checkin':checkin.toString(),
            'checkout':checkout.toString(),
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

    final fliteItems = (flightsResponse.flights ?? []).map((flight) {
      print("3333333333333333333333333333");

      // print(flight);

      String id = flight.id.toString();
      String image =  Constants.flights+ flight.image.toString();
      // print("dddddddddddddddddddddddd");

       // print(image);


     String from = flight.countryIdFrom.toString();
     String to = flight.countryIdTo.toString();
     String airfrom = flight.airportFrom.toString();
     String airto = flight.airportTo.toString();
     String price = flight.price.toString();
     String title = flight.countryIdTo.toString();


      return FlightItemModel(
          id: Rx(id),
          Image: Rx(image),
         from : Rx(from),
          to: Rx(to),
        airFrom : Rx(airfrom),
        airto: Rx(airto),
        title: Rx(title),
        price: Rx(price)
      );
    }).toList();

    searchResultsOneModelObj.value.flightItem.value  = fliteItems;
  }



  void fetchHotelsItems() async {

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

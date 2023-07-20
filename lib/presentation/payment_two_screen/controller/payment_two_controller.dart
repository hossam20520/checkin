import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Flight/Flight_detail_resp.dart';
import 'package:checkin/presentation/payment_two_screen/models/payment_two_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Book/book_flight_request.dart';
import '../../../data/models/Book/book_request.dart';
import '../../../data/models/Book/book_response.dart';
import '../../../data/models/Room/get_room_resp.dart';
import '../../home_flights_page/controller/home_flights_controller.dart';
import '../../home_hotels_container_page/controller/home_hotels_container_controller.dart';
import '../../room_one_screen/controller/room_one_controller.dart';

class PaymentTwoController extends GetxController {
  Rx<PaymentTwoModel> paymentTwoModelObj = PaymentTwoModel().obs;
  FlightDetailResp flightResponse = FlightDetailResp();


  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      await  CallGetFlightDetail();
      // _onGetHotelSuccess();
    } on FlightDetailResp {
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

  final parameter = Get.arguments;
  Future<void> CallGetFlightDetail() async {

    try {
      flightResponse = await Get.find<ApiClient>().GetFlightDetail(
        headers: {
          'Content-Type': 'application/json',
        },
        id:   parameter  ,
          // paymentTwoModelObj.value.parama.value.toString()
      );
      _handleGetRoomSuccess();

    } on FlightDetailResp catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }
  void _handleGetRoomSuccess() {
    paymentTwoModelObj.value.title?.value = flightResponse.countryIdTo.toString();

    paymentTwoModelObj.value.airportTo?.value = flightResponse.airportTo.toString();
    paymentTwoModelObj.value.airportFrom?.value = flightResponse.airportFrom.toString();
    paymentTwoModelObj.value.from?.value = flightResponse.countryIdFrom.toString();
    paymentTwoModelObj.value.to?.value = flightResponse.countryIdTo.toString();
    paymentTwoModelObj.value.price?.value = flightResponse.price!.toDouble();
    // flightResponse.airportTo

  }

  void _onGetHotelSuccess() {}
  void _onGetHotelError() {}



















  BookResponse bookResponse = BookResponse();


  Future<void> pay(cash) async {

    paymentTwoModelObj.value.type?.value  = cash;

    // Rx<String> checkin = Get.find<HomeFlightsController>().homeFlightsModelObj.value.chekin;
    // Rx<String> checkout = Get.find<HomeFlightsController>().homeFlightsModelObj.value.checkout;
    // Rx<String> from = Get.find<HomeFlightsController>().homeFlightsModelObj.value.from;
    // Rx<String> to = Get.find<HomeFlightsController>().homeFlightsModelObj.value.to;
    // Logger.PretteyLogger(checkin);
    PostFlightBookReq request = PostFlightBookReq(
      flightID: parameter,
      checkin: "0",
      checkout: "0",
      type: 'flight',
      payment: 'cash'

    );
  Logger.PretteyLogger( parameter);
    CallApi(request);
    // print(bed);
  }



  String token =  Get.find<PrefUtils>().getToken();





  Future<void> CallPay(Map req) async {
    // final requestData = json.encode(req.toJson());
    try {
      bookResponse = await Get.find<ApiClient>().Book(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer  '+ token
        },
        requestData: req,

      );
      _handleBookSuccess();

    } on BookResponse catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }

  void _handleBookSuccess() {


  }


  Future<void> CallApi(data) async {
    try {
      await  CallPay(data.toJson());
      _onPaymentSuccess();
    } on RoomResponse {
      // _onGetHotelError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      // _onGetHotelError();
      print(e);
      //TODO: Handle generic errors
    }
  }





  void _onPaymentSuccess() {



    paymentTwoModelObj.value.url.value = bookResponse.url.toString();

 Logger.PretteyLogger(bookResponse.url.toString());



    if (paymentTwoModelObj.value.type?.value.toString() == "cash"){
      Get.toNamed(
          AppRoutes.successFourScreen,
          arguments: "flight"
      );
    }else {

      Get.toNamed(
          AppRoutes.paymentWebScreen,
          arguments: "flight"

      );

    }








  }
















// GetFlightDetail
}

import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Book/book_response.dart';
import 'package:checkin/presentation/payment_screen/models/payment_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Book/book_request.dart';
import '../../../data/models/Room/get_room_resp.dart';
import '../../home_hotels_container_page/controller/home_hotels_container_controller.dart';
import '../../room_one_screen/controller/room_one_controller.dart';

class PaymentController extends GetxController {
  Rx<PaymentModel> paymentModelObj = PaymentModel().obs;


  BookResponse bookResponse = BookResponse();


  Future<void> pay(cash) async {

    paymentModelObj.value.type.value = cash;
    // final Uri url = Uri.parse('https://uatcheckout.thawani.om/pay/checkout_8SnI9vaEksQl3IYYPtglb9sFm0fLkknq5ZYU8rsAdfPKkUhF4u?key=HGvTMLDssJghr9tlN9gr4DVYt0qyBy');
    // if (!await launchUrl(url)) {
    //   throw Exception('Could not launch  ');
    // }
// Check if the device can handle the external link
//     if (await canLaunchUrl( externalUri )) {
//     await launchUrl(externalUri);
//     } else {
//     throw 'Could not launch $externalLink';
//     }

    Rx<String> roomInfo = Get.find<RoomOneController>().roomOneModelObj.value.title;
    Rx<int> ID = Get.find<RoomOneController>().roomOneModelObj.value.id;

    Rx<String> bed = Get.find<RoomOneController>().roomOneModelObj.value.bed;
    Rx<double> price = Get.find<RoomOneController>().roomOneModelObj.value.price;
    Rx<String> checkin = Get.find<HomeHotelsContainerController>().homeHotelsContainerModelObj.value.chekin;
    Rx<String> checkout = Get.find<HomeHotelsContainerController>().homeHotelsContainerModelObj.value.checkout;

    PostBookReq request = PostBookReq(
      roomID: ID.toString(),
      checkin: checkin.toString(),
      checkout: checkout.toString(),
      type: 'room',
      payment: cash,

    );

    CallApi(request);

  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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

    // bookResponse.bookID.toString();


    paymentModelObj.value.url.value = bookResponse.url.toString();


    if (paymentModelObj.value.type.value.toString() == "cash"){
      Get.toNamed(
          AppRoutes.successFourScreen,
          arguments: "room"
      );
    }else {
      Get.toNamed(
          AppRoutes.paymentWebScreen,
          arguments: "room"
      );
    }


  }
  void _onGetHotelError() {}



}

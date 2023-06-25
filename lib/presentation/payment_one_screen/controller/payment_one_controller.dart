import 'package:checkin/core/app_export.dart';
import 'package:checkin/presentation/home_cars_page/controller/home_cars_controller.dart';
import 'package:checkin/presentation/payment_one_screen/models/payment_one_model.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/Book/book_request.dart';
import '../../../data/models/Book/book_response.dart';
import '../../../data/models/Room/get_room_resp.dart';
import '../../Car_detail_screen/controller/car_controller.dart';
import '../../home_hotels_container_page/controller/home_hotels_container_controller.dart';
import '../../room_one_screen/controller/room_one_controller.dart';

class PaymentOneController extends GetxController {
  Rx<PaymentOneModel> paymentOneModelObj = PaymentOneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }




  @override
  void onClose() {
    super.onClose();
  }


















  BookResponse bookResponse = BookResponse();


  Future<void> pay() async {


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


    String  ID = Get.find<CarController>().carResponse.id.toString();
    Rx<String> pickup_date = Get.find<HomeCarsController>().homeCarsModelObj.value.PickUpDate;
    Rx<String> drop_off = Get.find<HomeCarsController>().homeCarsModelObj.value.DropDate;


    PostBookReq request = PostBookReq(
      roomID: ID,
      checkin: pickup_date.toString(),
      checkout: drop_off.toString(),
      type: 'car',
    );

    CallApi(request);

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
    // print("545555555555555555555555555555555555555");
    // print(bookResponse.url.toString());

    paymentOneModelObj.value.url.value = bookResponse.url.toString();

    Get.toNamed(
      AppRoutes.paymentWebScreen,
      arguments: "car"

    );

  }




}

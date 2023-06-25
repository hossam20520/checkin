import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/BookProvider/change_request_book.dart';
import 'package:checkin/data/models/BookProvider/change_request_book_resp.dart';
import 'package:checkin/presentation/payment_screen/models/payment_model.dart';
import 'package:checkin/presentation/request_details_one_screen/models/request_details_one_model.dart';
import 'package:flutter/material.dart';


import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/apiClient/api_client.dart';
import '../../requests_screen/controller/requests_controller.dart';
import '../../requests_screen/models/CarDataModel.dart';
import '../models/CarDataModel.dart';
import '../models/ClientDataModel.dart';
import '../models/FlightDataModelDetail.dart';
import '../models/PaymentDataModel.dart';
import '../models/RoomDataModel.dart';

/// A controller class for the RequestDetailsOneScreen.
///
/// This class manages the state of the RequestDetailsOneScreen, including the
/// current requestDetailsOneModelObj
class RequestDetailsOneController extends GetxController {
  Rx<RequestDetailsOneModel> requestDetailsOneModelObj =
      RequestDetailsOneModel().obs;

changeResponse changeresp = changeResponse();


  @override
  void onReady() {
    super.onReady();
     String type = Get.arguments['type'];
    final obj = Get.find<RequestsController>().requestsModelObj.value.requestsItemList.value[Get.arguments['index']];
    requestDetailsOneModelObj.value.type.value = type;

    //payment info
    String status = obj.paymentModelRq!.value.status.toString();
    String price  = obj.paymentModelRq!.value.totalPrice.toString();
    String bookId  = obj.bookId!.value.toString();
    requestDetailsOneModelObj.value.paymentModel.value = new PaymentDataModel(status: Rx(status) , totalPrice: Rx(price) , bookID: Rx(bookId))  ;

    //client info
    String name  = obj.clientModelReq!.value.clientName.toString();
    String phone  = obj.clientModelReq!.value.phone.toString();
    String email  = obj.clientModelReq!.value.email.toString();
    requestDetailsOneModelObj.value.clientDataModel.value = new ClientDataModel(name: Rx(name) , phone: Rx(phone) , email:Rx(email)  )  ;



    if(type  == "hotel"){
      String roomName  = obj.hotelModelReq!.value.name.toString();
      String checkIn  = obj.hotelModelReq!.value.checkin.toString();
      String checkout  = obj.hotelModelReq!.value.checkout.toString();
      String roomId  = obj.hotelModelReq!.value.id.toString();

      requestDetailsOneModelObj.value.roomDataModel.value = new RoomDataModel(
          name: Rx(roomName) ,
          checkIn: Rx(checkIn) , checkout:Rx(checkout) , roomId:Rx(roomId)   );

    }else if(type == "flight"){

      String from  = obj.flightdatamodel!.value.from.toString();
      String to  = obj.flightdatamodel!.value.to.toString();

      String flightID  = obj.flightdatamodel!.value.id.toString();

      requestDetailsOneModelObj.value.flightDataModelDetail.value = new FlightDataModelDetail( from: Rx(from) , to:Rx(to) , flightId:Rx(flightID)  );



    }else if (type  == "car"){

      String pickup  = obj.carBookDataModel!.value.pickup.toString();
      String dropoff  = obj.carBookDataModel!.value.dropoff.toString();
      String name  = obj.carBookDataModel!.value.name.toString();
      String carid  = obj.carBookDataModel!.value.id.toString();

      requestDetailsOneModelObj.value.carDataModel.value = new CarDataModelDetail( pickup: Rx(pickup) , dropoff:Rx(dropoff) , carID:Rx(carid) , name: Rx(name)   );

    }

  }

  @override
  void onClose() {
    super.onClose();
    Logger.PretteyLogger("clossed");
  }


  void Accept(accept){
    String type  = Get.arguments['type'];

    String bookId =  requestDetailsOneModelObj.value.paymentModel.value.bookID.toString();


    BookRequestChange request = BookRequestChange(
      id: bookId,
      type: type,
      accept:accept.toString(),
    );

    CallApi(request);





  }

  String token =  Get.find<PrefUtils>().getToken();

  Future<void> ChangeRequestCall(Map req) async {
    // final requestData = json.encode(req.toJson());
    try {
      changeresp = await Get.find<ApiClient>().ChangeRequest(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer  '+ token
        },
        requestData: req,

      );
      _handleBookSuccess();
      print(  "8888888888888888888888888888888888888");
      print( req.toString());
    } on changeResponse catch (e) {
      // HotelsResponse = e;

      rethrow;
    }
  }


  void _handleBookSuccess() {


  }


  Future<void> CallApi(data) async {
    try {
      await  ChangeRequestCall(data.toJson());
      _onChangeSuccess();
    } on changeResponse {
      _onPostPasswordError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      _onError();
      print(e);
      //TODO: Handle generic errors
    }
  }



  void _onPostPasswordError(){
    // Get.rawSnackbar(message: "passwordIncorrect".tr ,
    //     snackPosition:SnackPosition.TOP  ,
    //     backgroundColor: ColorConstant.red900  ,
    //     margin: EdgeInsets.all(20.0),
    //     borderRadius: 10,
    //     animationDuration: Duration(seconds: 1),
    //     icon: Icon(Icons.error , color: ColorConstant.whiteA700,)
    //
    // );
  }

  void _onChangeSuccess() {
    ProgressDialogUtils.hideProgressDialog();
    Get.back();
    Get.rawSnackbar(message: "RequestAccepted".tr ,
        snackPosition:SnackPosition.TOP  ,
        backgroundColor: Colors.green  ,
        margin: EdgeInsets.all(20.0),
        borderRadius: 10,
        animationDuration: Duration(seconds: 1),
        icon: Icon(Icons.check , color: ColorConstant.whiteA700,)

    );
    ProgressDialogUtils.hideProgressDialog();
    // Get.toNamed(
    //   AppRoutes.paymentWebScreen,
    //
    // );

  }
  void _onError() {

    // Get.rawSnackbar(message: "messageServer".tr ,
    //     snackPosition:SnackPosition.TOP  ,
    //     backgroundColor: ColorConstant.red900  ,
    //     margin: EdgeInsets.all(20.0),
    //     borderRadius: 10,
    //     animationDuration: Duration(seconds: 1),
    //     icon: Icon(Icons.error , color: ColorConstant.whiteA700,)
    // );

  }


}

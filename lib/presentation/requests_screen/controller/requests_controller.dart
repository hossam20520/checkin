import 'package:checkin/core/app_export.dart';
import 'package:checkin/data/models/Book/RequestsResponse.dart';
import 'package:checkin/data/models/Book/RoomReqResp.dart';
import 'package:checkin/presentation/requests_screen/models/CarDataModel.dart';
import 'package:checkin/presentation/requests_screen/models/FlightDataModel.dart';
import 'package:checkin/presentation/requests_screen/models/requests_model.dart';

import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/apiClient/api_client.dart';
import '../../request_details_one_screen/models/PaymentDataModel.dart';
import '../models/ClientModelData.dart';
import '../models/HotelDataModel.dart';
import '../models/requests_item_model.dart';

/// A controller class for the RequestsScreen.
///
/// This class manages the state of the RequestsScreen, including the
/// current requestsModelObj
class RequestsController extends GetxController {
  Rx<RequestsModel> requestsModelObj = RequestsModel().obs;




    RequestsResponse requestsResponse = RequestsResponse();


  @override
  void onReady() {
    super.onReady();
    // String param =  Get.arguments;

    fetchRoomItems();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> CallGetRequestRoom() async {
    ProgressDialogUtils.hideProgressDialog();
    String param =  Get.arguments;
    String token = Get.find<PrefUtils>().getToken();
    try {
      requestsResponse = await Get.find<ApiClient>().GetRequestsRoom(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer  '+ token
          },
          requestData: {
            'SortField': 'id',
            'SortType': 'desc',
            'type':  param.toString(),
            'limit': 5,
            'page':1
          }
      );
      _handleRoomRequestsSuccess();
    } on RequestsResponse catch (e) {
      // HotelsResponse = e;
      rethrow;
    }
  }
  void _handleRoomRequestsSuccess() {
    ProgressDialogUtils.hideProgressDialog();

    final roomItems = (requestsResponse.roomReqestResp ?? []).map((item) {
      //book info
      String id = item.id.toString();


      //payment Info
      String status = item.paymentStatut.toString();
      String price = item.totalCost.toString();



      //client info
      String phone = item.clients!.phone.toString();
      String email = item.clients!.email.toString();
      String fname = item.clients!.firstname.toString();
      String lname = item.clients!.lastname.toString();
      String name = fname +" "+ lname;




      ClientModelData clientModel = new ClientModelData(clientName: Rx(name) , phone: Rx(phone)  , email: Rx(email));
      PaymentDataModel paymentDatamodel = new PaymentDataModel(status: Rx(status) , totalPrice: Rx(price));




      String checkin = item.checkin.toString();
      String checkout = item.checkout.toString();
      String arName = item.room!.arName.toString();
      String roomID = item.id.toString();
      HotelDataModel hotelData = new HotelDataModel(checkin: Rx(checkin) , checkout: Rx(checkout)
          , name: Rx(arName) , id: Rx(roomID));

      return RequestsItemModel(
        type: Rx("hotel"),
         bookId: Rx( id.toString()) ,
         paymentModelRq: Rx(paymentDatamodel),
         hotelModelReq: Rx(hotelData) ,
         clientModelReq: Rx(clientModel),

      );

    }).toList();




    final carItems = (requestsResponse.carReqestResp ?? []).map((item) {
      //book info
      String id = item.id.toString();


      //payment Info
      String status = item.paymentStatut.toString();
      String price = item.totalCost.toString();



      //client info
      String phone = item.clients!.phone.toString();
      String email = item.clients!.email.toString();
      String fname = item.clients!.firstname.toString();
      String lname = item.clients!.lastname.toString();
      String name = fname +" "+ lname;




      ClientModelData clientModel = new ClientModelData(clientName: Rx(name) , phone: Rx(phone)  , email: Rx(email));
      PaymentDataModel paymentDatamodel = new PaymentDataModel(status: Rx(status) , totalPrice: Rx(price));




      String checkin = item.pickup.toString();
      String checkout = item.dropoff.toString();
      String arName = item.car!.arName.toString();
      String carID = item.car!.id.toString();

      CarDataModel carData = new CarDataModel(pickup: Rx(checkin) , dropoff: Rx(checkout)
          , name: Rx(arName) , id: Rx(carID));


      return RequestsItemModel(
        type: Rx("car"),
        bookId: Rx( id.toString()) ,
        paymentModelRq: Rx(paymentDatamodel),
        carBookDataModel: Rx(carData) ,
        clientModelReq: Rx(clientModel),

      );

    }).toList();



    final flightItems = (requestsResponse.flightReqestResp ?? []).map((item) {
      //book info
      String id = item.id.toString();


      //payment Info
      String status = item.paymentStatut.toString();
      String price = item.totalCost.toString();



      //client info
      String phone = item.clients!.phone.toString();
      String email = item.clients!.email.toString();
      String fname = item.clients!.firstname.toString();
      String lname = item.clients!.lastname.toString();
      String name = fname +" "+ lname;




      ClientModelData clientModel = new ClientModelData(clientName: Rx(name) , phone: Rx(phone)  , email: Rx(email));
      PaymentDataModel paymentDatamodel = new PaymentDataModel(status: Rx(status) , totalPrice: Rx(price));




      String from = item.countryFrom.toString();
      String to = item.countryTo.toString();

      String flightID = item.flightId!.toString();

      FlightDataModel flightdata = new FlightDataModel(from: Rx(from) , to: Rx(to) , id: Rx(flightID));


      return RequestsItemModel(
        type: Rx("flight"),
        bookId: Rx( id.toString()) ,
        paymentModelRq: Rx(paymentDatamodel),
        flightdatamodel: Rx(flightdata),
        clientModelReq: Rx(clientModel),

      );

    }).toList();

    String param =  Get.arguments;

    if(param == "car"){
      requestsModelObj.value.requestsItemList.value = carItems;
    }else if(param == "hotel"){
      requestsModelObj.value.requestsItemList.value = roomItems;
    }else if(param == "flights"){
      requestsModelObj.value.requestsItemList.value = flightItems;
    }else{
      Logger.PretteyLogger(param);
    }









  }
  void fetchRoomItems() async {

    try {
      await  CallGetRequestRoom( );
      // _onLoginSuccess();
    } on RequestsResponse {
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

import 'package:checkin/presentation/requests_screen/models/FlightDataModel.dart';
import 'package:checkin/presentation/requests_screen/models/HotelDataModel.dart';
import 'package:get/get.dart';

import '../../request_details_one_screen/models/PaymentDataModel.dart';
import 'CarDataModel.dart';
import 'ClientModelData.dart';
import 'RoomBookDataModel.dart';

/// This class is used in the [requests_item_widget] screen.
class RequestsItemModel {

  Rx<String>? bookId = Rx("");
  Rx<String>? type = Rx("");

  Rx<ClientModelData>? clientModelReq = Rx(new ClientModelData(  ));
  Rx<PaymentDataModel>? paymentModelRq = Rx(new PaymentDataModel() );
  Rx<HotelDataModel>? hotelModelReq = Rx(new HotelDataModel() );
  Rx<RoomBookDataModel>? roomBookDataModel = Rx(new RoomBookDataModel() );
  Rx<FlightDataModel>? flightdatamodel = Rx(new FlightDataModel() );
  Rx<CarDataModel>? carBookDataModel = Rx(new CarDataModel() );
  // Rx<String>? roomName = Rx("");
  // Rx<String>? checkin = Rx("");
  // Rx<String>? checkout = Rx("");
  // Rx<String>? roomID = Rx("");

 RequestsItemModel({ this.type,  this.flightdatamodel, this.hotelModelReq, this.carBookDataModel ,    this.clientModelReq   , this.paymentModelRq , this.bookId , this.roomBookDataModel

     // this.roomName, this.checkout, this.checkin, this.roomID

 });




}

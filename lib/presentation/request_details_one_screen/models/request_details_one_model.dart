import 'package:get/get_rx/src/rx_types/rx_types.dart';


import 'CarDataModel.dart';
import 'ClientDataModel.dart';
import 'FlightDataModelDetail.dart';
import 'PaymentDataModel.dart';
import 'RoomDataModel.dart';



/// This class defines the variables used in the [request_details_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RequestDetailsOneModel {
  Rx<String> type = Rx("");
  Rx<String> id = Rx("");


  Rx<RoomDataModel> roomDataModel = Rx(new RoomDataModel());
  Rx<CarDataModelDetail> carDataModel = Rx(new CarDataModelDetail());
  Rx<FlightDataModelDetail> flightDataModelDetail = Rx(new FlightDataModelDetail());
  Rx<PaymentDataModel> paymentModel = Rx(new PaymentDataModel());
  Rx<ClientDataModel> clientDataModel = Rx(new ClientDataModel());
  Rx<ClientDataModel> ClientModel = Rx(new ClientDataModel());
}

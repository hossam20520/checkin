import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FlightDataModelDetail{

  Rx<String>? from = Rx("");
  Rx<String>? to = Rx("");
  Rx<String>? flightId = Rx("");

  FlightDataModelDetail({
    this.from, this.to, this.flightId
  });
// Rx<String> id
// Rx<String> id
}
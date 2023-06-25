import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FlightDataModel{

  Rx<String>? from = Rx("");
  Rx<String>? to = Rx("");
  Rx<String>? id = Rx("");

  FlightDataModel({
    this.from, this.to,  this.id
  });


}
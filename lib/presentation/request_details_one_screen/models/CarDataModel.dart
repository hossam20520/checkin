import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CarDataModelDetail{

Rx<String>? pickup = Rx("");
Rx<String>? dropoff = Rx("");
Rx<String>? name = Rx("");
Rx<String>? carID = Rx("");

CarDataModelDetail({
  this.name, this.pickup, this.dropoff, this.carID
});
  // Rx<String> id
  // Rx<String> id 
}
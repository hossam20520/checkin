import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RoomDataModel{

Rx<String>? checkIn = Rx("");
Rx<String>? checkout = Rx("");
Rx<String>? name = Rx("");
Rx<String>? roomId = Rx("");

RoomDataModel({
  this.name, this.checkout, this.checkIn, this.roomId
});
  // Rx<String> id
  // Rx<String> id 
}
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HotelDataModel{

  Rx<String>? checkin = Rx("");
  Rx<String>? checkout = Rx("");
  Rx<String>? name = Rx("");
  Rx<String>? id = Rx("");

  HotelDataModel({
    this.checkin, this.checkout, this.name , this.id
});


}
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RoomBookDataModel{

  Rx<String>? checkin = Rx("");
  Rx<String>? checkout = Rx("");
  Rx<String>? name = Rx("");
  Rx<String>? roomId = Rx("");

  RoomBookDataModel({
    this.checkin, this.checkout, this.name , this.roomId
  });


}
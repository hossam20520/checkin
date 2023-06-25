import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CarDataModel{

  Rx<String>? pickup = Rx("");
  Rx<String>? dropoff = Rx("");
  Rx<String>? name = Rx("");
  Rx<String>? id = Rx("");

  CarDataModel({
    this.pickup, this.dropoff, this.name , this.id
  });


}
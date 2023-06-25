import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ClientDataModel{
Rx<String>? phone  = Rx("");
Rx<String>? name = Rx("");
Rx<String>? email = Rx("");

ClientDataModel({
  this.phone , this.name , this.email
});


}
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ClientModelData{

  Rx<String>? clientName = Rx("");
  Rx<String>? phone = Rx("");
  Rx<String>? email = Rx("");

  ClientModelData({
    this.clientName, this.phone , this.email
});

}
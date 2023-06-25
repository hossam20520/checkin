import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PaymentDataModel{

  Rx<String>? paid = Rx("");
  Rx<String>? price = Rx("");
  Rx<String>? date = Rx("");
  PaymentDataModel({ this.paid, this.price, this.date});

}
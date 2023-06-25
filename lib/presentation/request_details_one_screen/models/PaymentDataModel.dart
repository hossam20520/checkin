import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PaymentDataModel{
  Rx<String>? status = Rx("");
  Rx<String>? totalPrice = Rx("");
  Rx<String>? bookID = Rx("");


  PaymentDataModel({
    this.status , this.totalPrice  ,this.bookID
});
}
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NotificatonItem{
  Rx<String>? title  = Rx("");
  Rx<String>? message = Rx("");


  NotificatonItem({
    this.title, this.message
});
}
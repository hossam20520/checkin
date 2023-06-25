import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LogInModel {
  Rx<bool> isProvider = Rx(false);
  Rx<String> flight = Rx("");
  Rx<String> car = Rx("");
  Rx<String> hotel = Rx("");

}

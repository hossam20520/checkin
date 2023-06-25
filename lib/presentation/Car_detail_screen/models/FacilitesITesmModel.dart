import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FacilitesItems {
  Rx<String>? id = Rx("");
  Rx<String>? title = Rx("");
  Rx<String>? icon = Rx("");


  FacilitesItems({
    this.id, this.title , this.icon
});
}
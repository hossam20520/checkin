import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'FacilitesITesmModel.dart';

class CarModel {
  Rx<String> id = Rx("");
  Rx<String> title = Rx("");
  Rx<String> image = Rx("");
  Rx<String> carType = Rx("");
  Rx<String> price = Rx("");
  Rx<List<FacilitesItems>> facilities = Rx([]);


}

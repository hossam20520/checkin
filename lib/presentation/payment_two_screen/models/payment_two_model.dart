import 'package:get/get.dart';
import 'paymenttwo_item_model.dart';

class PaymentTwoModel {
  Rx<String> parama = Rx("");

  Rx<String> url = Rx("");
  Rx<String>? id = Rx("");
  Rx<String>? title = Rx("");
  Rx<String>? image = Rx("");
  Rx<String>? from = Rx("");
  Rx<String>? to = Rx("");
  Rx<String>? airportFrom = Rx("");
  Rx<String>? airportTo = Rx("");
  Rx<String>? departure_date = Rx("");
  Rx<String>? return_date = Rx("");
  Rx<double>? price = Rx(0);

  Rx<String>? type = Rx("");



  Rx<List<PaymenttwoItemModel>> paymenttwoItemList =   Rx(List.generate(2, (index) => PaymenttwoItemModel()));
}

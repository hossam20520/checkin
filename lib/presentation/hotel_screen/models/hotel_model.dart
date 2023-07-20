import 'package:get/get.dart';
import 'chipviewframe10_item_model.dart';

class HotelModel {
  Rx<String>  parama = Rx("");
  Rx<int>  id = Rx(0);

  Rx<String>  title = Rx("");
  Rx<double>  price = Rx(0);
  Rx<String> country = Rx("");
  Rx<String> lat = Rx("");
  Rx<String> long = Rx("");
  Rx<String> rate = Rx("");
  Rx<String> decsription = Rx("");
  Rx<List<String>> images = Rx([]);

  HotelModel();

  // HotelModel.fromJson(Map<String, dynamic> json) {
  //   id =   Rx(json['id'] );
  //   title = Rx(json['title']);
  //   price = Rx(json['price']);
  //   country =    Rx(json['country']);
  //
  // }







  Rx<List<Chipviewframe10ItemModel>> chipviewframe10ItemList =
      Rx(List.generate(4, (index) => Chipviewframe10ItemModel()));
}

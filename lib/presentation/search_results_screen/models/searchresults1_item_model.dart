import 'package:get/get.dart';

class Searchresults1ItemModel {
  Rx<String> compactcarwithTxt = Rx("Compact car with:");

  Rx<String>? id = Rx("");
  Rx<String>? title = Rx("");
  Rx<String>? image = Rx("");
  Rx<String>? price = Rx("");
  Rx<String>? carType = Rx("");
  Searchresults1ItemModel({
    this.id, this.title, this.image , this.price , this.carType
  });


}

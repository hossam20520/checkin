import 'package:get/get.dart';

/// This class is used in the [home_cars_item_widget] screen.
class HomeCarsItemModel {
  Rx<String> economyTxt = Rx("Economy");

  Rx<String> priceTxt = Rx("900 OMR");

  Rx<String>? id = Rx("");
  Rx<String>? title = Rx("");
  Rx<String>? image = Rx("");
  Rx<String>? price = Rx("");
  Rx<String>? carType = Rx("");
  HomeCarsItemModel({
    this.id, this.title, this.image , this.price , this.carType
});

}

import 'package:get/get.dart';

/// This class is used in the [bookings_item_widget] screen.
class BookingsItemModel {
  Rx<String> roomtypeTxt = Rx("Budget Double Room");

  Rx<String> roomTxt = Rx("Room");

  Rx<String> periodTxt = Rx("per night");

  Rx<String>? id = Rx("");


  Rx<String>? title = Rx("");
  Rx<String>? image = Rx("");
  Rx<String>? price = Rx("");
  Rx<String>? type = Rx("");
  BookingsItemModel({
    this.title, this.image, this.price, this.type
});

}

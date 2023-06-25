import 'package:get/get.dart';

class RoomoptionsItemModel {
  Rx<String> roomtypeTxt = Rx("Triple Room with Pool View");

  Rx<String> priceTxt = Rx("3000 OMR");



  Rx<int>? id = Rx(0);
  Rx<String>? image = Rx("");
  Rx<String>? title = Rx("");
  Rx<String>? bed = Rx("");
  Rx<double>? price = Rx(0);
  Rx<String>?  people = Rx("0");


  RoomoptionsItemModel({
    this.id,
    this.image,
    this.title,
    this.price,
    this.bed,
     this.people
  });

}

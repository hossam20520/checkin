

import 'package:checkin/data/models/Hotel/get_hotel_resp.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HotelsItemModel{
  Rx<int>? id = Rx(0);
  Rx<String>? image = Rx("");
  Rx<String>? title = Rx("");
  Rx<double>? price = Rx(0);
  Rx<String>? country = Rx("");

  HotelsItemModel({
    this.id,
    this.image,
    this.title,
     this.price,
    this.country,
  });

  HotelsItemModel.fromJson(Map<Hotel, dynamic> json) {
    id =   Rx(json['id'] );
    image =  Rx( json['image'] );
    title = Rx(json['title']);
    price = Rx(json['price']);



  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> hotel = {};
    if (this.id != null) {
      hotel['id'] = this.id;
    }
    if (this.image != null) {
      hotel['image'] = this.image;
    }

    if (this.title != null) {
      hotel['title'] = this.title;
    }


    return hotel;
  }


}
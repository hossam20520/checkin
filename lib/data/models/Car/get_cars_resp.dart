

import 'package:checkin/data/models/register/post_register_resp.dart';

class CarsResp {
  List<Car>? cars;
  int? totalRows;

  CarsResp({
    this.cars,
    this.totalRows,
  });


  CarsResp.fromJson(Map<String, dynamic> json) {
    totalRows = json['totalRows'];
    cars = (json['cars'] as List<dynamic>).map((CarJson) => Car.fromJson(CarJson)).toList();
  }

}





class Car {
  int? id;
  String? arName;
  String? enName;
  String? cartype;
  double? priceperday;
  String? image;


  Car({
    this.id,
    this.arName,
    this.enName,
    this.cartype,
    this.priceperday,
    this.image,
  });


  Car.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    cartype = json['car_type'];
    priceperday = json['price_per_day'].toDouble();
    image  =json['image'];
  }
}



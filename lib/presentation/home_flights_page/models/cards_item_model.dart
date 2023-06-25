import 'package:get/get.dart';

class CardsItemModel {
  Rx<String> originTxt = Rx("Abu Dhabi");

  Rx<String> timeTxt = Rx("Fri, 21 Jul - 10 : 30 AM");

  Rx<String> departureflightTxt = Rx("HBE - AUH with Wizz Air Abu Dhabi");

  Rx<String> timeoneTxt = Rx("Tue, 8 Aug - 12 : 00 PM");

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


  CardsItemModel({ this.price, this.departure_date, this.return_date,
    this.id, this.title, this.image, this.from, this.to , this.airportFrom , this.airportTo
   });



}

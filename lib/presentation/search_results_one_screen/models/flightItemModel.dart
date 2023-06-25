import 'package:get/get.dart';

class FlightItemModel {
  Rx<String> timeTxt = Rx("Tue, 16 May - 10 : 30 AM");

  Rx<String> caibeywithegyptTxt = Rx("CAI - BEY with EgyptAir");

  Rx<String>? id = Rx("");
  Rx<String>? title = Rx("");
  Rx<String>? from = Rx("");
  Rx<String>? to = Rx("");
  Rx<String>? airFrom = Rx("");
  Rx<String>? airto = Rx("");
  Rx<String>? price = Rx("");
  Rx<String>? Image = Rx("");

  FlightItemModel({
    this.id, this.title, this.from, this.to , this.airFrom, this.airto, this.price , this.Image
});

}

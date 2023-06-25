import 'package:get/get.dart';

/// This class is used in the [requests_item_widget] screen.
class RequestRoom {
  Rx<String>? price = Rx("");
  Rx<String>? status = Rx("");
  

  Rx<String>? idBook = Rx("");
  Rx<String>? clientName = Rx("");
  Rx<String>? mobileClient = Rx("");
  Rx<String>? clientEmail = Rx("");
  Rx<String>? idClient = Rx("");

  Rx<String>? roomName = Rx("");
  Rx<String>? hotelName = Rx("");
  Rx<String>? checkIn = Rx("");
  Rx<String>? checkout = Rx("");
  Rx<String>? idRoom = Rx("");

  RequestRoom({ this.roomName , this.hotelName, this.checkIn, this.checkout , this.idBook , this.idClient , this.idRoom });




}

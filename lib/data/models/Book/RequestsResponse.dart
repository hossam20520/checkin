


import 'package:checkin/data/models/Book/FlightRequestResp.dart';

import 'CarRequestsResp.dart';
import 'RoomReqResp.dart';
// import 'RoomReqResp.dart';

class RequestsResponse {
  // List<Books>? books;
  List<RoomRequestResp>? roomReqestResp;
  List<CarsReqResp>? carReqestResp;
  List<FlightRequestResp>? flightReqestResp;
  String? type;
  RequestsResponse({  this.carReqestResp, this.type});

  RequestsResponse.fromJson(Map<String, dynamic> json) {
    roomReqestResp =  (json['books'] as List<dynamic>).map((item) => RoomRequestResp.fromJson(item)).toList();

    carReqestResp =  (json['cars'] as List<dynamic>).map((item) => CarsReqResp.fromJson(item)).toList();
    flightReqestResp =  (json['flights'] as List<dynamic>).map((item) => FlightRequestResp.fromJson(item)).toList();
    type = json['type'];
  }


}
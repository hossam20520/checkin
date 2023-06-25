import 'package:checkin/data/models/Book/CarRequestsResp.dart';

// class RoomRequestResp {
//   List<Books>? books;
//
//   // List<FlightRe>? carsResp;
//   String? type;
//
//   RoomRequestResp({this.books,  this.type});
//
//   RoomRequestResp.fromJson(Map<String, dynamic> json) {
//     books =  (json['books'] as List<dynamic>).map((item) => Books.fromJson(item)).toList();
//
//     type = json['type'];
//   }
//
//
//
// }

class RoomRequestResp {
  int? id;
  int? providerId;
  String? sessionId;
  int? clientId;
  String? phone;
  int? roomId;
  String? numberRooms;
  String? arName;
  String? enName;
  int? totalCost;
  String? checkin;
  String? checkout;
  String? paymentStatut;
  int? accept;

  String? createdAt;
  String? updatedAt;

  Clients? clients;
  Room? room;

  RoomRequestResp(
      {this.id,
        this.providerId,
        this.sessionId,
        this.clientId,
        this.phone,
        this.roomId,
        this.numberRooms,
        this.arName,
        this.enName,
        this.totalCost,
        this.checkin,
        this.checkout,
        this.paymentStatut,
        this.accept,

        this.createdAt,
        this.updatedAt,

        this.clients,
        this.room});

  RoomRequestResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    sessionId = json['session_id'];
    clientId = json['client_id'];
    phone = json['phone'];
    roomId = json['room_id'];
    numberRooms = json['number_rooms'];
    arName = json['ar_name'];
    enName = json['en_name'];
    totalCost = json['totalCost'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    paymentStatut = json['payment_statut'];
    accept = json['accept'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


    clients =   json['clients'] != null ? Clients.fromJson(json['clients']) : null;
    room =   json['room'] != null ? Room.fromJson(json['room']) : null;

  }


}

class Clients {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;



  Clients(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.phone,
      });

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];

    email = json['email'];

    phone = json['phone'];


  }

}

class Room {
  int? id;
  String? enName;
  String? arName;


  Room(
      {this.id,

        this.enName,
        this.arName,
 });

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    enName = json['en_name'];
    arName = json['ar_name'];

  }


}

class Hotel {
  int? id;
  String? arName;
  String? enName;
  String? address;
  int? countryId;
  String? phoneNumber;
  String? image;
  int? price;
  String? enDescription;
  String? arDescription;
  String? lat;
  String? lng;
  String? createdAt;
  String? updatedAt;


  Hotel(
      {this.id,
        this.arName,
        this.enName,
        this.address,
        this.countryId,
        this.phoneNumber,
        this.image,
        this.price,
        this.enDescription,
        this.arDescription,
        this.lat,
        this.lng,
        this.createdAt,
        this.updatedAt,
        });

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    address = json['address'];
    countryId = json['country_id'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    price = json['price'];
    enDescription = json['en_description'];
    arDescription = json['ar_description'];
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }


}
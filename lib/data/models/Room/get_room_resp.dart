

class RoomResponse {
  Room? room;


  RoomResponse({
    this.room,

  });

  RoomResponse.fromJson(Map<String, dynamic> json) {
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }

}

class Room{
  int? id;
  int? hotelId;
  String? roomNumber;
  int? personNumbers;
  String? enName;
  String? arName;
  String? enDescription;
  String? arDescription;
  double? pricePerNight;
  String? image;
  int? isAvailable;
  List<Facility>? facilitie;
  List<Bed>? bed;


  Room({
    this.id,
    this.arName,
    this.enName,
    this.roomNumber,
    this.personNumbers,
    this.pricePerNight,
    this.enDescription,
    this.arDescription,
    this.isAvailable,
    this.image,
    this.facilitie,
    this.bed
  });


  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    roomNumber = json['room_number'];
    personNumbers = json['person_numbers'];
    pricePerNight = json['price_per_night'].toDouble();
    enDescription = json['en_description'];
    arDescription = json['ar_description'];
    isAvailable = json['isAvailable'];
    image = json['image'];
    facilitie = (json['facilitie'] as List<dynamic>).map((facilitieJson) => Facility.fromJson(facilitieJson)).toList();
    bed = (json['bed'] as List<dynamic>).map((bedJson) => Bed.fromJson(bedJson)).toList();

  }

  }
class Facility {
  int? id;
  String? arName;
  String? enName;
  String? icon;
  int? roomId;

  Facility({
    this.id,
    this.arName,
    this.enName,
    this.icon,
    this.roomId
});


  Facility.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    icon  = json['icon'];
    roomId  = json['roomId'];

  }



}


class Bed {
  int? id;
  String? arName;
  String? enName;
  int? roomId;
  int? qty;

  Bed({
    this.id,
    this.arName,
    this.enName,
    this.qty,
    this.roomId
});


  Bed.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    qty  = json['qty'];
    roomId  = json['roomId'];

  }



}
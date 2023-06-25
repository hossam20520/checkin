// class CarRequestResp {
//   // List<Books>? books;
//   String? type;
//
//   CarRequestResp({this.books, this.type});
//
//   CarRequestResp.fromJson(Map<String, dynamic> json) {
//     books =  (json['books'] as List<dynamic>).map((item) => Books.fromJson(item)).toList();
//     type = json['type'];
//   }
//
// }

class CarsReqResp {
  int? id;
  int? providerId;
  int? clientId;
  String? phone;
  int? carId;
  int? totalCost;
  String? pickup;
  String? dropoff;
  String? paymentStatut;
  int? accept;
  String? refundMoney;

  Clients? clients;
  Car? car;

  CarsReqResp(
      {this.id,
        this.providerId,
        this.clientId,
        this.phone,
        this.carId,
        this.totalCost,
        this.pickup,
        this.dropoff,
        this.paymentStatut,
        this.accept,
        this.refundMoney,

        this.clients,
        this.car});

  CarsReqResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    clientId = json['client_id'];
    phone = json['phone'];
    carId = json['car_id'];
    totalCost = json['totalCost'];
    pickup = json['pickup'];
    dropoff = json['dropoff'];
    paymentStatut = json['payment_statut'];
    accept = json['accept'];
    refundMoney = json['refundMoney'];


    clients =   json['clients'] != null ? Clients.fromJson(json['clients']) : null;
    car =   json['car'] != null ? Car.fromJson(json['car']) : null;

  }


}

class Clients {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;

  Clients({this.id, this.firstname, this.lastname, this.email, this.phone});

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
  }


}

class Car {
  int? id;
  String? arName;
  String? enName;

  Car({this.id, this.arName, this.enName});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
  }


}
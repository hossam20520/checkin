class FlightRequestResp {
  int? id;
  int? providerId;
  String? countryFrom;
  String? countryTo;
  int? clientId;
  String? phone;
  int? flightId;
  int? totalCost;
  String? dep;
  String? returnDate;
  String? paymentStatut;
  int? accept;
  String? refundMoney;
  Clients? clients;


  FlightRequestResp(
      {this.id,
      this.providerId,
      this.countryFrom,
      this.countryTo,
      this.clientId,
      this.phone,
      this.flightId,
      this.totalCost,
      this.dep,
      this.returnDate,
      this.paymentStatut,
      this.accept,
      this.refundMoney,
      this.clients,
      });

  FlightRequestResp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    countryFrom = json['country_from'];
    countryTo = json['country_to'];
    clientId = json['client_id'];
    phone = json['phone'];
    flightId = json['flight_id'];
    totalCost = json['totalCost'];
    dep = json['dep'];
    returnDate = json['return'];
    paymentStatut = json['payment_statut'];
    accept = json['accept'];
    refundMoney = json['refundMoney'];


    clients =  json['clients'] != null ? new Clients.fromJson(json['clients']) : null;

  }
}

class Clients {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? avatar;
  String? phone;
  int? roleId;
  int? statut;
  String? updatedAt;

  Clients({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.avatar,
    this.phone,
    this.roleId,
    this.statut,
    this.updatedAt,
  });

  Clients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
    roleId = json['role_id'];
    statut = json['statut'];
    updatedAt = json['updated_at'];
  }
}


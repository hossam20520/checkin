

class CarResp{
  int? id;
  String? arName;
  String? enName;
  String? cartype;
  double? priceperday;
  String? image;
  List<Facility>? facilitie;
  String? en_currency;
  String? ar_currency;

  CarResp({
    this.id,
    this.arName,
    this.enName,
    this.cartype,
    this.priceperday,
    this.image,
    this.facilitie,
    this.en_currency,
    this.ar_currency
  });


  CarResp.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    en_currency = json['en_currency'];
    ar_currency = json['ar_currency'];
    cartype = json['car_type'];
    priceperday = json['price_per_day'].toDouble();
    image  = json['image'];
    facilitie = (json['facilitie'] as List<dynamic>).map((facilitieJson) => Facility.fromJson(facilitieJson)).toList();
  }

}


class Facility {
  int? id;
  String? arName;
  String? enName;
  String? icon;
  String? carId;

  Facility({
    this.id,
    this.arName,
    this.enName,
    this.icon,
    this.carId
  });


  Facility.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    icon  = json['icon'];
    carId  = json['car_id'];

  }



}

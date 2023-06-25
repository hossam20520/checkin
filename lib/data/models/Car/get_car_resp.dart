

class CarResp{
  int? id;
  String? arName;
  String? enName;
  String? cartype;
  double? priceperday;
  String? image;
  List<Facility>? facilitie;


  CarResp({
    this.id,
    this.arName,
    this.enName,
    this.cartype,
    this.priceperday,
    this.image,
    this.facilitie
  });


  CarResp.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
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

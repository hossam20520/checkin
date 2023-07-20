

import 'package:checkin/data/models/register/post_register_resp.dart';

class HotelsResponse {
   List<Hotel>? hotels;
   int? totalRows;

  HotelsResponse({
     this.hotels,
     this.totalRows,
  });


  HotelsResponse.fromJson(Map<String, dynamic> json) {
    totalRows = json['totalRows'];

    hotels = (json['hotels'] as List<dynamic>).map((hotelJson) => Hotel.fromJson(hotelJson)).toList();


  }

}





class Hotel {
  int? id;
  String? arName;
  String? enName;
  String? phoneNumber;
  String? address;
  double? price;
  String? enDescription;
  String? arDescription;
  String? image;
  Country? country;
  String? en_currency;
  String? ar_currency;
  String? rate;
  Hotel({
      this.id,
      this.arName,
      this.enName,
      this.phoneNumber,
      this.address,
      this.price,
      this.enDescription,
      this.arDescription,
      this.country,
      this.image,
       this.rate,
       this.en_currency,
      this.ar_currency
  });


    Hotel.fromJson(Map<String, dynamic> json) {
      id  = json['id'];
      arName = json['ar_name'];
      enName = json['en_name'];
      phoneNumber  = json['phone_number'];
      address  = json['address'];
      price  = json['price'].toDouble();
      enDescription  = json['en_description'];
      arDescription  = json['ar_description'];
      country  = json['country'] != null ? Country.fromJson(json['country']) : null;
      image  =json['image'];
      rate  =json['rate'];
      en_currency = json['en_currency'];
      ar_currency = json['ar_currency'];
  }
}

class Country{
  int? id;
  String? arName;
  String? enName;


  Country({ this.id , this.arName, this.enName });

  Country.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];

  }


}

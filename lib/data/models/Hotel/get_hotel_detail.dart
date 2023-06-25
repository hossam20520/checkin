

class HotelResponse{
  int? id;
  String? arName;
  String? enName;
  String? phoneNumber;
  String? address;
  double? price;
  String? enDescription;
  String? arDescription;
  Country? country;
  List<String>? images;

  // String? images;

  HotelResponse({
    this.id,
    this.arName,
    this.enName,
    this.phoneNumber,
    this.address,
    this.price,
    this.enDescription,
    this.arDescription,
    this.country,
   this.images,
  });


  HotelResponse.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
    phoneNumber  = json['phone_number'];
    address  = json['address'];
    price  = json['price'].toDouble();
    enDescription  = json['en_description'];
    arDescription  = json['ar_description'];
    country =   json['country'] != null ? Country.fromJson(json['country']) : null;
    images = json['images'] != null ? List<String>.from(json['images']) : null;


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
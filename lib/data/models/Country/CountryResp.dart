class CountryResp{

  List<Country>? countries;


  CountryResp({
    this.countries,

  });


  CountryResp.fromJson(Map<String, dynamic> json) {
    countries = (json['countries'] as List<dynamic>).map((CarJson) => Country.fromJson(CarJson)).toList();
  }







}


class Country{
  int? id;
  String? enTitle;
  String? ar_title;
  String? currency_id;
  Currency? currency;





  Country.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    enTitle = json['en_title'];
    ar_title = json['ar_title'];
    currency_id = json['currency_id'];
    currency =   json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }



}

class Currency{


  int? id;
  String? code;
  String? name;
  String? symbol;


  Currency.fromJson(Map<String, dynamic> json) {
    id  = json['id'];
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];

  }

}
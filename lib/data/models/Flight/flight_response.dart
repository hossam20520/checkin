class FlightsResponse{
  List<Flight>? flights;
  int? totalRows;

  FlightsResponse({
    this.flights,
    this.totalRows,
  });

  FlightsResponse.fromJson(Map<String, dynamic> json) {
    totalRows = json['totalRows'];
    flights = (json['flights'] as List<dynamic>).map((hotelJson) => Flight.fromJson(hotelJson)).toList();
  }



}



class Flight {
  int? id;
  String? countryIdFrom;
  String? countryIdTo;
  String? airportFrom;
  String? airportTo;
  String? leaveTime;
  String? arriveTime;
  String? departureDate;
  String? returnDate;
  String? num;
  String? degree;
  String? active;
  int? price;
  String? image;
  String? en_currency;
  String? ar_currency;

  Flight({
    this.id,
    this.countryIdFrom,
    this.countryIdTo,
    this.airportFrom,
    this.airportTo,
    this.leaveTime,
    this.arriveTime,
    this.departureDate,
    this.returnDate,
    this.num,
    this.degree,
    this.active,
    this.price,
    this.image,
    this.en_currency,
    this.ar_currency

  });


  Flight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryIdFrom = json['country_id_from'];
    countryIdTo = json['country_id_to'];
    airportFrom = json['airport_from'];
    airportTo = json['airport_to'];
    leaveTime = json['leave_time'];
    arriveTime = json['arrive_time'];
    departureDate = json['departure_date'];
    returnDate = json['return_date'];
    num = json['num'];
    degree = json['degree'];
    active = json['active'];
    price = json['price'];
    image = json['image'];
    en_currency = json['en_currency'];
    ar_currency = json['ar_currency'];
  }


}
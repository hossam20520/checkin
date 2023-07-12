class PostFlightBookReq {
  String? flightID;
  String? checkin;
  String? checkout;
  String? type;
  String? payment;



  PostFlightBookReq({
    this.flightID,
    this.checkin,
    this.checkout,
    this.payment,
    this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.flightID != null) {
      data['flight_id'] = this.flightID;
    }
    if (this.checkin != null) {
      data['checkin'] = this.checkin;
    }
    if (this.checkout != null) {
      data['checkout'] = this.checkout;
    }
    if (this.type != null) {
      data['type'] = this.type;
    }

    if (this.payment != null) {
      data['payment'] = this.payment;
    }

    return data;
  }

}
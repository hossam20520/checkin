class PostBookReq {
  String? roomID;
  String? checkin;
  String? checkout;
  String? type;
  String? payment ;



  PostBookReq({
    this.roomID,
    this.checkin,
    this.checkout,
    this.type,
    this.payment

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.roomID != null) {
      data['room_id'] = this.roomID;
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

    if (this.type != null) {
      data['payment'] = this.type;
    }


    return data;
  }

}
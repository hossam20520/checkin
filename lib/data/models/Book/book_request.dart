class PostBookReq {
  String? roomID;
  String? checkin;
  String? checkout;
  String? type;



  PostBookReq({
    this.roomID,
    this.checkin,
    this.checkout,
    this.type});

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


    return data;
  }

}
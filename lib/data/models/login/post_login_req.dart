class PostLoginReq {
  String? phone;
  String? password;

  PostLoginReq({this.phone, this.password});

  PostLoginReq.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.phone != null) {
      data['phone'] = this.phone;
    }
    if (this.password != null) {
      data['password'] = this.password;
    }
    return data;
  }
}

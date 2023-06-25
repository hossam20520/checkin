class PostPassowrdReq {
  String? oldPassword;
  String? password;
  String? phone;

  PostPassowrdReq({this.oldPassword, this.password , this.phone});

  PostPassowrdReq.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    password = json['new_password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.oldPassword != null) {
      data['old_password'] = this.oldPassword;
    }
    if (this.password != null) {
      data['new_password'] = this.password;
    }

    if (this.phone != null) {
      data['phone'] = this.phone;
    }
    return data;
  }
}

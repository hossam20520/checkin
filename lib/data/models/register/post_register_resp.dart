class PostRegisterResp {
  int? status;
  String? message;
  // Data? data;

  PostRegisterResp({this.status, this.message });

  PostRegisterResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.status != null) {
      data['status'] = this.status;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }
    // if (this.data != null) {
    //   data['data'] = this.data?.toJson();
    // }
    return data;
  }
}

class Data {
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile;
  String? role;
  int? id;

  Data(
      {this.username,
      this.mobile,
      this.email,
      this.firstname,
      this.lastname,
      this.role,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.firstname != null) {
      data['firstname'] = this.firstname;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.lastname != null) {
      data['lastname'] = this.lastname;
    }
    if (this.mobile != null) {
      data['mobile'] = this.mobile;
    }
    if (this.role != null) {
      data['role'] = this.role;
    }

    if (this.id != null) {
      data['id'] = this.id;
    }
    return data;
  }
}

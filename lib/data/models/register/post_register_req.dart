class PostRegisterReq {

  String? password;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile;
  String? type;
  String? cce_id;


  PostRegisterReq(
      {
      this.password,
      this.email,
      this.firstname,
      this.lastname,
      this.mobile,
      this.type,
       this.cce_id,
   });

  PostRegisterReq.fromJson(Map<String, dynamic> json) {

    password = json['password'];
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['phone'];
    type = json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (this.password != null) {
      data['password'] = this.password;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.firstname != null) {
      data['firstname'] = this.firstname;
    }
    if (this.lastname != null) {
      data['lastname'] = this.lastname;
    }
    if (this.mobile != null) {
      data['phone'] = this.mobile;
    }

    if (this.type != null) {
      data['type'] = this.type;
    }

    if (this.cce_id != null) {
      data['cce_id'] = this.cce_id;
    }


    return data;
  }
}

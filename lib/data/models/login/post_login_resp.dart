class PostLoginResp {
  String? status;
  String? message;
  Data? data;

  PostLoginResp({this.status, this.message, this.data});

  PostLoginResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.status != null) {
      data['status'] = this.status;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}


class Data{
   User? user;
   String?  token;
   Provider?  serviceProvider;
   Data({this.user,this.token, this.serviceProvider});

   Data.fromJson(Map<String, dynamic> json) {
     // user = json['user'];
     user = json['user'] != null ? User.fromJson(json['user']) : null;
     serviceProvider = json['service_provider'] != null ? Provider.fromJson(json['service_provider']) : null;
     token = json['token'];
   }


   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = {};
     if (this.user != null) {
       data['user'] = this.user?.toJson();

     }

     if (this.token != null) {
       data['token'] = this.token;

     }

     return data;
   }


}



class Provider{
bool? isProvider;
bool? flight;
bool? car;
bool? hotel;


Provider({
  this.isProvider, this.flight, this.car, this.hotel
});


Provider.fromJson(Map<String, dynamic> json) {
  isProvider = json['isProvider'];
  flight = json['flight'];
  car = json['car'];
  hotel = json['hotel'];

}


}


class User {

  String? firstname;
  String? lastname;
  String? email;
  String? username;
  String? phone;
  String? avatar;
  int? id;


  User( {
      this.firstname,
      this.lastname,
    this.username,
    this.phone,
      this.email,
      this.id,
    this.avatar,
      });

  User.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    avatar = json['avatar'];

    phone = json['phone'];
    username = json['username'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = {};
    if (this.firstname != null) {
      user['firstname'] = this.firstname;
    }
    if (this.lastname != null) {
      user['lastname'] = this.lastname;
    }
    if (this.email != null) {
      user['email'] = this.email;
    }


    if (this.username != null) {
      user['username'] = this.username;
    }
    if (this.phone != null) {
      user['phone'] = this.phone;
    }

    if (this.id != null) {
      user['id'] = this.id;
    }

    return user;
  }
}

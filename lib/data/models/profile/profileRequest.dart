class ProfileRequest {
  String? firstname;
  String? lastname;
  String? email;
  String? phone;

  ProfileRequest({this.firstname, this.lastname , this.phone , this.email});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.firstname != null) {
      data['firstname'] = this.firstname;
    }
    if (this.lastname != null) {
      data['lastname'] = this.lastname;
    }

    if (this.email != null) {
      data['email'] = this.email;
    }

    if (this.phone != null) {
      data['phone'] = this.phone;
    }
    return data;
  }
}

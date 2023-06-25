class PostPasswordResp {
  String? status;
  String? message;


  PostPasswordResp({this.status, this.message});

  PostPasswordResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.status != null) {
      data['status'] = this.status;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }

    return data;
  }
}



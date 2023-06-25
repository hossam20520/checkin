class NotificationResp {
  List<Noti>? noti;

  NotificationResp({this.noti});

  NotificationResp.fromJson(Map<String, dynamic> json) {
    noti = (json['noti'] as List<dynamic>).map((item) => Noti.fromJson(item)).toList();

  }


}

class Noti {
  int? id;
  int? clientId;
  String? title;
  String? message;
  String? read;


  Noti(
      {
        this.id,
        this.clientId,
        this.title,
        this.message,
        this.read,
 });

  Noti.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    title = json['title'];
    message = json['message'];
    read = json['read'];

  }


}
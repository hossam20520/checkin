class BookRequestChange{

String? type;
String? id;
String? accept;


BookRequestChange({ this.type, this.id , this.accept });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.type != null) {
      data['type'] = this.type;
    }


    if (this.id != null) {
      data['id'] = this.id;
    }

    if (this.accept != null) {
      data['accept'] = this.accept;
    }



    return data;
  }


}
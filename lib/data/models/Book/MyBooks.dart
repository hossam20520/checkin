class MyBooks {
  List<Mybook>? mybooks;

  MyBooks({this.mybooks});

  MyBooks.fromJson(Map<String, dynamic> json) {
    mybooks =  (json['mybooks'] as List<dynamic>).map((item) => Mybook.fromJson(item)).toList();

  }


}

class Mybook {
  int? id;
  String? title;
  String? bookId;
  String? sessionId;
  String? clientId;
  String? image;
  String? type;
  String? price;



  Mybook(
      {this.id,
        this.title,
        this.bookId,
        this.sessionId,
        this.clientId,
        this.image,
        this.type,
        this.price,

 });

  Mybook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bookId = json['book_id'];
    clientId = json['client_id'];
    image = json['image'];
    type = json['type'];
    price = json['price'];


  }


}
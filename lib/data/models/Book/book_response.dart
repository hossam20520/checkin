

class BookResponse{
   int? bookID;
   String? url;

   BookResponse({
     this.bookID,
     this.url
});

   BookResponse.fromJson(Map<String, dynamic> json) {
     bookID = json['book_id'];
     url = json['url'];
   }

}
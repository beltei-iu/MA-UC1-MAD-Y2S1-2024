
class Book {

  int? id;
  String? title;
  String? author;

  Book(this.id, this.title, this.author);

   Book.fromMap(Map<String, dynamic> map):
    id = map["id"],
    title = map["title"],
    author = map["author"];

  Map<String,dynamic> toMap() => {
    'id' : id,
    'title': title,
    'author': author
  };
}
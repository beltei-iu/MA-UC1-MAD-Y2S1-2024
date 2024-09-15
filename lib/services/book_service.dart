
import 'package:mad/db/db_helper.dart';
import 'package:mad/model/book.dart';

class BookService {

  Future<List<Book>> getBookList() async {
    final db = await DbHelper.instance.database;
    final List<Map<String,dynamic>> results = await db.query('book');
    return results.map((book) => Book.fromMap(book)).toList();
  }

  Future<int> insertBook(Book book) async{
    final db = await DbHelper.instance.database;
    int result = await db.insert('book', book.toMap());
    return result;
  }
}
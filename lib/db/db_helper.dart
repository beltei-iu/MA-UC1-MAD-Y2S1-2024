
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  static final DbHelper instance = DbHelper._init();
  static Database? _database;
  DbHelper._init();

  Future<Database> get database async {
    if(_database != null){
      return _database!;
    }else{
      _database = await _initDB('book.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, onCreate: _createTable, version: 1);
  }

  Future _createTable(Database db, int version) async{
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const sql = '''
      CREATE TABLE book(
       id $idType,
       title $textType,
       author $textType
      )
    ''';
    await db.execute(sql);
  }
}
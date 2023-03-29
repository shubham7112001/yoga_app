import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class YogaDatabase{
  static final YogaDatabase instance = YogaDatabase._init();
  static Database? _database;
  YogaDatabase._init();

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path  = join(dbPath,filePath);

    return await openDatabase(path,version: 1);
  }

  _createDB(Database db, int version){
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    // id, bool(Seconds), text

    db.execute('''
    CREATE TABLE BeginnerYoga{
    
    }
    ''');

  }
}
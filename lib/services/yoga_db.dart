import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yoga_app/Data/models/yoga_model.dart';

class YogaDatabase{
  static final YogaDatabase instance = YogaDatabase._init();
  static Database? _database;
  YogaDatabase._init();

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path  = join(dbPath,filePath);

    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _initializeDB('YogaStepsDB.db');
    return _database;
  }

  Future _createDB(Database db, int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    // id, bool(Seconds), text

    await db.execute('''
    CREATE TABLE BeginnerYoga(
    ${YogaModel.IdName} $idType,
    ${YogaModel.YogaName} $textType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsOrNot} $boolType
    )
    ''');
  }

  Future<Yoga?> _insert(Yoga yoga) async {
    final db = await instance.database;
    final id = await db!.insert(YogaModel.YogaTable1, yoga.toJson());

    return yoga.copy(id: id);
  }

  Future<List<Yoga>> readAllYoga() async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IdName} ASC';
    final query_res = await db!.query(YogaModel.YogaTable1, orderBy: orderBy);

    return query_res.map((json) => Yoga.fromJson(json)).toList();
  }

  Future<Yoga?> readOneYoga(int id) async {
    final db = await instance.database;
    final map = await db!.query(YogaModel.YogaTable1,columns: YogaModel.YogaTable1ColumnName,where: '${YogaModel.IdName} = ?' , whereArgs: [id]);

    if(map.isNotEmpty){
      return Yoga.fromJson(map.first);
    } else {
      return null;
    }
  }

}
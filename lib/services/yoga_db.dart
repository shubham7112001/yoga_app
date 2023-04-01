import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:yoga_app/Data/models/yoga_model.dart';
import 'package:yoga_app/Data/models/yoga_summary_model.dart';

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
    final intType = 'INTEGER NOT NULL';

    // id, bool(Seconds), text

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaTable1}(
    ${YogaModel.IdName} $idType,
    ${YogaModel.YogaName} $intType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsOrNot} $boolType,
    ${YogaModel.SecondsOrTimes} $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaTable2}(
    ${YogaModel.IdName} $idType,
    ${YogaModel.YogaName} $textType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsOrNot} $boolType,
    ${YogaModel.SecondsOrTimes} $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaTable3}(
    ${YogaModel.IdName} $idType,
    ${YogaModel.YogaName} $textType,
    ${YogaModel.ImageName} $textType,
    ${YogaModel.SecondsOrNot} $boolType,
    ${YogaModel.SecondsOrTimes} $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE ${YogaModel.YogaSummary}(
    ${YogaModel.IdName} $idType,
    // ${YogaModel.YogaKey} $intType,
    ${YogaModel.YogaWorkOutName} $textType,
    ${YogaModel.BackImg} $textType,
    ${YogaModel.TimeTaken} $textType,
    ${YogaModel.TotalNoOfWorkOut} $textType
    )
    ''');



  }

  Future<Yoga?> insert(Yoga yoga, String tableName) async {
    final db = await instance.database;
    final id = await db!.insert(tableName, yoga.toJson());

    return yoga.copy(id: id);
  }


  Future<YogaSummary?> insertYogaSummary(YogaSummary yogaSummary) async {
    final db = await instance.database;
    final id = await db!.insert(YogaModel.YogaSummary, yogaSummary.toJson());

    return yogaSummary.copy(id: id);
  }

  Future<List<Yoga>> readAllYoga(String tableName) async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IdName} ASC';
    final query_res = await db!.query(tableName, orderBy: orderBy);

    return query_res.map((json) => Yoga.fromJson(json)).toList();
  }

  Future<List<YogaSummary>> readAllYogaSummary() async {
    final db = await instance.database;
    final orderBy = '${YogaModel.IdName} ASC';
    final query_res = await db!.query(YogaModel.YogaSummary, orderBy: orderBy);

    return query_res.map((json) => YogaSummary.fromJson(json)).toList();
  }

  Future<Yoga?> readOneYoga(int id,String tableName) async {
    final db = await instance.database;
    final map = await db!.query(tableName,columns: YogaModel.YogaTable1ColumnName,where: '${YogaModel.IdName} = ?' , whereArgs: [id]);

    if(map.isNotEmpty){
      return Yoga.fromJson(map.first);
    } else {
      return null;
    }
  }

}
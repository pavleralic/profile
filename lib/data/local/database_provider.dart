import 'package:athlon_task/data/local/profile_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final _instance = DatabaseProvider._internal();
  static DatabaseProvider get = _instance;
  bool isInitialized = false;
  late Database _db;
  final dataBaseName = 'athlon_task.db';

  DatabaseProvider._internal();

  Future<Database> db() async {
    if (!isInitialized) await _init();
    return _db;
  }

  Future _init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dataBaseName);
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(ProfileDao().createTableQuery);
    });
  }

  Future deleteDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dataBaseName);
    deleteDatabase(path);
  }
}

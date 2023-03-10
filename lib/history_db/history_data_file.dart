import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'history_db_model.dart';



class DB {
  static Database? db;
  static String table = "history";
  static String id = "id";
  static String title = "save_history";
  static String time="save_time";
  // static String valuetittle="save_value";
  // static String script = "script";

  static Future<Database> get dbisLoaded async {
    if (null != db) return db!;
    db = await initDB();
    return db!;
  }

  static Future<Database> initDB() async {
    var directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}/storhistory.db";
    var db = await openDatabase(path, version: 1, onCreate: onCreate);
    return db;
  }

  static onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table($id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,$title TEXT,$time TEXT)");
  }

  static Future<List<H_data>> gethistory() async {
    var db = await dbisLoaded;
    List<Map<String, dynamic>> data = await db.rawQuery("SELECT * FROM $table");
    return data.map((e) => H_data.fromJson(e)).toList();
  }

  static Future<H_data> save(H_data save) async {
    var db = await dbisLoaded;
    List<Map<String, dynamic>> data = await db.rawQuery(
        "SELECT EXISTS(SELECT * FROM $table WHERE $id = '${save.id}')");
    data[0]["EXISTS(SELECT * FROM $table WHERE $id = '${save.id}')"] == 1
        ? null
        : db.insert(table, save.toJson());
    return save;
  }

  static delete() async {
    var db = await dbisLoaded;
    db.delete(table);
  }
}

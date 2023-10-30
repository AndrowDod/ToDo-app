import 'dart:async';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_2/models/database_model.dart';

class DbHellper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'androw.db');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 5, onUpgrade: _onupgrade);
    return mydb;
  }

  _onupgrade(Database db, int oldversion, int newversion) {
    log('upgrade====================');
  }

  _oncreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "tasks"(
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "task" TEXT NOT NULL,
    "comp" INTEGER NOT NULL
     )
    ''');
    log("oncreate =================");
  }

//read data
  Future<List<Map<dynamic, dynamic>>> readData() async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query("tasks");
    return response;
  }

// insert data
  insertData(TaskModel task) async {
    Database? mydb = await db;
    int response = await mydb!.insert("tasks", task.toMap());
    return response;
  }

  //update data
  updatedata(TaskModel task) async {
    Database? mydb = await db;
    int response = await mydb!
        .update("tasks", task.toMap(), where: 'id = ?', whereArgs: [task.id]);
    return response;
  }

  //delete data
  deletedata(int id) async {
    Database? mydb = await db;
    int response =
        await mydb!.delete("tasks", where: 'id = ?', whereArgs: [id]);
    return response;
  }
}

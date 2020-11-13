import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoverse/models/task.dart';

class DatabaseHelper
{
Future<Database> database() async
{
  return openDatabase(
    join(await getDatabasesPath(),'todo.db'),
    onCreate: (db, version) async {
      await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
      await db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, isDone INTEGER)");
      return db;
    },
    version: 1,
  );
}

  Future<void> insertTask(Task task) async
  {
    Database _db=await database();
    await _db.insert('tasks', task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

}
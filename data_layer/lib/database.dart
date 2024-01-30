import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class StorageDBProvider {
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  late Database database;
  Future<void> init() async {
    String _databasesPath = await getDatabasesPath();
    String _path = _databasesPath + '/test_db3.db';

    database = await openDatabase(_path, version: 3, onConfigure: _onConfigure,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE order_history (id INTEGER PRIMARY KEY, order_service_type TEXT, phone TEXT, street TEXT, house TEXT, flat TEXT, entrance TEXT, floor TEXT, doorphone TEXT, payment_type TEXT, sum TEXT)');

       await db.execute(
          'CREATE TABLE order_position (id INTEGER PRIMARY KEY, product_id TEXT, amount TEXT, FOREIGN KEY (order_id)  REFERENCES order_history (id) ON DELETE CASCADE))');    
    });
  }
  
  }
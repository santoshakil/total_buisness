import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "Database.db";
  static final _databaseVersion = 1;
  static final productTable = 'product_table';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnDiscription = 'discription';
  static final columnQuantityType = 'quantity_type';
  static final columnQuantity = 'quantity';
  static final columnPrice = 'price';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getExternalStorageDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $productTable (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT,
            $columnQuantity DOUBLE,
            $columnQuantityType TEXT,
            $columnPrice DOUBLE,
            $columnDiscription TEXT
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row,
      {ConflictAlgorithm conflictAlgorithm}) async {
    Database db = await instance.database;
    return await db.insert(productTable, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(productTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(productTable, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(productTable);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $productTable'));
  }
}

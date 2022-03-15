// ignore_for_file: prefer_const_declarations, avoid_print, prefer_typing_uninitialized_variables, unused_field

import 'dart:async';

import 'package:e_commerce/database/db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
    static final _databaseName = 'MyDatavase.db';
    static final _databaseVersion = 1;
    
    static final table = 'tbl_order';
    static final proid = 'product_id';
    static final proName = 'name';
    static final proQuantity = 'qty';
    static final proPrice = 'sale_price';
    static final tPrice = 'amount';
    static final rPrice = 'regular_rate';
    static final pImg = 'imagelink';

    static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async{
    if(_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $proid INTEGER PRIMARY KEY,
        $proName TEXT NOT NULL,
        $proQuantity INTEGER NOT NULL,
        $proPrice INTEGER NOT NULL,
        $tPrice INTEGER NOT NULL,
        $pImg TEXT NOT NULL
      )
      '''
    );
  }

//inserted row
  Future<int> insert(Map<String,dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // ignore: todo
  //TODO
  newClient(Model model) async{
    final db = await database;
    var res = await db.rawInsert(
      "INSERT Into $table ($proid,$proName,$proQuantity,$proPrice,$tPrice,$pImg)"
        "VALUES (${model.pid},${model.pName},${model.pQuantity},${model.pPrice},${model.tPrice},${model.pImg}),"
    );
    return res;
  }

  // All
  Future<List<Map<String,dynamic>>> queryAllRows() async{
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int?> queryRowCount() async{
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  
  Future checkProduct(String checkId) async{
    final db = await instance.database;
    var returnID;
    returnID = Sqflite.firstIntValue(await db.rawQuery('SELECT $proid FROM $table WHERE $proid=$checkId'));
    print(returnID);
    return returnID;
  }

  Future<int> updateCartList(Map<String,dynamic> row, int proID) async{
    Database db = await instance.database;

    return await db.update(table, row, where: '$proid = ?', whereArgs: [proID]);
  }

  Future<int> update(Map<String,dynamic> row) async{
    Database db = await instance.database;
    int id = row[proid];
    return await db.update(table, row, where: '$proid = ?',whereArgs: [id]);
  }

  Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete(table,where: '$proid = ?',whereArgs: [id]);
  }

  Future deleteall() async{
    final db = await database;
    db.delete(table);
  }

  Future<int?> subtotal() async{
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT SUM($tPrice) FROM $table'));
  }


}
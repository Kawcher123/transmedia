import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:transmedia/data/models/cart_database_fields_model.dart';
import 'package:transmedia/data/models/cart_model.dart';

class SqliteService {
  static SqliteService? _sqliteService;

  static Database? _database;

  SqliteService._();

  static SqliteService get sqliteService => _sqliteService ??= SqliteService._();
  static const String _databaseName = "database.db";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_databaseName';
    return await openDatabase(path, version: 1, onCreate: _createDatabase, singleInstance: true);
  }

  Future<void> _createDatabase(Database database, int version) async {
    print('SqliteService._createDatabase....');
    try {
      await database.execute("""CREATE TABLE IF NOT EXISTS ${CartFields.tableName} (
       ${CartFields.id} ${CartFields.intType},
       ${CartFields.title} ${CartFields.textType},
       ${CartFields.qty} ${CartFields.intType},
       ${CartFields.price} ${CartFields.doubleType},
       ${CartFields.image} ${CartFields.textTypeNULL},
       ${CartFields.idType}
      )      
      """);
    } on Exception catch (e) {
      // TODO
      debugPrint('Local database error.................. $e');
    }
  }

  Future<int> createItem(CartModel cartModel) async {
    final db = await sqliteService.database;
    final id = await db.insert(CartFields.tableName, cartModel.toJson());
    return id;
  }

  Future<List<CartModel>> readAll() async {
    final db = await sqliteService.database;
    final result = await db.query(CartFields.tableName);
    return result.map((json) => CartModel.fromJson(json)).toList();
  }

  Future<int> update(CartModel cartModel) async {
    final db = await sqliteService.database;
    return db.update(
      CartFields.tableName,
      cartModel.toJson(),
      where: '${CartFields.id} = ?',
      whereArgs: [cartModel.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await sqliteService.database;
    return await db.delete(
      CartFields.tableName,
      where: '${CartFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await sqliteService.database;
    db.close();
  }
}

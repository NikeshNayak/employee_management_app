import 'package:employee_management_app/core/database/tables/employee_details_table_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._();

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._();

  static const _databaseName = 'employee_app.db';
  static const _currentDBVersion = 1;
  static late final String _databasePath;
  static late final Database _database;

  static Database get database => _database;

  static String get databasePath => _databasePath;

  static Future<void> init() async {
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
      var databasesPath = await databaseFactory.getDatabasesPath();
      _databasePath = '$databasesPath/$_databaseName';
      try {
        _database = await databaseFactory.openDatabase(
          _databasePath,
          options: OpenDatabaseOptions(
            version: _currentDBVersion,
            onCreate: (db, version) async {
              // Create tables
              await EmployeeDetailsTableManager().createTable(db);
            },
            onUpgrade: (db, oldVersion, newVersion) {},
          ),
        );
      } catch (e, st) {
        throw Exception("Failed to open database: $e, $st");
      }
      return;
    }
    var databasesPath = await getDatabasesPath();
    _databasePath = '$databasesPath/$_databaseName';
    try {
      _database = await openDatabase(
        _databasePath,
        version: _currentDBVersion,
        onCreate: (Database db, int version) async {
          // Create tables
          await EmployeeDetailsTableManager().createTable(db);
        },
        onUpgrade: (db, oldVersion, newVersion) {},
      );
    } catch (e, st) {
      throw Exception("Failed to open database: $e, $st");
    }
  }

  static Future<void> deleteDatabaseFromApp() async {
    // Delete the database
    await deleteDatabase(_databasePath);
  }
}

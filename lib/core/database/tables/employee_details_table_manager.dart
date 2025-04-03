import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../database_keys.dart';
import '../database_manager.dart';

class EmployeeDetailsTableManager {
  /// Singleton instance
  static final EmployeeDetailsTableManager _instance = EmployeeDetailsTableManager._();

  factory EmployeeDetailsTableManager() {
    return _instance;
  }

  EmployeeDetailsTableManager._();

  /// Create Employee Details Table
  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseKeys.employeeDetailsTable} (
        ${EmployeeDetailsTableKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${EmployeeDetailsTableKeys.employeeName} TEXT,
        ${EmployeeDetailsTableKeys.role} TEXT,
        ${EmployeeDetailsTableKeys.fromDate} TEXT,
        ${EmployeeDetailsTableKeys.toDate} TEXT NULL,
        ${EmployeeDetailsTableKeys.createdAt} DATETIME DEFAULT CURRENT_TIMESTAMP,
        ${EmployeeDetailsTableKeys.updatedAt} DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    ''');
    debugPrint("EmployeeDetailsTable created successfully");
  }

  /// Insert Employee Record
  Future<bool> insertEmployee({
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    final db = DatabaseManager.database;
    int result = await db.insert(DatabaseKeys.employeeDetailsTable, {
      EmployeeDetailsTableKeys.employeeName: employeeName,
      EmployeeDetailsTableKeys.role: role,
      EmployeeDetailsTableKeys.fromDate: fromDate,
      EmployeeDetailsTableKeys.toDate: toDate,
    });
    if (result > 0) {
      debugPrint("Employee inserted successfully");
      return true;
    }
    return false;
  }

  /// Insert Employee Record
  Future<bool> insertEmployeeById({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    final db = DatabaseManager.database;
    int result = await db.insert(DatabaseKeys.employeeDetailsTable, {
      EmployeeDetailsTableKeys.id: id,
      EmployeeDetailsTableKeys.employeeName: employeeName,
      EmployeeDetailsTableKeys.role: role,
      EmployeeDetailsTableKeys.fromDate: fromDate,
      EmployeeDetailsTableKeys.toDate: toDate,
    });
    if (result > 0) {
      debugPrint("Employee inserted successfully");
      return true;
    }
    return false;
  }

  /// Fetch All Employees
  Future<List<Map<String, dynamic>>> fetchAllEmployees() async {
    final db = DatabaseManager.database;
    List<Map<String, dynamic>> result = await db.query(DatabaseKeys.employeeDetailsTable);
    debugPrint("All Employees: $result");
    return result;
  }

  /// Update Employee
  Future<bool> updateEmployee({
    required int id,
    required String employeeName,
    required String role,
    required String fromDate,
    String? toDate,
  }) async {
    final db = DatabaseManager.database;
    int result = await db.update(
      DatabaseKeys.employeeDetailsTable,
      {
        EmployeeDetailsTableKeys.employeeName: employeeName,
        EmployeeDetailsTableKeys.role: role,
        EmployeeDetailsTableKeys.fromDate: fromDate,
        EmployeeDetailsTableKeys.toDate: toDate,
        EmployeeDetailsTableKeys.updatedAt: DateTime.now().toIso8601String(),
      },
      where: "${EmployeeDetailsTableKeys.id} = ?",
      whereArgs: [id],
    );
    if (result > 0) {
      debugPrint("Employee updated successfully");
      return true;
    }
    return false;
  }

  /// Delete Employee
  Future<bool> deleteEmployee(int id) async {
    final db = DatabaseManager.database;
    int result = await db.delete(
      DatabaseKeys.employeeDetailsTable,
      where: "${EmployeeDetailsTableKeys.id} = ?",
      whereArgs: [id],
    );
    if (result > 0) {
      debugPrint("Employee deleted successfully");
      return true;
    }
    return false;
  }
}

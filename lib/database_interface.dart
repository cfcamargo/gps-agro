import 'dart:core';

abstract class DatabaseHandler {
  Future<String> readFrom(String table, String column, String id);

  Future<Map<String, dynamic>> readAllRow(String table, String id);

  Future<void> writeTo(String table, String column, String id, String data);

  Future<void> writeRow(String table, String id, String data);

  Future<void> eraseRow(String table, String id);

  Future<void> createTable(String table);

  Future<Map<String, dynamic>> readAllRows(String table);

  Future<Map<String, dynamic>> queryColumn(String table, String column, String value);
}

abstract class DatabaseException implements Exception {
  String message;

  DatabaseException(this.message);
}

class TableNotFoundException extends DatabaseException {
  TableNotFoundException() : super("Table not found in database;");
}

class RowNotFoundException extends DatabaseException {
  RowNotFoundException() : super("Row not found in table;");
}

class ColumnNotFoundException extends DatabaseException {
  ColumnNotFoundException() : super("Column not found in table;");
}

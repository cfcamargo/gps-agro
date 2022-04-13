import 'dart:convert';
import "dart:io";
import 'package:gps_tracker/database_interface.dart';
import "package:path_provider/path_provider.dart";

class FileDatabaseHandler implements DatabaseHandler {
  Future<String> readFrom(String table, String column, String id) async {
    String text = "";
    final Directory dir = await getApplicationDocumentsDirectory();
    final Directory tableDir = Directory("${dir.path}/db/$table");
    if (await tableDir.exists()) {
      final File file = File('${tableDir.path}/$id.json');
      if (await file.exists()) {
        String fileString = await file.readAsString();
        Map<String, dynamic> fileJson = jsonDecode(fileString);
        if (fileJson.containsKey(column)) {
          text = fileJson[column];
        } else {
          throw new ColumnNotFoundException();
        }
      } else {
        throw new RowNotFoundException();
      }
    } else {
      throw new TableNotFoundException();
    }
    return text;
  }

  Future<Map<String, dynamic>> readAllRow(String table, String id) async {
    Map<String, dynamic> row;
    final Directory dir = await getApplicationDocumentsDirectory();
    final Directory tableDir = Directory("${dir.path}/db/$table");
    if (await tableDir.exists()) {
      final File file = File('${tableDir.path}/$id.json');
      if (await file.exists()) {
        String fileString = await file.readAsString();
        row = jsonDecode(fileString);
      } else {
        throw new RowNotFoundException();
      }
    } else {
      throw new TableNotFoundException();
    }
    return row;
  }

  Future<void> writeTo(String table, String column, String id, String data) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/db/$table/$id.json');
    if (!(await file.exists())) {
      file.create(recursive: true);
      Map<String, dynamic> fileJson = new Map();
      fileJson[column] = data;
      String fileString = jsonEncode(fileJson);
      await file.writeAsString(fileString);
    } else {
      String fileString = await file.readAsString();
      Map<String, dynamic> fileJson = jsonDecode(fileString);
      fileJson[column] = data;
      fileString = jsonEncode(fileJson);
      await file.writeAsString(fileString);
    }
  }

  Future<void> writeRow(String table, String id, String data) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/db/$table/$id.json');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    await file.writeAsString(data);
  }

  Future<void> eraseRow(String table, String id) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/db/$table/$id.json');
    if (await file.exists()) {
      await file.delete();
    } else {
      throw new RowNotFoundException();
    }
  }

  Future<void> createTable(String table) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final Directory tableDir = Directory("${dir.path}/db/$table");
    if (!(await tableDir.exists())) {
      tableDir.create(recursive: true);
    }
  }

  Future<Map<String, dynamic>> readAllRows(String table) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final Directory tableDir = Directory("${dir.path}/db/$table");
    Map<String, dynamic> rows = new Map();
    if (await tableDir.exists()) {
      var list = tableDir.list();
      await for (var file in list) {
        String id = file.path.substring(file.parent.path.length + 1);
        String fileText = await (file as File).readAsString();
        var fileJson = jsonDecode(fileText);
        rows[id] = fileJson;
      }
    } else {
      throw new TableNotFoundException();
    }
    return rows;
  }

  Future<Map<String, dynamic>> queryColumn(String table, String column, String value) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final Directory tableDir = Directory("${dir.path}/db/$table");
    Map<String, dynamic> rows = new Map();
    if (await tableDir.exists()) {
      var list = tableDir.list();
      await for (var file in list) {
        String id = file.path.substring(file.parent.path.length + 1);
        String fileText = await (file as File).readAsString();
        Map<String, dynamic> fileJson = jsonDecode(fileText);
        if (fileJson.containsKey(column) && fileJson[column] == value) {
          rows[id] = fileJson;
        }
      }
    } else {
      throw new TableNotFoundException();
    }
    return rows;
  }
}

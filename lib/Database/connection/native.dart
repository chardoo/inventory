import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<File> get databaseFile async {
  final appDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDir.path, 'inventory.db');
  return File(dbPath);
}

LazyDatabase connect() {
  return LazyDatabase(() async {
    final file = await databaseFile;
    return NativeDatabase.createInBackground(file);
  });
}

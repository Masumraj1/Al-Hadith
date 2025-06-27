import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/books.dart';
import 'tables/topics.dart';
import 'dao/book_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Books, Topics],
  daos: [BookDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'al_hadith.sqlite');
    return NativeDatabase(File(path));
  });
}

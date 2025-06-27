// import 'package:drift/drift.dart';
// import 'books.dart';
//
// class Topics extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   IntColumn get bookId => integer().references(Books, #id)();
//   TextColumn get topic => text()();
// }
import 'package:drift/drift.dart';

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId => integer()();  // foreign key to book
  TextColumn get title => text()();
}

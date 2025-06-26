import 'package:drift/drift.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get count => text()();
  TextColumn get iconText => text()();
  TextColumn get iconColor => text()(); // Hex color string
}

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/books.dart';
import '../tables/topics.dart';

part 'book_dao.g.dart';
//
// @DriftAccessor(tables: [Books, Topics])
// class BookDao extends DatabaseAccessor<AppDatabase> with _$BookDaoMixin {
//   BookDao(AppDatabase db) : super(db);
//
//   Future<List<Book>> getAllBooks() => select(books).get();
//
//   Future<List<Topic>> getTopicsByBookId(int bookId) =>
//       (select(topics)..where((t) => t.bookId.equals(bookId))).get();
//
//   Future<int> insertBook(BooksCompanion book) => into(books).insert(book);
//
//   Future<int> insertTopic(TopicsCompanion topic) => into(topics).insert(topic);
//
//   Future<int> deleteAllBooks() => delete(books).go();
//
//   Future<int> deleteAllTopics() => delete(topics).go();
// }

@DriftAccessor(tables: [Books, Topics])
class BookDao extends DatabaseAccessor<AppDatabase> with _$BookDaoMixin {
  BookDao(AppDatabase db) : super(db);

  Future<List<Book>> getAllBooks() => select(books).get();

  Future<List<Topic>> getTopicsByBookId(int bookId) =>
      (select(topics)..where((t) => t.bookId.equals(bookId))).get();

  Future<int> insertBook(BooksCompanion book) => into(books).insert(book);

  Future<int> insertTopic(TopicsCompanion topic) => into(topics).insert(topic);
}


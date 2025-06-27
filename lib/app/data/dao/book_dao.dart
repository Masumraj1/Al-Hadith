import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/books.dart';
import '../tables/topics.dart';

part 'book_dao.g.dart';

@DriftAccessor(tables: [Books, Topics])
class BookDao extends DatabaseAccessor<AppDatabase> with _$BookDaoMixin {
  BookDao(AppDatabase db) : super(db);

  // Books
  Future<List<Book>> getAllBooks() => select(books).get();

  Future<List<Book>> getBookByTitle(String title) =>
      (select(books)..where((b) => b.title.equals(title))).get();

  Future<int> insertBook(BooksCompanion book) => into(books).insert(book);

  Future<int> deleteAllBooks() => delete(books).go();

  // Topics
  Future<List<Topic>> getTopicsByBookId(int bookId) =>
      (select(topics)..where((t) => t.bookId.equals(bookId))).get();

  Future<List<Topic>> getAllTopics() => select(topics).get();

  Future<int> insertTopic(TopicsCompanion topic) => into(topics).insert(topic);

  Future<int> deleteAllTopics() => delete(topics).go();
}

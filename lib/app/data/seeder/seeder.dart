import 'package:al_hadith/app/data/database.dart';

Future<void> seedInitialBooks(AppDatabase db) async {
  final existingBooks = await db.bookDao.getAllBooks();
  if (existingBooks.isEmpty) {
    await db.bookDao.insertBook(BooksCompanion.insert(
      title: 'সহিহ বুখারী',
      subtitle: 'ইমাম বুখারী',
      count: '৭৫৬৩',
      iconText: 'B',
      iconColor: '#56C596',
    ));
    await db.bookDao.insertBook(BooksCompanion.insert(
      title: 'সহিহ মুসলিম',
      subtitle: 'ইমাম মুসলিম',
      count: '৭১৯০',
      iconText: 'M',
      iconColor: '#007BFF',
    ));
    await db.bookDao.insertBook(BooksCompanion.insert(
      title: 'সুনানে আবু দাউদ',
      subtitle: 'ইমাম আবু দাউদ',
      count: '৫২৭৪',
      iconText: 'A',
      iconColor: '#FF7043',
    ));
    await db.bookDao.insertBook(BooksCompanion.insert(
      title: 'সুনানে তিরমিজি',
      subtitle: 'ইমাম তিরমিজি',
      count: '৩৯৫৬',
      iconText: 'T',
      iconColor: '#AB47BC',
    ));
  }
}

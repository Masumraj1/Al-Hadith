import 'package:al_hadith/app/data/database.dart';

Future<void> seedInitialTopics(AppDatabase db) async {
  final existingTopics = await db.bookDao.getAllTopics();
  if (existingTopics.isEmpty) {
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'ওহীর সূচনা',
      bookId: 1,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'ইমান সম্পর্কে বর্ণনা',
      bookId: 1,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'জ্ঞান অর্জনের গুরুত্ব',
      bookId: 1,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'ইবাদতের ফজিলত',
      bookId: 1,
    ));


    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'তওবা ও ক্ষমা',
      bookId: 2,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'আখিরাতের ঘটনা',
      bookId: 2,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'সালাতের নিয়মাবলী',
      bookId: 2,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'সুন্নাহ ও হাদীস',
      bookId: 2,
    ));


    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'আযান সম্পর্কিত হাদীস',
      bookId: 3,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'ওযুর হুকুম',
      bookId: 3,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'নামাজের ভুল সংশোধন',
      bookId: 3,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'ইমামের দায়িত্ব',
      bookId: 3,
    ));


    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'রোজার মাসায়েল',
      bookId: 4,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'যাকাত ও দান',
      bookId: 4,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'হজ্বের নিয়মাবলী',
      bookId: 4,
    ));
    await db.bookDao.insertTopic(TopicsCompanion.insert(
      title: 'সুন্নাত অনুসরণ',
      bookId: 4,
    ));
  }
}

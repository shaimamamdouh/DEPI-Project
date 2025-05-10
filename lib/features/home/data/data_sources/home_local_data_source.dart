import 'package:hive/hive.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<BookEntity>> fetchTopBooks();
  Future<List<BookEntity>> fetchAudioBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<BookEntity>> fetchTopBooks() async {
    var box = await Hive.openBox<BookEntity>('Topbooks');
    return box.values.toList();
  }

  @override
  Future<List<BookEntity>> fetchAudioBooks() async {
    var box = await Hive.openBox<BookEntity>('audiobooks');
    return box.values.toList();
  }
}
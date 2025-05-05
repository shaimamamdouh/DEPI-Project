import 'package:hive/hive.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<BookEntity>> fitchTopBooks();
  Future<List<BookEntity>> fitchAudioBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<BookEntity>> fitchTopBooks() async {
    var box = Hive.box<BookEntity>('books');
    return box.values.toList();
  }

  @override
  Future<List<BookEntity>> fitchAudioBooks() async {
     var box = Hive.box<BookEntity>('audiobooks');
    return box.values.toList();
  }
}

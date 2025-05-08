import 'package:hive/hive.dart';
import 'package:readio/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<BookEntity>> fetchTopBooks();
  Future<List<BookEntity>> fetchAudioBooks();
   
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<BookEntity>> fetchTopBooks() async {
    var box =  Hive.box<BookEntity>('Topbooks');
    return box.values.toList();
  }

  @override
  Future<List<BookEntity>> fetchAudioBooks() async {
     var box = Hive.box<BookEntity>('audiobooks');
    return box.values.toList();
  }
}

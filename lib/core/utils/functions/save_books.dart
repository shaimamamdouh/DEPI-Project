  import 'package:hive/hive.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

Future<void> saveBooks(List<BookEntity> books) async {
    var box= await Hive.openBox('books');
    box.addAll(books);
  }
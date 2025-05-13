  import 'package:hive/hive.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

Future<void> saveBooks(List<BookEntity> books,String boxName) async {
    var box= await Hive.openBox<BookEntity>(boxName);
    box.addAll(books);
  }
  
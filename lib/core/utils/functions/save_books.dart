  import 'package:hive/hive.dart';
import 'package:readio/domain/entities/book_entity.dart';
Future<void> saveBooks(List<BookEntity> books, String boxName) async {
  var box = await Hive.openBox<BookEntity>(boxName);
  await box.clear(); // ننضف القديم لو محتاجين
  await box.addAll(books);
}

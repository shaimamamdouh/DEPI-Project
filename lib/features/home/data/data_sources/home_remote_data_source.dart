import 'package:readio/core/utils/api_service.dart';
import 'package:readio/core/utils/functions/save_books.dart';
import 'package:readio/features/home/data/models/book_model/book_model.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fitchTopBooks();
  Future<List<BookEntity>> fitchAudioBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fitchTopBooks() async {
    var data = await apiService.get(
      url:
          'https://www.googleapis.com/books/v1/volumes?q=best+books&orderBy=relevance&maxResults=20',
    );
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    await saveBooks(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fitchAudioBooks() {
    throw UnimplementedError();
  }
}

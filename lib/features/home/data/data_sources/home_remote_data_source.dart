import 'package:readio/core/utils/api_service.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/data/models/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fitchTopBooks();
  Future<List<BookEntity>> fitchRecommendedBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fitchTopBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?q=free&orderBy=relevance&maxResults=20',
    );
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fitchRecommendedBooks() {
    // TODO: implement fitchRecommendedBooks
    throw UnimplementedError();
  }
}

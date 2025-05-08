import 'package:readio/core/utils/api_service.dart';
import 'package:readio/core/utils/functions/save_books.dart';
import 'package:readio/data/models/book_model/book_model.dart';
import 'package:readio/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchTopBooks();
  Future<List<BookEntity>> fetchAudioBooks();
   Future< List<BookEntity>> fetchBooksByCategory(String category);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchTopBooks() async {
    String key = 'AIzaSyBNwkWv8bt33bF7RkN-6n-iraqoQfOkyN4';
    var data = await apiService.get(
      url:
          'https://www.googleapis.com/books/v1/volumes?q=subject:category&filter=ebooks&printType=books&maxResults=20&key=$key',
    );
    print('📡 API Response: $data');

    List<BookModel> books = [];

    for (var bookMap in data["items"]) {
      var thumbnail =
          bookMap["volumeInfo"]?["imageLinks"]?["thumbnail"] ??
          'https://via.placeholder.com/150';
      print('🔍 Thumbnail: $thumbnail');
      books.add(BookModel.fromJson(bookMap));
    }

    await saveBooks(books, "Topbooks");
    return books;
  }

  @override
  Future<List<BookEntity>> fetchAudioBooks() {
    throw UnimplementedError();
  }
  
  @override
  Future<List<BookEntity>> fetchBooksByCategory(String category) async {

    String formattedCategory = Uri.encodeComponent(category.trim());
    String key = 'AIzaSyBNwkWv8bt33bF7RkN-6n-iraqoQfOkyN4';
    var data = await apiService.get(
      url:
          'https://www.googleapis.com/books/v1/volumes?q=subject:$formattedCategory&filter=ebooks&printType=books&maxResults=20&key=$key',
    );
    print('📡 API Response: $data');

    List<BookModel> books = [];

    for (var bookMap in data["items"]) {
      var thumbnail =
          bookMap["volumeInfo"]?["imageLinks"]?["thumbnail"] ??
          'https://via.placeholder.com/150';
      print('🔍 Thumbnail: $thumbnail');
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}

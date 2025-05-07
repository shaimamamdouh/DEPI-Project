import 'package:readio/core/utils/api_service.dart';
import 'package:readio/core/utils/functions/save_books.dart';
import 'package:readio/features/home/data/models/book_model/book_model.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchTopBooks();
  Future<List<BookEntity>> fetchAudioBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchTopBooks() async {
    try {
      var data = await apiService.get(
        url: 'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest&q=programming&key=AIzaSyD6Nja_qZ2dP7QDZ8b6xDu8ttyOkpUtUPc',
      );
      print('📡 API Response: $data');

      List<BookEntity> books = [];
      for (var bookMap in data["items"]) {
        var thumbnail = bookMap["volumeInfo"]?["imageLinks"]?["thumbnail"] ?? 'https://via.placeholder.com/150';
        print('🔍 Thumbnail: $thumbnail');
        books.add(BookModel.fromJson(bookMap));
      }

      await saveBooks(books, "Topbooks");
      return books;
    } catch (e) {
      print('🔴 API Error: $e');
      rethrow; // إرمي الاستثناء عشان يترفع للـ HomeRepoImpl
    }
}


    @override
    Future<List<BookEntity>> fetchAudioBooks() {
      throw UnimplementedError();
    }
  }



import 'package:readio/core/utils/api_service.dart';
import 'package:readio/core/utils/functions/save_books.dart';
import 'package:readio/features/home/data/models/book_model/book_model.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchTopBooks({String? category});
  Future<List<BookEntity>> fetchAudioBooks();
  Future<List<BookEntity>> searchBooks(String query);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchTopBooks({String? category}) async {
    try {
      final query = category != null ? 'subject:$category' : 'pride+prejudice';
      var data = await apiService.get(
        url: 'https://www.googleapis.com/books/v1/volumes?q=$query&key=AIzaSyD6Nja_qZ2dP7QDZ8b6xDu8ttyOkpUtUPc',
      );
      print('📡 API Response for $query: $data');

      List<BookEntity> books = [];
      for (var bookMap in data["items"]) {
        var thumbnail = bookMap["volumeInfo"]?["imageLinks"]?["thumbnail"] ?? 'https://via.placeholder.com/150';
        var previewLink = bookMap["volumeInfo"]?["previewLink"] ?? '';
        print('🔍 Book ID: ${bookMap["id"]}, Thumbnail: $thumbnail, PreviewLink: $previewLink');
        books.add(BookModel.fromJson(bookMap));
      }

      print('📚 Saving ${books.length} books to Hive');
      await saveBooks(books, category != null ? 'category_$category' : 'Topbooks');
      return books;
    } catch (e) {
      print('🔴 API Error: $e');
      rethrow;
    }
  }

  @override
  Future<List<BookEntity>> fetchAudioBooks() async {
    try {
      var data = await apiService.get(
        url: 'https://www.googleapis.com/books/v1/volumes?q=audiobook&key=AIzaSyD6Nja_qZ2dP7QDZ8b6xDu8ttyOkpUtUPc',
      );
      print('📡 API Response for audiobooks: $data');

      List<BookEntity> books = [];
      for (var bookMap in data["items"]) {
        var description = bookMap["volumeInfo"]?["description"];
        if (description != null && description.isNotEmpty) {
          var thumbnail = bookMap["volumeInfo"]?["imageLinks"]?["thumbnail"] ?? 'https://via.placeholder.com/150';
          var previewLink = bookMap["volumeInfo"]?["previewLink"] ?? '';
          print('🔍 Audiobook ID: ${bookMap["id"]}, Thumbnail: $thumbnail, Description: $description');
          books.add(BookModel.fromJson(bookMap));
        }
      }

      print('📚 Saving ${books.length} audiobooks to Hive');
      await saveBooks(books, 'audiobooks');
      return books;
    } catch (e) {
      print('🔴 Audiobook API Error: $e');
      rethrow;
    }
  }

  @override
  Future<List<BookEntity>> searchBooks(String query) async {
    try {
      final formattedQuery = query.replaceAll(' ', '+');
      var data = await apiService.get(
        url: 'https://www.googleapis.com/books/v1/volumes?q=$formattedQuery&key=AIzaSyD6Nja_qZ2dP7QDZ8b6xDu8ttyOkpUtUPc',
      );
      print('📡 API Response for search "$query": $data');

      List<BookEntity> books = [];
      for (var bookMap in data["items"]) {
        var thumbnail = bookMap["volumeInfo"]?["imageLinks"]?["thumbnail"] ?? 'https://via.placeholder.com/150';
        var previewLink = bookMap["volumeInfo"]?["previewLink"] ?? '';
        print('🔍 Search Book ID: ${bookMap["id"]}, Thumbnail: $thumbnail, PreviewLink: $previewLink');
        books.add(BookModel.fromJson(bookMap));
      }

      print('📚 Saving ${books.length} search results to Hive');
      await saveBooks(books, 'search_$formattedQuery');
      return books;
    } catch (e) {
      print('🔴 Search API Error: $e');
      rethrow;
    }
  }
}
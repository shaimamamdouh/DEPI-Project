import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:readio/features/home/data/models/book_model/book_model.dart';

class BookApiService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  static const String _apiKey = 'AIzaSyD6Nja_qZ2dP7QDZ8b6xDu8ttyOkpUtUPc';

  Future<List<BookModel>> searchBooksByCategory(String category) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=subject:$category&maxResults=3&key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to bring books');
    }
  }

  Future<List<BookModel>> searchBooksByAuthor(String author) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=inauthor:$author&maxResults=3&key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to bring books');
    }
  }

  Future<BookModel?> searchBookByTitle(String title) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=intitle:$title&maxResults=1&key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['items'] != null && data['items'].isNotEmpty) {
        return BookModel.fromJson(data['items'][0]);
      }
      return null;
    } else {
      throw Exception('Failed to find the book');
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/data/data_sources/home_remote_data_source.dart';
import 'package:readio/domain/entities/book_entity.dart';
import 'package:readio/domain/repository/book_by_category_repo.dart';


class BookByCategoryRepoImpl extends BookByCategoryRepo {

  final HomeRemoteDataSource remoteDataSource;

  BookByCategoryRepoImpl({required this.remoteDataSource});


  

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooksByCategory(String category) async {
   List<BookEntity> bookList;
  try {
 
    bookList = await remoteDataSource.fetchTopBooks();

    print('🌐 Loaded from remote: ${bookList.length} books');
    for (var book in bookList) {
      print('🌄 Remote book image: ${book.image}');
    }

    return right(bookList);

  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    } else {
      return left(ServerFailure(e.toString()));
    }
  }
  }
}
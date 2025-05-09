import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/features/home/data/data_sources/home_local_data_source.dart';
import 'package:readio/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchTopBooks({String? category}) async {
    List<BookEntity> bookList;
    try {
      // لو مفيش category، جيب الكتب من Hive
      if (category == null) {
        bookList = await localDataSource.fetchTopBooks();
        if (bookList.isNotEmpty) {
          print('📦 Loaded from local: ${bookList.length} books');
          for (var book in bookList) {
            print('📥 Local book image: ${book.image}');
          }
          return right(bookList);
        }
      }

      // لو فيه category أو Hive فاضي، اطلب من الـ API
      bookList = await remoteDataSource.fetchTopBooks(category: category);
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

  @override
  Future<Either<Failure, List<BookEntity>>> fetchAudioBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = await localDataSource.fetchAudioBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await remoteDataSource.fetchAudioBooks();
      return right(bookList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchYourBooks() {
    throw UnimplementedError();
  }
}
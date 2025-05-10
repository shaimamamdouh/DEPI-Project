import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/features/home/data/data_sources/home_local_data_source.dart';
import 'package:readio/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  //هربط اللوكال والريموت داتا سورسز

  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  @override
Future<Either<Failure, List<BookEntity>>> fetchTopBooks() async {
  List<BookEntity> bookList;
  try {
    // جرب الأول من اللوكال
    bookList = await localDataSource.fetchTopBooks();
    
    if (bookList.isNotEmpty) {
      print('📦 Loaded from local: ${bookList.length} books');
      for (var book in bookList) {
        print('📥 Local book image: ${book.image}');
      }
      return right(bookList);
    } 

    // بعدين جرب من الريموت
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
    // TODO: implement fetchYourBooks
    throw UnimplementedError();
  }
}

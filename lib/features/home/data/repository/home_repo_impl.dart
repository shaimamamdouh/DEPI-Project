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
  Future<Either<Failure, List<BookEntity>>> fitchTopBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = await localDataSource.fitchTopBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await remoteDataSource.fitchTopBooks();
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
  Future<Either<Failure, List<BookEntity>>> fitchAudioBooks() async {
    try {
      List<BookEntity> bookList;
      bookList = await localDataSource.fitchAudioBooks();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      bookList = await remoteDataSource.fitchAudioBooks();
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
      Future<Either<Failure, List<BookEntity>>> fitchYourBooks() {
    // TODO: implement fitchYourBooks
    throw UnimplementedError();
      }
  }
  
  

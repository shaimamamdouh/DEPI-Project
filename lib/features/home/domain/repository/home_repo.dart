import 'package:dartz/dartz.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fitchTopBooks();
  Future<Either<Failure, List<BookEntity>>> fitchRecommendedBooks();
  Future<Either<Failure, List<BookEntity>>> fitchYourBooks();
}

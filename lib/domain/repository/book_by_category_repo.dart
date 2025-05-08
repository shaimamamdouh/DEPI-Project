import 'package:dartz/dartz.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/domain/entities/book_entity.dart';

abstract class BookByCategoryRepo {
   Future<Either<Failure, List<BookEntity>>> fetchBooksByCategory(String category);
  
}
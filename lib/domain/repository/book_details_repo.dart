import 'package:dartz/dartz.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchBookDetails();
  Future<void> openBookToRead(BookEntity book);
  Future<void> saveBook(BookEntity book);
}
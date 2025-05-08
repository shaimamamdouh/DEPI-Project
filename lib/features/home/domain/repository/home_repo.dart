import 'package:dartz/dartz.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchTopBooks();
  Future<Either<Failure, List<BookEntity>>> fetchAudioBooks();
  Future<Either<Failure, List<BookEntity>>> fetchYourBooks();
}


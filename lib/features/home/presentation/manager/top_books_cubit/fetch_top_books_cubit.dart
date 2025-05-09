import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';

part 'fetch_top_books_state.dart';

class FetchTopBooksCubit extends Cubit<FetchTopBooksState> {
  final HomeRepo homeRepo;

  FetchTopBooksCubit(this.homeRepo) : super(FetchTopBooksInitial());

  Future<void> fetchTopBooks({String? category}) async {
    emit(FetchTopBooksLoading());
    final result = await homeRepo.fetchTopBooks(category: category);
    result.fold(
          (failure) => emit(FetchTopBooksFailure(failure.message)),
          (books) => emit(FetchTopBooksSuccess(books: books)), // تعديل السطر
    );
  }
}
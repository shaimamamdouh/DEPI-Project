import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:readio/core/errors/failure.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';

part 'search_state.dart'; // المسار النسبي الصحيح

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;

  SearchCubit(this.homeRepo) : super(SearchInitial());

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchSuccess(books: []));
      return;
    }

    emit(SearchLoading());
    try {
      final Either<Failure, List<BookEntity>> result = await homeRepo.searchBooks(query);
      result.fold(
            (failure) => emit(SearchFailure(error: failure.message)),
            (books) => emit(SearchSuccess(books: books)),
      );
    } catch (e) {
      emit(SearchFailure(error: e.toString()));
    }
  }
}

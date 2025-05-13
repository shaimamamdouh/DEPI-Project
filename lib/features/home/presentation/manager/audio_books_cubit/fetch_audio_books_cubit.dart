import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';

part 'fetch_audio_books_state.dart';

class FetchAudioBooksCubit extends Cubit<FetchAudioBooksState> {
  final HomeRepo homeRepo;

  FetchAudioBooksCubit(this.homeRepo) : super(FetchAudioBooksInitial());

  Future<void> fetchAudioBooks({String? category}) async {
    emit(FetchAudioBooksLoading());
    final result = await homeRepo.fetchTopBooks(category: category);
    result.fold(
          (failure) => emit(FetchAudioBooksFailure(failure.message)),
          (books) {
        // فلترة الكتب للي عندها description غير فارغ
        final audioBooks = books.where((book) => book.description != null && book.description!.isNotEmpty).toList();
        if (audioBooks.isEmpty) {
          emit(FetchAudioBooksFailure('No audio books available'));
        } else {
          emit(FetchAudioBooksSuccess(books: audioBooks));
        }
      },
    );
  }
}
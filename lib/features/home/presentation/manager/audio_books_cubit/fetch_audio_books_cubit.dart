import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readio/domain/entities/book_entity.dart';
import 'package:readio/domain/repository/home_repo.dart';

part 'fetch_audio_books_state.dart';

class FetchAudioBooksCubit extends Cubit<FetchAudioBooksState> {
  FetchAudioBooksCubit(this.homeRepo) : super(FetchAudioBooksInitial());

  final HomeRepo homeRepo;
  void fetchTopBooks() async {
    emit(FetchAudioBooksLoading());
    var result = await homeRepo.fetchTopBooks();
    result.fold(
      (failure) => FetchAudioBooksFailure(failure.message),
      (books) => FetchAudioBooksSuccess(books: books),
    );
  }
}

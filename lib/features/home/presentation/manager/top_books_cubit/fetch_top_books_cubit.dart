import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readio/features/home/domain/entities/book_entity.dart';
import 'package:readio/features/home/domain/repository/home_repo.dart';

part 'fetch_top_books_state.dart';

class FetchTopBooksCubit extends Cubit<FetchTopBooksState> {
  FetchTopBooksCubit(this.homeRepo) : super(FetchTopBooksInitial());

  final HomeRepo homeRepo;
  void fetchTopBooks() async {
    emit(FetchTopBooksLoading());
    var result = await homeRepo.fetchTopBooks();
    result.fold(
      (failure) {
        emit(FetchTopBooksFailure(failure.message));
      },
      (books) {
        emit(FetchTopBooksSuccess(books: books));
       
      },
    );
  }
}

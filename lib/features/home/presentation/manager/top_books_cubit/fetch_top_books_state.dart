part of 'fetch_top_books_cubit.dart';

@immutable
sealed class FetchTopBooksState {}

final class FetchTopBooksInitial extends FetchTopBooksState {}

final class FetchTopBooksLoading extends FetchTopBooksState {}
final class FetchTopBooksFailure extends FetchTopBooksState {
  final String errorMessage;

  FetchTopBooksFailure(this.errorMessage);
}

final class FetchTopBooksSuccess extends FetchTopBooksState {
  final List<BookEntity> books;
  FetchTopBooksSuccess({required this.books});
}

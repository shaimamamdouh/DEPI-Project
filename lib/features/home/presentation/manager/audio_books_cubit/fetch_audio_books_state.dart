part of 'fetch_audio_books_cubit.dart';

@immutable
sealed class FetchAudioBooksState {}

final class FetchAudioBooksInitial extends FetchAudioBooksState {}

final class FetchAudioBooksLoading extends FetchAudioBooksState {}

final class FetchAudioBooksSuccess extends FetchAudioBooksState {
  final List<BookEntity> books;

  FetchAudioBooksSuccess({required this.books});
}

final class FetchAudioBooksFailure extends FetchAudioBooksState {
  final String errorMessage;

  FetchAudioBooksFailure(this.errorMessage);
}
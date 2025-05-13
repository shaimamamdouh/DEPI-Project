part of 'search_cubit.dart';



abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess({required this.books});
}

class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});
}
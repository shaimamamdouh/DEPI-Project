import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_by_category_state.dart';

class BookByCategoryCubit extends Cubit<BookByCategoryState> {
  BookByCategoryCubit() : super(BookByCategoryInitial());
}

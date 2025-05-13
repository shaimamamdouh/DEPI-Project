import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'your_books_state.dart';

class YourBooksCubit extends Cubit<YourBooksState> {
  YourBooksCubit() : super(YourBooksInitial());
}

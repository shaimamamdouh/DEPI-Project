import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_state.dart';



class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool isDarkMode = false;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(ThemeChanged(isDarkMode));
  }

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    emit(ThemeChanged(isDarkMode));
  }
}

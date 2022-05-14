import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeIsLight("Theme is Light"));

  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    print(_isDark);
    emit(ThemeChanged());
    if (_isDark) {
      emit(ThemeIsDark("Theme is Dark"));
    } else {
      emit(ThemeIsLight("Theme is Light"));
    }
  }
}

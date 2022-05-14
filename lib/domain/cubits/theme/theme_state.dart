part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeState {}

class ThemeIsDark extends ThemeState {
  final String message;
  ThemeIsDark(this.message);
}

class ThemeIsLight extends ThemeState {
  final String message;
  ThemeIsLight(this.message);
}

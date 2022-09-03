part of 'app_theme_bloc.dart';

class AppThemeState extends Equatable {
  AppThemeState({required this.theme, required this.isTrue});
  bool isTrue;
  final ThemeData theme;

  @override
  List<Object> get props => [theme];
}

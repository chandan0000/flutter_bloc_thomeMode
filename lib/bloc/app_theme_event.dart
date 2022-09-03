part of 'app_theme_bloc.dart';

class AppThemeEvent extends Equatable {
  final ThemeData theme;
  final bool isTrue;

  const AppThemeEvent({required this.theme,required this.isTrue});

  @override
  List<Object> get props => [theme];
}

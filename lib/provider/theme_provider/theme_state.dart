part of 'theme_provider.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoading extends ThemeState {}

class ThemeDataFetched extends ThemeState {}

class ThemeError extends ThemeState {
  final String message;
  const ThemeError(this.message);

  @override
  List<Object> get props => [message];
}
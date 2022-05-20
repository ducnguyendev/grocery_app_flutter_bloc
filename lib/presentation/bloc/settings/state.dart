part of 'bloc.dart';

@immutable
class SettingsState {
  final BlocStatus status;
  final String? themeType;
  final Object? error;
  const SettingsState(
    this.status, {
    this.themeType,
    this.error,
  });
}

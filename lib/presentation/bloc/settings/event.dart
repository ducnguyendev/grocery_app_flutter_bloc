part of 'bloc.dart';

@immutable
@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const SettingsEvent._();
  const factory SettingsEvent.getTheme() = GetThemeEvent;

  const factory SettingsEvent.selectTheme(String themeType) = SelectThemeEvent;
}

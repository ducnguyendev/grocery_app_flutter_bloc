import '../network/remote_repository/settings.dart';

abstract class SettingsService {
  Future<String> selectTheme(String themeType);
  Future<String> getTheme();
}

class HiveSettingsService implements SettingsService {
  final SettingsGateway _gateway;
  HiveSettingsService(this._gateway);

  @override
  Future<String> getTheme() => _gateway.getTheme();

  @override
  Future<String> selectTheme(String themeType) =>
      _gateway.selectTheme(themeType);
}

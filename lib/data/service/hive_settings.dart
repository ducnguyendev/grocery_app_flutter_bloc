import 'package:grocery_app/data/gateway/settings.dart';
import 'package:grocery_app/domain/service/settings.dart';

class HiveSettingsService implements SettingsService {
  final SettingsGateway _gateway;
  HiveSettingsService(this._gateway);

  @override
  Future<String> getTheme() => _gateway.getTheme();

  @override
  Future<String> selectTheme(String themeType) =>
      _gateway.selectTheme(themeType);
}

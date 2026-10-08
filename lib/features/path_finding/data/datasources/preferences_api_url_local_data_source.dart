import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webspark_test/features/path_finding/data/datasources/api_url_local_data_source.dart';

@LazySingleton(as: ApiUrlLocalDataSource)
class PreferencesApiUrlLocalDataSource implements ApiUrlLocalDataSource {
  const PreferencesApiUrlLocalDataSource(this._prefs);

  final SharedPreferencesAsync _prefs;
  static const _key = 'path_finding.api_url';

  @override
  Future<String?> getUrl() async {
    return await _prefs.getString(_key);
  }

  @override
  Future<void> saveUrl(String url) async {
    await _prefs.setString(_key, url);
  }
}

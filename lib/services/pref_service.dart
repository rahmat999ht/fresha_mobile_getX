import '../core.dart';

class PrefService {
  SharedPreferences? _prefs;

  PrefService() {
    prefInit();
  }

  Future<void> prefInit() async {
    _prefs = _prefs ?? await SharedPreferences.getInstance();
  }

  bool get isFirstInstall {
    final prefBool = _prefs?.getString(KeysPref.firstInstall);
    return prefBool != null ? false : true;
  }

  /// Set first install
  void setNotFirstInstall() {
    _prefs?.setString(KeysPref.firstInstall, 'false');
  }

  /// for getting string from box
  String? get getUserToken {
    return _prefs?.getString(KeysPref.userToken);
  }

  /// for storing token to app
  Future<void> putUserToken(String token) async {
    await _prefs?.setString(KeysPref.userToken, token);
  }

  Future<void> removeUserToken() async {
    await _prefs?.remove(KeysPref.userToken);
  }

  /// for getting string from box
  String? get getIdCustomer {
    return _prefs?.getString(KeysPref.idCustomer);
  }

  /// for storing idCustomer to app
  Future<void> putIdCustomer(String idCustomer) async {
    await _prefs?.setString(KeysPref.idCustomer, idCustomer);
  }

  Future<void> removeIdCustomer() async {
    await _prefs?.remove(KeysPref.idCustomer);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _prefs?.clear();
  }
}

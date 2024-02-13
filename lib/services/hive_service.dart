import 'dart:convert';
import 'dart:developer';

import '../core.dart';

class HiveService {
  Box<String>? _box;

  Future<void> hiveInit() async {
    await Hive.initFlutter();
    //
    _box = _box ?? await Hive.openBox("local storage");
  }

  bool get isFirstInstall {
    final hiveBool = _box?.get(HiveKey.firstInstall);
    return hiveBool != null ? false : true;
  }

  /// Set first install
  void setNotFirstInstall() {
    _box?.put(HiveKey.firstInstall, 'false');
  }

  String? get getIdCustomer {
    return _box?.get(HiveKey.idCustomer);
  }

  /// for storingtCustomer to app
  Future<void> putIdCustomer(String token) async {
    await _box?.put(HiveKey.idCustomer, token);
  }

  /// for deletetCustomer to app
  Future<void> deleteIdCustomer() async {
    await _box?.delete(HiveKey.idCustomer);
  }

  DataCustomer? get getCustomer {
    try {
      final hiveJson = _box?.get(HiveKey.customer);
      if (hiveJson == null) return null;

      final customerJson = json.decode(hiveJson);
      return DataCustomer.fromJson(customerJson);
    } catch (error, st) {
      log(error.toString(), error: error, stackTrace: st);
      return null;
    }
  }

  /// for storingtCustomer to app
  Future<void> putCustomer(DataCustomer customer) async {
    final hiveJson = customer.toJson();
    final customerJson = json.encode(hiveJson);
    await _box?.put(HiveKey.customer, customerJson);
  }

  /// for deletetCustomer to app
  Future<void> delettCustomer() async {
    await _box?.delete(HiveKey.customer);
  }

  /// for getting string from box
  String? get getCustomerToken {
    return _box?.get(HiveKey.customerToken);
  }

  /// for storingtCustomer to app
  Future<void> putCustomerToken(String token) async {
    await _box?.put(HiveKey.customerToken, token);
  }

  /// for getting string from box
  String? get getEmail {
    return _box?.get(HiveKey.email);
  }

  /// for storingtCustomer to app
  Future<void> putEmail(String token) async {
    await _box?.put(HiveKey.email, token);
  }

  /// for deletetCustomer to app
  Future<void> deleteEmail() async {
    await _box?.delete(HiveKey.email);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await _box?.clear();
  }
}

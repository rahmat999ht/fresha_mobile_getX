import '../core.dart';

@immutable
class KeysEnpoint {
  const KeysEnpoint._();
  static const String baseUrl = 'BASE_URL';
  static const String products = '/product';
  static const String orders = '/order';
  static const String user = '/user';
  static const String auth = '/auth-costumer';
  static const String register = '/auth-custamer/register';
  static const String login = '/auth-custamer/login';
}

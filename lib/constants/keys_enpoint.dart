import '../core.dart';

@immutable
class KeysEnpoint {
  const KeysEnpoint._();
  static const String baseUrl = 'BASE_URL';
  static const String supabaseUrl = 'SUPABASE_URL';
  static const String supabaseKey = 'SUPABASE_KEY';
  static const String androidClientID = 'ANDROID_CLIENT_ID';
  static const String webClientID = 'WEB_CLIENT_ID';
  static const String anonKey = 'ANON_KEY';
  static const String products = '/products';
  static const String orders = '/orders';
  static const String user = '/user';
  static const String register = '/auth-costumer/signin';
  static const String login = '/auth-costumer/login';
}

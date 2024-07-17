import '../core.dart';

extension BuildContextExtentions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get xTextTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);

  TextStyle get labelLargeBold =>
      xTextTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get labelMediumBold =>
      xTextTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get labelSmallBold =>
      xTextTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get titleLargeBold =>
      xTextTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get titleMediumBold =>
      xTextTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);
  TextStyle get titleSmallBold =>
      xTextTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold);

  void goLogin({ required String ? arguments}) {
    Get.toNamed(
      Routes.LOGIN,
      arguments: arguments,
    );
  }

  void goSignin() {
    Get.toNamed(Routes.REGISTER);
  }

  void goWelcome() {
    Get.toNamed(Routes.WELCOME);
  }

  void goPilihLokasi() {
    Get.toNamed(Routes.LOKASI);
  }

  void goKerangjang({required List<DataProduct>? arguments}) {
    Get.toNamed(
      Routes.KERANJANG,
      arguments: arguments,
    );
  }

  void goDasboard() {
    Get.offAllNamed(
      Routes.DASHBOARD,
    );
  }
}

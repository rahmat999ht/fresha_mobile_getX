import 'package:fresha_mobile/app/modules/dashboard_item/akun/views/akun_view.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/home/views/home_view.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/kategori/views/kategori_view.dart';
import 'package:fresha_mobile/app/modules/dashboard_item/pesanan/views/pesanan_view.dart';

import '../../../core.dart';

class ScreenConstant {
  static const widgetOptions = [
    NavBarScreen(
      title: KeysNavBar.beranda,
      icon: KeysNavBar.iconBeranda,
      screen: HomeView(),
    ),
    NavBarScreen(
      title: KeysNavBar.kategori,
      icon: KeysNavBar.iconKategori,
      screen: KategoriView(),
    ),
    NavBarScreen(
      title: KeysNavBar.pesanan,
      icon: KeysNavBar.iconPesanan,
      screen: PesananView(),
    ),
    NavBarScreen(
      title: KeysNavBar.akun,
      icon: KeysNavBar.iconAkun,
      screen: AkunView(),
    ),
  ];
}

class NavBarScreen {
  final String title;
  final IconData icon;
  final Widget screen;

  const NavBarScreen({
    required this.title,
    required this.icon,
    required this.screen,
  });
}

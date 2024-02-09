import '../../../../core.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selectedIndex = controller.selectedIndex;
    const screen = ScreenConstant.widgetOptions;

    return Scaffold(
      body: Obx(
        () => screen.elementAt(selectedIndex.value).screen,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: fab(context),
      bottomNavigationBar: Obx(
        () => bottomNavBar(
          selectedIndex: selectedIndex,
          context: context,
        ),
      ),
    );
  }

  GestureDetector fab(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goKerangjang(arguments: null);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 50.0,
        width: 50.0,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          child: Icon(
            Icons.shopping_cart_outlined,
            color: context.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }

  BottomAppBar bottomNavBar({
    required RxInt selectedIndex,
    required BuildContext context,
  }) {
    return BottomAppBar(
      color: context.colorScheme.background,
      child: Row(
        children: [
          const Spacer(),
          ButtonNavBar(
            index: 0,
            selectedIndex: selectedIndex.value,
            label: KeysNavBar.beranda,
            icon: KeysNavBar.iconBeranda,
            onTap: () => selectedIndex.value = 0,
          ),
          const Spacer(),
          ButtonNavBar(
            index: 1,
            selectedIndex: selectedIndex.value,
            label: KeysNavBar.kategori,
            icon: KeysNavBar.iconKategori,
            onTap: () => selectedIndex.value = 1,
          ),
          const Spacer(flex: 4),
          ButtonNavBar(
            index: 2,
            selectedIndex: selectedIndex.value,
            label: KeysNavBar.pesanan,
            icon: KeysNavBar.iconPesanan,
            onTap: () => selectedIndex.value = 2,
          ),
          const Spacer(),
          ButtonNavBar(
            index: 3,
            selectedIndex: selectedIndex.value,
            label: KeysNavBar.akun,
            icon: KeysNavBar.iconAkun,
            onTap: () => selectedIndex.value = 3,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

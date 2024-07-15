import '../../../../../core.dart';
import '../../products/views/products_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final titleMedium = context.textTheme.titleMedium!;
    final titleMediumBold = context.titleMediumBold;
    final color = context.colorScheme;
    final size = context.deviceSize;
    final selectedIndex = controller.selectedIndex;

    return Scaffold(
      backgroundColor: color.outlineVariant.withOpacity(0.3),
      appBar: appBarBeranda(
        color: color,
        titleMedium: titleMedium,
        titleMediumBold: titleMediumBold,
        searchC: controller.searchC,
        onTapTitle: context.goPilihLokasi,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              contentSwip(
                color: color,
                size: size,
                swiperC: controller.swiperC,
                stateController: selectedIndex,
                selectedIndex: selectedIndex.value,
              ),
              if (controller.isLogin.isFalse) const Gap(16),
              if (controller.isLogin.isFalse)
                cardDaftarAkun(
                  onTapLogin: context.goWelcome,
                ),
              const Gap(16),
              const SizedBox(
                height: 330,
                child: ProductsView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector cardDaftarAkun({
    required void Function() onTapLogin,
  }) {
    return GestureDetector(
      onTap: onTapLogin,
      child: const Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Gap(20),
              Icon(
                Icons.login,
                size: 32,
              ),
              Gap(20),
              Expanded(
                child: Text(
                  KeysBeranda.daftarAkun,
                  softWrap: true,
                  style: TextStyle(
                    height: 1.2,
                  ),
                ),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarBeranda({
    required ColorScheme color,
    required TextStyle titleMedium,
    required TextStyle titleMediumBold,
    required TextEditingController searchC,
    required void Function() onTapTitle,
  }) {
    return AppBar(
      backgroundColor: color.background,
      centerTitle: true,
      title: GestureDetector(
        onTap: onTapTitle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on,
              color: color.onBackground,
            ),
            RichText(
              text: TextSpan(
                text: KeysBeranda.dikirimKe,
                style: titleMedium,
                children: <TextSpan>[
                  TextSpan(
                    text: KeysBeranda.pilihLokasi,
                    style: titleMediumBold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottom: formSearch(searchC),
    );
  }

  PreferredSize formSearch(TextEditingController searchC) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: Row(
        children: [
          const Gap(20),
          Expanded(
            child: TextFormField(
              controller: searchC,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: KeysBeranda.hintCari,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 0,
                ),
              ),
            ),
          ),
          const Gap(20),
          const Icon(Icons.email_outlined),
          const Gap(20),
        ],
      ),
    );
  }

  Container contentSwip({
    required ColorScheme color,
    required Size size,
    required SwiperController swiperC,
    required RxInt stateController,
    required int selectedIndex,
  }) {
    return Container(
      color: color.background,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
            child: Swiper(
              autoplay: true,
              itemCount: 8,
              controller: swiperC,
              itemBuilder: (c, i) {
                return cardSwiper(size);
              },
              onIndexChanged: (i) {
                stateController.value = i;
              },
            ),
          ),
          indocatorSwip(
            size,
            selectedIndex,
            color,
          ),
          const Gap(8),
        ],
      ),
    );
  }

  Row indocatorSwip(Size size, int selectedIndex, ColorScheme color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Gap(20),
        SizedBox(
          width: size.width * 0.4,
          height: 16,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (c, i) {
              return Card(
                // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                color:
                    selectedIndex == i ? color.primary : color.outlineVariant,
                child: const SizedBox(
                  height: 8,
                  width: 8,
                ),
              );
            },
          ),
        ),
        const Spacer(),
        const Text(KeysBeranda.lihatSemua),
        const Gap(20),
      ],
    );
  }

  Card cardSwiper(Size size) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            KeysAssets.sayur,
            width: size.width * 0.3,
          ),
          const Gap(20),
          SvgPicture.asset(
            KeysAssets.fresha,
            width: size.width * 0.4,
          )
        ],
      ),
    );
  }
}

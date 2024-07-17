import '../../../../core.dart';
import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  const KeranjangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.outlineVariant.withOpacity(0.3),
      appBar: appBarKeranjang(
        title: 'Keranjang Belanja',
        context: context,
      ),
      body: Column(
        children: [
          Obx(
            () => contentShop(
              context: context,
              listShop: controller.listShop,
            ),
          ),
          headerRekomendasiProduct(
            title: 'Yang Paling Dicari',
            subtitle: 'Product Kecintaan Terlaris',
            context: context,
          ),
          controller.obx(
            (state) => contentProduct(
              context: context,
              state: state,
            ),
            onLoading: const Expanded(child: LoadingState()),
            onError: (error) => ErrorState(error: error.toString()),
            onEmpty: const EmptyState(),
          ),
          cardCheckout(
            context: context,
            onTapCheckout: () {
              Get.toNamed(
                Routes.CHECKOUT,
                arguments: controller.listShop,
              );
            },
          ),
        ],
      ),
    );
  }

  Expanded contentShop({
    required BuildContext context,
    required RxMap<DataProduct, int> listShop,
  }) {
    return Expanded(
      child: (controller.listShop.isNotEmpty)
          ? SingleChildScrollView(
              child: Column(
                children: listShop.keys.map((product) {
                  return cardShop(
                    context: context,
                    state: product,
                    count: listShop[product] ?? 0,
                    onTapPlus: () {
                      controller.addListShop(product);
                    },
                    onTapMines: () {
                      controller.deleteListShop(product);
                    },
                  );
                }).toList(),
              ),
            )
          : keranjangKosong(context),
    );
  }

  SizedBox contentProduct({
    required BuildContext context,
    required List<DataProduct>? state,
  }) {
    return SizedBox(
      height: 260,
      child: (state != null)
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: state.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return cardProduct(
                  context: context,
                  state: state[index],
                  onTapTambah: () {
                    controller.addListShop(state[index]);
                  },
                );
              },
            )
          : const EmptyState(),
    );
  }

  AppBar appBarKeranjang({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      title: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
      backgroundColor: context.colorScheme.background,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: context.colorScheme.onBackground,
        ),
        onPressed: Get.back,
      ),
    );
  }

  Center keranjangKosong(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(
                KeysAssets.empty,
                fit: BoxFit.contain,
              ),
            ),
            const Gap(12),
            Text(
              "Yah, keranjang kamu kosong",
              style: context.titleLargeBold,
            ),
            Text(
              "Yuk belanja sekarang",
              style: context.textTheme.titleMedium,
            ),
            const Gap(12),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Belanja Sekarang'),
            // ),
          ],
        ),
      ),
    );
  }

  Container cardCheckout({
    required BuildContext context,
    required void Function() onTapCheckout,
  }) {
    return Container(
      color: context.colorScheme.background,
      padding: const EdgeInsets.only(bottom: 6, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: context.colorScheme.primary,
                size: 30,
                weight: 40,
              ),
              const SizedBox(width: 10),
              Obx(
                () => Text(
                  "Rp. ${controller.total.value}",
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onTapCheckout,
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }

  Container headerRekomendasiProduct({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: context.width,
      color: context.colorScheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.titleMediumBold,
          ),
          Text(
            subtitle,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Container cardProduct({
    required BuildContext context,
    required DataProduct state,
    required void Function() onTapTambah,
  }) {
    final dataProduct = state;
    return Container(
      width: context.width * 0.32,
      margin: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
      padding: const EdgeInsets.all(12.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        gradient: RadialGradient(
          center: Alignment.topCenter,
          colors: [
            // context.colorScheme.background,
            context.colorScheme.primary,
            context.colorScheme.background,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            child: Image.network(
              dataProduct.image,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(4),
          Text(
            dataProduct.name,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium,
          ),
          RichText(
            text: TextSpan(
              text: 'Rp. ${dataProduct.price}',
              style: context.labelMediumBold,
              children: [
                TextSpan(
                  text: ' /1kg',
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: onTapTambah,
              child: const Text('Tambah'),
            ),
          )
        ],
      ),
    );
  }

  Container cardShop({
    required BuildContext context,
    required DataProduct state,
    required void Function()? onTapPlus,
    required void Function()? onTapMines,
    required int count,
  }) {
    final dataProduct = state;
    return Container(
      width: context.width,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        gradient: RadialGradient(
          center: Alignment.centerLeft,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.background,
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Image.network(
              dataProduct.image,
              height: context.height * 0.12,
              width: context.height * 0.12,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataProduct.name,
                style: context.textTheme.titleMedium,
              ),
              RichText(
                text: TextSpan(
                  text: 'Rp. ${dataProduct.price}',
                  style: context.labelMediumBold,
                  children: [
                    TextSpan(
                      text: ' /1kg',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              InkWell(
                onTap: onTapMines,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: context.colorScheme.error,
                    ),
                  ),
                  child: const SizedBox(
                    height: 25,
                    width: 30,
                    child: Center(
                      child: Icon(Icons.remove_outlined),
                    ),
                  ),
                ),
              ),
              Text("$count /kg"),
              InkWell(
                onTap: onTapPlus,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: context.colorScheme.primary,
                  child: const SizedBox(
                    height: 25,
                    width: 30,
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import '../../../../core.dart';
import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  const KeranjangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.outlineVariant.withOpacity(0.3),
      appBar: AppBar(
        title: Text(
          'KeranjangView',
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
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView(
                children: controller.listShop.keys.map((product) {
                  if (controller.listShop.isEmpty) {
                    return const Center(
                      child: Text("PickUp masih kosong"),
                    );
                  }
                  return cardProduct(
                    context: context,
                    state: product,
                    count: controller.listShop[product] ?? 0,
                    onTapPlus: () {
                      controller.addListShop(product);
                    },
                    onTapMines: () {
                      controller.deleteListShop(product);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          headerRekomendasiProduct(
            title: 'Spesial Hari ini',
            subtitle: 'Promo menarik Hari ini untuk Kamu',
            context: context,
          ),
          controller.obx(
            (state) => SizedBox(
              height: context.height * 0.34,
              child: Expanded(
                child: (state != null)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return cardShop(
                            context: context,
                            state: state[index],
                            onTapTambah: () {
                              controller.addListShop(state[index]);
                            },
                          );
                        },
                      )
                    : const EmptyState(),
              ),
            ),
            onLoading: const LoadingState(),
            onError: (error) => ErrorState(error: error.toString()),
            onEmpty: const EmptyState(),
          ),
          cardCheckout(
            context: context,
            onTapCheckout: () {},
          ),
        ],
      ),
    );
  }

  Padding cardCheckout({
    required BuildContext context,
    required void Function() onTapCheckout,
  }) {
    return Padding(
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
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 35),
              minimumSize: const Size(100, 35),
              backgroundColor: context.colorScheme.primary,
            ),
            onPressed: onTapCheckout,
            child: const Text(
              'Checkout',
              style: TextStyle(fontSize: 16),
            ),
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
            // 'Spesial Hari ini',
            style: context.titleMediumBold,
          ),
          Text(
            subtitle,
            // 'Promo menarik Hari ini untuk Kamu',
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Container cardShop({
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
            child: Image.network(
              dataProduct.image,
              height: context.height * 0.12,
              width: context.height * 0.12,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(4),
          Text(
            dataProduct.name,
            style: context.textTheme.titleMedium,
          ),
          const Text('1kg'),
          Text(
            'Rp. ${dataProduct.price}',
            style: context.labelMediumBold,
          ),
          const Gap(8),
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

  Container cardProduct({
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
              height: context.height * 0.1,
              width: context.height * 0.1,
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
              const Text('1kg'),
              Text(
                'Rp. ${dataProduct.price}',
                style: context.labelMediumBold,
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
                    height: 30,
                    width: 40,
                    child: Center(
                      child: Icon(Icons.remove_outlined),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: Text("$count"),
                ),
              ),
              InkWell(
                onTap: onTapPlus,
                child: Card(
                  color: context.colorScheme.primary,
                  child: const SizedBox(
                    height: 30,
                    width: 40,
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

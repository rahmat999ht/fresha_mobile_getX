import 'package:fresha_mobile/core.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.background,
        title: Text(
          'Checkout',
          style: context.titleLargeBold,
        ),
      ),
      body:
          // controller.obx(
          //   (state) =>
          Column(
        children: [
          cardHeader(context),
          Obx(
            () => contentShop(
              context: context,
              listShop: controller.listShop,
            ),
          ),
          cardDetail(
            context: context,
            item: controller.listShop.length,
          ),
        ],
      ),
      //   onLoading: const LoadingState(),
      //   onError: (error) => ErrorState(error: error.toString()),
      //   onEmpty: const EmptyState(),
      // ),
      bottomNavigationBar: Obx(
        () => cardPesan(
          context: context,
          onTapPesan:
              controller.isLoading.isFalse ? controller.addOrder : null,
        ),
      ),
    );
  }

  Container cardDetail({
    required BuildContext context,
    required int item,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: context.colorScheme.primaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Detail Pesanan
          //
          // Total Harga (1 Barang)                                          Rp.5.900
          // Total ongkos kirim                                                  Rp14.500
          //  Pesnan di antar pada : 20 mei 2024, 13:02
          const Text(
            'Detail Pesanan',
            style: TextStyle(fontSize: 20),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Barang',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$item',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Ongkir',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Rp. 8000',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Gap(12),
          const Text(
            'Pesanan akan lansung diantarkan',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Container cardHeader(
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: context.colorScheme.primaryContainer,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Pengiriman',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'jeni | (+62) 812-4490-9005',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Bumi Permata Sudiang (BPS 1),Blok K1 No.3, Sudiang, Biring Kanaya, Kota MAkassar, Sulawesi Selatan, ID 90242',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Container cardPesan({
    required BuildContext context,
    required void Function()? onTapPesan,
  }) {
    return Container(
      color: context.colorScheme.background,
      padding: const EdgeInsets.only(bottom: 6, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("Total Bayar : "),
              const Gap(8),
              Obx(
                () => Text(
                  "Rp. ${controller.total.value}",
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onTapPesan,
            child: controller.isLoading.isFalse
                ? const Text('Pesan')
                : const CircularProgressIndicator(),
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
        shadows: [
          BoxShadow(
            color: context.colorScheme.secondary,
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
}

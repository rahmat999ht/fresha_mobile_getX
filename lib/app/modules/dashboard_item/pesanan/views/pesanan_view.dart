import '../../../../../core.dart';
import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final textStyle = context.textTheme;
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: context.colorScheme.outlineVariant.withOpacity(0.3),
        appBar: AppBar(
          title: Text(KeysNavBar.pesanan, style: textStyle.titleLarge),
          backgroundColor: color.background,
          bottom: tapBarPesanan(textStyle: textStyle),
        ),
        body: controller.obx(
          (state) => TabBarView(
            children: <Widget>[
              bodyDiProses(
                state: state!,
                context: context,
              ),
              bodySelesai(
                state: state,
                context: context,
              ),
            ],
          ),
          onLoading: const LoadingState(),
          onError: (error) => ErrorState(error: error.toString()),
          onEmpty: keranjangKosong(context: context),
        ),
      ),
    );
  }

  Widget bodySelesai({
    required List<DataOrderByCustamer> state,
    required BuildContext context,
  }) {
    final initData =
        state.where((element) => element.status == 'done').toList();

    if (initData.isEmpty) {
      return keranjangKosong(context: context);
    } else {
      return ListView.builder(
        itemCount: initData.length,
        itemBuilder: (ctx, i) {
          final data = initData[i];
          return Text(data.status);
        },
      );
    }
  }

  Widget bodyDiProses({
    required List<DataOrderByCustamer> state,
    required BuildContext context,
  }) {
    final initData =
        state.where((element) => element.status == 'processed').toList();

    if (initData.isEmpty) {
      return keranjangKosong(context: context);
    } else {
      return ListView.builder(
        itemCount: initData.length,
        itemBuilder: (ctx, i) {
          final data = initData[i];
          return cardOrder(
            context: context,
            dataOrder: data,
          );
        },
      );
    }
  }

  TabBar tapBarPesanan({required TextTheme textStyle}) {
    return TabBar(
      tabs: <Widget>[
        Tab(
          child: Text(
            '${KeysPesanan.diproses} (0)',
            style: textStyle.bodyLarge,
          ),
        ),
        Tab(
          child: Text(
            '${KeysPesanan.selesai} (0)',
            style: textStyle.bodyLarge,
          ),
        ),
      ],
    );
  }

  Center keranjangKosong({
    required BuildContext context,
  }) {
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
              "Yah, Pesanan mu masih kosong",
              style: context.titleLargeBold,
            ),
            Text(
              "Yuk belanja sekarang",
              style: context.textTheme.titleMedium,
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Belanja Sekarang'),
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }

  Container cardOrder({
    required BuildContext context,
    required DataOrderByCustamer dataOrder,
  }) {
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
          ...dataOrder.listProduct.map(
            (e) => Card(
              child: Image.network(
                e.product.image,
                height: context.height * 0.1,
                width: context.height * 0.1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataOrder.orderById,
                style: context.textTheme.titleMedium,
              ),
              const Text('1kg'),
              Text(
                'Rp. ${dataOrder.totBuy}',
                style: context.labelMediumBold,
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // context.goKerangjang(
              //   arguments: dataOrder.listProduct.first,
              // );
            },
            child: const Text("Pesan Lagi"),
          ),
        ],
      ),
    );
  }
}

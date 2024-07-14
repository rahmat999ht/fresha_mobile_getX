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
          onEmpty: const EmptyState(),
        ),
      ),
    );
  }

  Widget bodySelesai({
    required ModelOrders state,
    required BuildContext context,
  }) {
    final initData =
        state.data.where((element) => element.status == 'selesai').toList();

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
    required ModelOrders state,
    required BuildContext context,
  }) {
    final initData =
        state.data.where((element) => element.status == 'diproses').toList();

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
    required DataOrder dataOrder,
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
      child: FutureBuilder(
        future: controller.productProvider.fetchIdProducts(dataOrder.id),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.none ||
              snap.data == null) {
            return const EmptyState();
          }
          if (snap.connectionState == ConnectionState.waiting) {
            return const LoadingState();
          }
          final data = snap.data!.data;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Image.network(
                  data.image,
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
                    data.name,
                    style: context.textTheme.titleMedium,
                  ),
                  const Text('1kg'),
                  Text(
                    'Rp. ${data.price}',
                    style: context.labelMediumBold,
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.goKerangjang(
                    arguments: data,
                  );
                },
                child: const Text("Pesan Lagi"),
              ),
            ],
          );
        },
      ),
    );
  }
}

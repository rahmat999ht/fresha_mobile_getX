import 'dart:developer';

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
          (state) {
            final dataDone =
                state!.where((element) => element.status == "done").toList();
            log(dataDone.length.toString(), name: 'dataDone');
            final dataProcessed = state
                .where((element) => element.status == "processed")
                .toList();
            log(dataProcessed.length.toString(), name: 'dataProcessed');
            return TabBarView(
              children: <Widget>[
                bodyDiProses(
                  state: dataProcessed,
                  context: context,
                ),
                bodySelesai(
                  state: dataDone,
                  context: context,
                ),
              ],
            );
          },
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
    if (state.isEmpty) {
      return keranjangKosong(context: context);
    } else {
      return ListView.builder(
        itemCount: state.length,
        itemBuilder: (ctx, i) {
          final data = state[i];
          return cardOrder(
            context: context,
            dataOrder: data,
          );
        },
      );
    }
  }

  Widget bodyDiProses({
    required List<DataOrderByCustamer> state,
    required BuildContext context,
  }) {
    if (state.isEmpty) {
      return keranjangKosong(context: context);
    } else {
      return ListView.builder(
        itemCount: state.length,
        itemBuilder: (ctx, i) {
          final data = state[i];
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
          child: Obx(
            () => Text(
              '${KeysPesanan.diproses} (${controller.itemProcessed.value})',
              style: textStyle.bodyLarge,
            ),
          ),
        ),
        Tab(
          child: Obx(
            () => Text(
              '${KeysPesanan.selesai} (${controller.itemDone.value})',
              style: textStyle.bodyLarge,
            ),
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
      height: 130,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: ShapeDecoration(
        color: context.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side:
              BorderSide(width: 1, color: context.colorScheme.primaryContainer),
        ),
        // gradient: RadialGradient(
        //   center: Alignment.centerLeft,
        //   colors: [
        //     context.colorScheme.background,
        //     context.colorScheme.background,
        //   ],
        // ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    ...dataOrder.listProduct.map((e) {
                      final productName = e.product.name;
                      return TextSpan(
                        text: "$productName, ",
                        style: context.titleMediumBold,
                      );
                    }),
                  ],
                ),
              ),
              Text('${dataOrder.listProduct.length} item'),
              const Gap(20),
              if (dataOrder.status == "done") const Text('Sayur telah diantar'),
              if (dataOrder.status == "processed")
                const Text('Sayur telah dikemas'),
              Text('${dataOrder.updatedAt.copyWith(
                isUtc: false,
                hour: null,
                minute: null,
                second: null,
                microsecond: null,
                millisecond: null,
              )}'),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Rp. ${dataOrder.totBuy}',
                  style: context.labelMediumBold,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.goKerangjang(
                      arguments:
                          dataOrder.listProduct.map((e) => e.product).toList(),
                    );
                  },
                  child: const Text("Pesan Lagi"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

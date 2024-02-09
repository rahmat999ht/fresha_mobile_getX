import 'package:fresha_mobile/model/model_order.dart';

import '../../../../../core.dart';
import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final textStyle = context.textTheme;
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
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
    if (state.data.isEmpty) {
      return keranjangKosong(context: context);
    } else {
       return ListView.builder(
        itemCount: state.data.length,
        itemBuilder: (ctx, i) {
          final data = state.data[i];
          return Text(data.status);
        },
      );
    }
  }

  Widget bodyDiProses({
    required ModelOrders state,
    required BuildContext context,
  }) {
    if (state.data.isEmpty) {
      return keranjangKosong(context: context);
    } else {
      return ListView.builder(
        itemCount: state.data.length,
        itemBuilder: (ctx, i) {
          final data = state.data[i];
          return Text(data.status);
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
}

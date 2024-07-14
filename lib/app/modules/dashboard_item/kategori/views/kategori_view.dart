import '../../../../../core.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.outlineVariant.withOpacity(0.3),
      appBar: appBarKategori(
        context: context,
      ),
      body: Column(
        children: [
          contentFilter(
            context: context,
          ),
          controller.obx(
            (state) => contentProduct(
              state: state,
              context: context,
            ),
            onLoading: const LoadingState(),
            onError: (error) => ErrorState(error: error.toString()),
            onEmpty: const EmptyState(),
          ),
        ],
      ),
    );
  }

  Container contentFilter({
    required BuildContext context,
  }) {
    return Container(
      color: context.colorScheme.background,
      child: SingleChildScrollView(
        child: Row(
          children: [
            const Gap(12),
            ...controller.listKategori.map(
              (element) => Padding(
                padding: const EdgeInsets.only(top: 4, left: 4, bottom: 4),
                child: OutlinedButton(
                  onPressed: () async {
                    await controller.onChangeFilter(filter: element);
                  },
                  child: Text(element),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded contentProduct({
    required List<DataProduct>? state,
    required BuildContext context,
  }) {
    return Expanded(
      child: Column(
        children: [
          if (state != null)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.500,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
                itemCount: state.length,
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal, // The default is vertical.
                // reverse: true, // The default is false, going down (or left to right).
                itemBuilder: (BuildContext ctx, int index) {
                  return cardShop(
                    context: context,
                    state: state[index],
                    onTapTambah: () {},
                  );
                },
              ),
            )
          else
            const EmptyState(),
        ],
      ),
    );
  }

  AppBar appBarKategori({
    required BuildContext context,
  }) {
    return AppBar(
      backgroundColor: context.colorScheme.background,
      title: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.searchC,
              onChanged: (search) => controller.onChangeSearch(search: search),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: KeysBeranda.hintCari,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
              ),
            ),
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
      margin: const EdgeInsets.only(top: 4, right: 4, left: 4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        gradient: RadialGradient(
          center: Alignment.topCenter,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.background,
          ],
        ),
      ),
      child: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
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
}

import '../../../../../core.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Expanded(
        child: Column(
          children: [
            headerRekomendasiProduct(
              title: 'Spesial Hari ini',
              subtitle: 'Promo menarik Hari ini untuk Kamu',
              context: context,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.500,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
                // gridDelegate: CustomGridDelegate(dimension: 150.0),
                itemCount: state!.data.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal, // The default is vertical.
                // reverse: true, // The default is false, going down (or left to right).
                itemBuilder: (BuildContext ctx, int index) {
                  return cardProduct(
                    index: index,
                    state: state,
                    context: context,
                    onTap: () {
                      context.goKerangjang(
                        arguments: state.data[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      onLoading: const LoadingState(),
      onError: (error) => ErrorState(error: error.toString()),
      onEmpty: const EmptyState(),
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

  InkWell cardProduct({
    required BuildContext context,
    required int index,
    required ModelProduct state,
    required void Function() onTap,
  }) {
    final dataProduct = state.data[index];
    return InkWell(
      onTap: onTap,
      child: GridTile(
        header: GridTileBar(
          title: Text('$index', style: const TextStyle(color: Colors.black)),
        ),
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.all(0),
                child: Image.network(
                  dataProduct.image,
                  // height: context.height * 0.17,
                  // width: context.height * 0.17,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(4),
              Text(
                dataProduct.name,
                style: context.textTheme.titleMedium,
              ),
              const Spacer(),
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
        ),
      ),
    );
  }
}

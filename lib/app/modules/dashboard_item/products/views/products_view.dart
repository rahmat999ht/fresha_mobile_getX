import '../../../../../core.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        headerRekomendasiProduct(
          title: 'Spesial Hari ini',
          subtitle: 'Promo menarik Hari ini untuk Kamu',
          context: context,
        ),
        controller.obx(
          (state) => Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              // gridDelegate: CustomGridDelegate(dimension: 150.0),
              itemCount: state!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              // The default is vertical.
              // reverse: true, // The default is false, going down (or left to right).
              itemBuilder: (BuildContext ctx, int index) {
                return cardProduct(
                  state: state[index],
                  context: context,
                  onTap: () {
                    context.goKerangjang(
                      arguments: [state[index]],
                    );
                  },
                );
              },
            ),
          ),
          onLoading: const LoadingState(),
          onError: (error) => ErrorState(error: error.toString()),
          onEmpty: productKosong(context: context),
        ),
      ],
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
    required DataProduct state,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 12, right: 6, left: 6),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.height * 0.19,
              width: context.height * 0.19,
              child: Image.network(
                state.image,
                height: context.height * 0.19,
                width: context.height * 0.19,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(4),
            Text(
              state.name,
              style: context.textTheme.titleMedium,
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Rp. ${state.price}',
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
    );
  }

  Center productKosong({
    required BuildContext context,
  }) {
    return Center(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.isLogin.isTrue
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 200,
                    ),
                    const Gap(12),
                    Text(
                      "Ayo lakukan orderan pertamamu",
                      style: context.titleLargeBold,
                    ),
                    Text(
                      "Yuk order sekarang!",
                      style: context.textTheme.titleMedium,
                    ),
                    // const Gap(12),
                    // ElevatedButton(
                    //   onPressed: controller.toDaftar,
                    //   child: const Text('Daftar'),
                    // ),
                    const Gap(12),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 200,
                    ),
                    const Gap(12),
                    Text(
                      "Yah, Kamu belum punya akun",
                      style: context.titleLargeBold,
                    ),
                    Text(
                      "Yuk Login sekarang!",
                      style: context.textTheme.titleMedium,
                    ),
                    // const Gap(12),
                    // ElevatedButton(
                    //   onPressed: controller.toDaftar,
                    //   child: const Text('Daftar'),
                    // ),
                    const Gap(12),
                  ],
                ),
        ),
      ),
    );
  }
}

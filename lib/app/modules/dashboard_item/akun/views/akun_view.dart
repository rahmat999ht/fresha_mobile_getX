import '../../../../../core.dart';
import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  const AkunView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final size = context.deviceSize;
    final titleMedium = context.textTheme.titleMedium!;
    final titleMediumBold = context.titleMediumBold;

    return Scaffold(
      backgroundColor: color.outlineVariant.withOpacity(0.3),
      appBar: appBarTitle(
        title: KeysNavBar.akun,
        context: context,
      ),
      body: controller.obx(
        (state) => (controller.isLogin.isFalse)
            ? belumLogin(context: context)
            : Column(
                children: [
                  headerAkun(
                    name: state?.name ?? "kosong",
                    imageUrl: state?.image,
                    size: size,
                    color: color,
                    titleMediumBold: titleMediumBold,
                    titleMedium: titleMedium,
                    onTap: () {},
                  ),
                  const Gap(30),
                  cardAkun(
                    title: 'Daftar Alamat Saya',
                    icons: Icons.location_on_outlined,
                    color: color,
                    titleMedium: titleMedium,
                  ),
                  const Gap(4),
                  cardAkun(
                    title: 'Pengaturan Akun',
                    icons: Icons.settings,
                    color: color,
                    titleMedium: titleMedium,
                  ),
                ],
              ),
        onLoading: const LoadingState(),
        onError: (error) => ErrorState(error: error.toString()),
        onEmpty: belumLogin(context: context),
      ),
    );
  }

  Container cardAkun({
    required String title,
    required IconData icons,
    required ColorScheme color,
    required TextStyle titleMedium,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(color: color.background),
      child: Row(
        children: [
          Icon(icons),
          const Gap(12),
          Text(
            title,
            style: titleMedium,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: color.primary,
          ),
        ],
      ),
    );
  }

  Container headerAkun({
    required String name,
    required String? imageUrl,
    required Size size,
    required ColorScheme color,
    required TextStyle titleMediumBold,
    required TextStyle titleMedium,
    required void Function() onTap,
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: color.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: color.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.person,
                    size: 60,
                  ),
          ),
          const Gap(12),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' $name',
                  style: titleMediumBold,
                ),
                const Gap(4),
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      const Icon(Icons.edit_outlined),
                      Text(
                        'Ubah Profil',
                        style: titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center belumLogin({
    required BuildContext context,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              "Yuk Login sekarang",
              style: context.textTheme.titleMedium,
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: controller.toDaftar,
              child: const Text('Daftar'),
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}

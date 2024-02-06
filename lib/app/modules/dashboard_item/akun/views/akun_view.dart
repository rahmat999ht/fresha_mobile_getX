import '../../../../../core.dart';
import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  const AkunView({Key? key}) : super(key: key);
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
      body: Column(
        children: [
          headerAkun(
            name: 'nama',
            size: size,
            color: color,
            titleMediumBold: titleMediumBold,
            titleMedium: titleMedium,
            onTap: (){},
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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://i0.wp.com/fahum.umsu.ac.id/wp-content/uploads/2023/11/bapak-gus-dur-profil-dan-kiprah-presiden-keempat-indonesia.webp?resize=750%2C375&ssl=1',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
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
}

import 'package:fresha_mobile/core.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  EasyLoading.init();
  HiveService hiveService = HiveService();
  hiveService.hiveInit();
  var initialRoute = Routes.DASHBOARD;
  runApp(FutureBuilder(
    future: Future.delayed(const Duration(seconds: 3)),
    builder: (context, s) {
      if (s.connectionState == ConnectionState.waiting) {
        return const MaterialApp(
          title: "Pulse Detector",
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      } else {
        return Main(initialRoute);
      }
    },
  ));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fresha",
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      builder: EasyLoading.init(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              KeysAssets.sayur,
              width: context.width * 0.3,
            ),
            const Gap(20),
            SvgPicture.asset(
              KeysAssets.fresha,
              width: context.width * 0.4,
            )
          ],
        ),
      ),
    );
  }
}

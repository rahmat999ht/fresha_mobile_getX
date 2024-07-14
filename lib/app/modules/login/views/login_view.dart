import '../../../../core.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final size = context.deviceSize;
    final titleMediumBold = context.titleMediumBold;

    final titleLargeBold = context.titleLargeBold.copyWith(
      color: color.primary,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              width: size.width,
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(KeysAssets.headerLogin),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formkey,
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masuk',
                        style: titleLargeBold,
                      ),
                      Text(
                        'Masukkan Email Anda',
                        style: titleMediumBold,
                      ),
                      formLogin(
                        hint: "Email",
                        cForm: controller.cFormEmail,
                        context: context,
                        info: controller.isEmailMessage.value,
                        onTap: controller.popUpGoogleAkun,
                      ),
                      const Gap(12),
                      ElevatedButton(
                        onPressed: () {
                          controller.isLoading.value
                              ? null
                              : controller.login(context: context);
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(size.width, 40),
                        ),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(
                                color: context.colorScheme.background,
                              )
                            : const Text("Masuk"),
                      ),
                      const Gap(12),
                      const Stack(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lock),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24),
                            child: Text(
                              "Data anda sudah dilindungi dan tidak dibagikan. Dengan menggunakan layanan Sayurbox, anda telah menyetujui Syarat dan Ketentuan dan Kebijakan Privasi kami",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector formLogin({
    required String hint,
    required TextEditingController cForm,
    required BuildContext context,
    required String? info,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            controller: cForm,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 0,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: context.colorScheme.primary.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Visibility(
            visible: info != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                info ?? "",
                style: context.labelLargeBold.copyWith(
                  color: context.colorScheme.error,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

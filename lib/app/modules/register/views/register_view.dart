import '../../../../core.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
            appBarBack(size),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formkey,
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daftar',
                        style: titleLargeBold,
                      ),
                      Text(
                        'Masukkan Email Anda',
                        style: titleMediumBold,
                      ),
                      formRegis(
                        title: "name",
                        cForm: controller.cFormName,
                        keyboardType: TextInputType.name,
                        info: controller.isNameMessage.value,
                        context: context,
                      ),
                      const Gap(12),
                      GestureDetector(
                        onTap: controller.popUpGoogleAkun,
                        child: formRegis(
                          title: "email",
                          cForm: controller.cFormEmail,
                          keyboardType: TextInputType.emailAddress,
                          info: controller.isEmailMessage.value,
                          context: context,
                          enabled: false,
                        ),
                      ),
                      const Gap(12),
                      buttonRegis(
                        title: "Lanjutkan",
                        context: context,
                        size: size,
                        onPressed: () {
                          controller.isLoading.value
                              ? null
                              : controller.register();
                        },
                      ),
                      const Gap(12),
                      contentDataDiLindungi(),
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

  Stack contentDataDiLindungi() {
    return const Stack(
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
    );
  }

  ElevatedButton buttonRegis({
    required void Function()? onPressed,
    required String title,
    required BuildContext context,
    required Size size,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(size.width, 40),
      ),
      child: controller.isLoading.value
          ? CircularProgressIndicator(
              color: context.colorScheme.background,
            )
          : Text(title),
    );
  }

  Column formRegis({
    required String title,
    required TextEditingController? cForm,
    required TextInputType? keyboardType,
    required String? info,
    required BuildContext context,
    bool? enabled,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          enabled: enabled ?? true,
          controller: cForm,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: title,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 0,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
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
    );
  }

  Container appBarBack(Size size) {
    return Container(
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
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
    );
  }
}

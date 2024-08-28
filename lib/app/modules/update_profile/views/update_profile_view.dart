import 'package:fresha_mobile/core.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informasi Pribadi',
          style: context.textTheme.titleLarge,
        ),
        backgroundColor: context.colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Form(
              key: controller.formkey,
              child: Column(
                children: [
                  headerAkun(
                    title: 'Perbarui Profil Anda',
                    imageUrl: null,
                    context: context,
                  ),
                  formUpdateProfil(
                    hint: "Email",
                    cForm: controller.cFormEmail,
                    context: context,
                    enabled: false,
                    info: controller.isEmailMessage.value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  formUpdateProfil(
                    hint: "Name",
                    cForm: controller.cFormName,
                    context: context,
                    enabled: true,
                    info: controller.isNameMessage.value,
                    keyboardType: TextInputType.name,
                  ),
                  formUpdateProfil(
                    hint: "Phone",
                    cForm: controller.cFormPhone,
                    context: context,
                    enabled: true,
                    info: controller.isPhoneMessage.value,
                    keyboardType: TextInputType.phone,
                  ),
                  formUpdateProfil(
                    hint: "Alamat",
                    cForm: controller.cFormAddress,
                    context: context,
                    enabled: true,
                    info: controller.isAddressMessage.value,
                    keyboardType: TextInputType.streetAddress,
                  ),
                  const Gap(40),
                  buttonUpdateProfile(
                    title: "Simpan",
                    context: context,
                    onPressed: controller.isLoading.isTrue
                        ? null
                        : () {
                      if (controller.formkey.currentState!.validate()) {
                        controller.updateProfil();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buttonUpdateProfile({
    required void Function()? onPressed,
    required String title,
    required BuildContext context,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(context.width, 40),
      ),
      child: controller.isLoading.isTrue
          ? CircularProgressIndicator(
              color: context.colorScheme.background,
            )
          : Text(title),
    );
  }

  Container headerAkun({
    required String title,
    required String? imageUrl,
    required BuildContext context,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: context.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: context.textTheme.titleLarge,
          ),
          const Gap(20),
          Card(
            color: context.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.person,
                    size: 160,
                  ),
          ),
          const Gap(12),
        ],
      ),
    );
  }

  Column formUpdateProfil({
    required String hint,
    required TextEditingController cForm,
    required BuildContext context,
    required String? info,
    required bool enabled,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: enabled,
          controller: cForm,
          keyboardType: keyboardType,
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
        if (info != null)
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                info ,
                style: context.labelLargeBold.copyWith(
                  color: context.colorScheme.error,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        const Gap(8),
      ],
    );
  }
}

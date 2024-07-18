import 'dart:developer';

import 'package:fresha_mobile/provider/customer_provider.dart';

import '../../../../core.dart';

class UpdateProfileController extends GetxController {
  final CustomerProvider customerProvider;
  final PrefService prefService;

  UpdateProfileController({
    required this.customerProvider,
    required this.prefService,
  });

  late DataCustomer dataCustamer;

  final isLoading = false.obs;
  final formkey = GlobalKey<FormState>();

  final cFormEmail = TextEditingController();
  final cFormName = TextEditingController();
  final cFormPhone = TextEditingController();
  final cFormAddress = TextEditingController();
  var isEmailMessage = ''.obs;
  var isNameMessage = ''.obs;
  var isPhoneMessage = ''.obs;
  var isAddressMessage = ''.obs;
  var idCustomer = '';

  void setFormEmail(String value) => cFormEmail.text = value;

  void setFormName(String value) => cFormName.text = value;

  void setFormPhone(String value) => cFormPhone.text = value;

  void setFormAddress(String value) => cFormAddress.text = value;

  void loadingState() => isLoading.value = !isLoading.value;

  @override
  void onInit() {
    prefService.prefInit();
    idCustomer = prefService.getIdCustomer.toString();
    if (Get.arguments != null) {
      dataCustamer = Get.arguments;
      setFormEmail(dataCustamer.email);
      setFormName(dataCustamer.name);
      setFormPhone(dataCustamer.phone ?? '');
      setFormAddress(dataCustamer.address ?? '');
    }
    super.onInit();
  }

  bool nullValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  String _validateName(String name) {
    if (nullValidation(name)) {
      return isNameMessage.value = 'Nama harap diisi';
    }
    return isNameMessage.value = '';
  }

  String _validatePhone(String phone) {
    if (nullValidation(phone)) {
      return isPhoneMessage.value = 'Nomor telepon harap diisi';
    } else if (!GetUtils.isPhoneNumber(phone)) {
      return isPhoneMessage.value = 'Nomor telepon tidak valid';
    }
    return isPhoneMessage.value = '';
  }

  String _validateAddress(String address) {
    if (nullValidation(address)) {
      return isAddressMessage.value = 'Alamat harap diisi';
    }
    return isAddressMessage.value = '';
  }

  Future updateProfil() async {
    try {
      _validateName(cFormName.text);
      _validatePhone(cFormPhone.text);
      _validateAddress(cFormAddress.text);
      if (formkey.currentState!.validate()) {
        log('mulai');
        loadingState();
        const image =
            'https://web.rupa.ai/wp-content/uploads/2023/06/GVS_A_profile_picture_of_Naruto_Uzumaki_the_main_character_from_6f7128de-01bb-4729-86b8-eba9b8d05625-600x600.png';
        log('mulai', name: "update Profil");
        final dataInput = ModelRequestPatchCustamer(
          id: idCustomer,
          name: cFormName.text,
          image: image,
          address: cFormAddress.text,
          phone: cFormPhone.text,
        );

        customerProvider.patchCustomer(dataInput).then((result) {
          if (result.code == 200) {
            cleanForm();
            loadingState();
            Get.back();
            return Get.snackbar(
              "Info",
              result.status,
              snackPosition: SnackPosition.TOP,
              borderRadius: 10,
            );
          } else {
            loadingState();
            return Get.snackbar(
              "Info",
              "Terjadi kesalahan saat update profil: ${result.status}",
              // Menampilkan pesan kesalahan dari server
              snackPosition: SnackPosition.TOP,
              borderRadius: 10,
            );
          }
        }, onError: (err) {
          loadingState();
          return Get.snackbar(
            "Info",
            "Terjadi kesalahan saat update profil: $err",
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
          );
        });
      }
      log('lewat');
    } catch (error) {
      log('pesan error: $error', name: "update Profil");
    }
  }

  void cleanForm() {
    cFormName.clear();
    cFormEmail.clear();
    cFormAddress.clear();
    cFormPhone.clear();
  }
}

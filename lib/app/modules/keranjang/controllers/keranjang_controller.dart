import 'dart:developer';

import '../../../../core.dart';

class KeranjangController extends GetxController
    with StateMixin<List<DataProduct>> {
  final ProductProvider productProvider;
  KeranjangController({required this.productProvider});

  late DataProduct? dataProduct;
  final List<DataProduct> listProduct = <DataProduct>[];
  final listShop = <DataProduct, int>{}.obs;
  final total = 0.obs;
  // final charge = 0.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      dataProduct = Get.arguments as DataProduct;
      addListShop(dataProduct!);
      total.value = dataProduct!.price;
      log(dataProduct!.id, name: 'kerangjang list Product');
      log(listShop.toString(), name: 'kerangjang listShop');
    } else {
      dataProduct = null;
    }
    findAllProduct();
    streamDataTotal();
    super.onInit();
  }

  void addListShop(DataProduct item) {
    if (listShop[item] == null) {
      listShop.addAll({item: 1});
      log(listShop.toString(), name: "hhh");
    } else {
      listShop[item] = listShop[item]! + 1;
    }
  }

  void deleteListShop(DataProduct item) {
    if (listShop[item] == 1) {
      listShop.remove(item);
    } else {
      listShop[item] = listShop[item]! - 1;
    }
  }

  streamDataTotal() => listShop.listen(
        (value) {
          int data = 0;
          listShop.forEach((key, value) {
            data += key.price * value;
          });
          total.value = data;
        },
      );

  Future findAllProduct() async {
    productProvider.fetchProducts().then((result) {
      if (result.code == 200) {
        // log(result.toString(), name: 'data model');
        change(result.data, status: RxStatus.success());
      } else {
        log('kosong', name: 'data kosong');
        change([], status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}

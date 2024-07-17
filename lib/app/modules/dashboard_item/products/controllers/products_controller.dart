import 'dart:developer';

import '../../../../../core.dart';

class ProductsController extends GetxController
    with StateMixin<List<DataProduct>> {
  final ProductProvider productProvider;

  ProductsController({required this.productProvider});

  var listProduct = <DataProduct>[];

  @override
  void onInit() {
    findAllProduct();
    super.onInit();
  }

  void onChangeSearch({required String value, required RxBool isSearch}) {
    final onSearch = value.isEmpty
        ? listProduct
        : listProduct
            .where((element) => element.name.toLowerCase().contains(
                  value.toLowerCase(),
                ))
            .toList();
    change(onSearch, status: RxStatus.success());
  }

  Future findAllProduct() async {
    productProvider
        .fetchProductsWhereHastag(hastag1: 'head', hastag2: 'cauliflower')
        .then((result) {
      if (result.code == 200) {
        listProduct = result.data;
        log(listProduct.length.toString(), name: 'data model');
        change(listProduct, status: RxStatus.success());
      } else {
        log('kosong', name: 'data kosong');
        change([], status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}

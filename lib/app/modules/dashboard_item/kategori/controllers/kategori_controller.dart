import 'dart:developer';

import '../../../../../core.dart';

class KategoriController extends GetxController
    with StateMixin<List<DataProduct>> {
  final ProductProvider productProvider;

  KategoriController({required this.productProvider});

  final searchC = TextEditingController();
  var listProduct = <DataProduct>[];
  final listKategori = <String>{'All'};
  var filterListKategori = <ModelFilter>[].obs;

  final isSearch = false.obs;

  @override
  void onInit() async {
    await findAllProduct();
    super.onInit();
  }

  Future onChangeFilter({required String filter}) async {
    if (filter == 'All') {
      await findAllProduct();
    }
    final onFilter = listProduct.where((e) => e.category == filter).toList();
    change(onFilter, status: RxStatus.success());
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
    productProvider.fetchProducts().then((result) {
      if (result.code == 200) {
        // log(result.toString(), name: 'data model');
        for (var e in result.data) {
          listKategori.add(e.category);
        }
        filterListKategori.value = listKategori
            .map(
              (e) => ModelFilter(title: e, isSelected: false.obs),
            )
            .toList();
        listProduct = result.data;
        change(listProduct, status: RxStatus.success());
      } else {
        log('kosong', name: 'data kosong');
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}

class ModelFilter {
  final String title;
  Rx<bool> isSelected;

  ModelFilter({
    required this.title,
    required this.isSelected,
  });
}

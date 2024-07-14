import 'dart:developer';

import '../../../../../core.dart';

class KategoriController extends GetxController
    with StateMixin<List<DataProduct>> {
  final ProductProvider productProvider;
  KategoriController({required this.productProvider});

  final searchC = TextEditingController();
  var listProduct = <DataProduct>[];
  final Set listKategori = <String>{
    'All',
  };

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

  void onChangeSearch({required String search}) {
    final onSearch = listProduct.where((e) => e.name == search).toList();
    change(onSearch, status: RxStatus.success());
  }

  Future findAllProduct() async {
    productProvider.fetchProducts().then((result) {
      if (result.code == 200) {
        // log(result.toString(), name: 'data model');
        for (var e in result.data) {
          listKategori.add(e.category);
        }
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

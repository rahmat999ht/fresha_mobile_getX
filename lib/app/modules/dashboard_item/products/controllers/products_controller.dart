import 'dart:developer';

import 'package:fresha_mobile/provider/hastag_ml_provider.dart';

import '../../../../../core.dart';

class ProductsController extends GetxController
    with StateMixin<List<DataProduct>> {
  final ProductProvider productProvider;
  final HastagMlProvider hastagMlProvider;
  final PrefService prefService;

  ProductsController({
    required this.productProvider,
    required this.hastagMlProvider,
    required this.prefService,
  });

  var listProduct = <DataProduct>[];
  var listHastagMl = <ModelValueHastagMl>[
    // ModelValueHastagMl(
    //   title: 'head cabbage',
    //   value: 1,
    // ),
    // ModelValueHastagMl(
    //   title: 'head',
    //   value: 1,
    // ),
  ];
  final Map<String, int> hastagCounts = {};
  final isLogin = false.obs;

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

  @override
  void onInit() async {
    await prefService.prefInit();
    if (prefService.getIdCustomer != null) {
      log(prefService.getIdCustomer.toString(), name: "idCus Login");
      isLogin.value = true;
      await findAllhHastagMl();
    } else {
      change([], status: RxStatus.empty());
    }
    super.onInit();
  }

  Future findAllhHastagMl() async {
    if (prefService.getIdCustomer != null) {
      hastagMlProvider
          .getHastagMlWhereIdCustomer(prefService.getIdCustomer.toString())
          .then((result) {
        if (result.code == 200) {
          // Hitung kemunculan setiap hastag
          for (var e in result.data) {
            if (hastagCounts.containsKey(e.name)) {
              hastagCounts[e.name] = hastagCounts[e.name]! + 1;
            } else {
              hastagCounts[e.name] = 1;
            }
          }
          // Buat daftar ModelValueHastagMl
          listHastagMl = hastagCounts.entries
              .map((entry) => ModelValueHastagMl(
                    title: entry.key,
                    value: entry.value,
                  ))
              .toList();
          findRekomenProduct(listHastagMl);
          log(listHastagMl.toString(), name: 'data listHastagMl');
        } else {
          log('data listHastagMl kosong', name: 'kosong');
        }
      }, onError: (err) {
        log('error listHastagMl: $err', name: 'error');
      });
    } else {
      log('data listHastagMl kosong', name: 'getIdCustomer');
    }
  }

  Future findRekomenProduct(List<ModelValueHastagMl> listHastag) async {
    // Jika daftar hastag memiliki lebih dari dua item, ambil hanya dua yang paling banyak
    if (listHastag.length > 2) {
      // Sortir list berdasarkan value yang paling tinggi dan ambil dua teratas
      listHastag.sort((a, b) => b.value.compareTo(a.value));
      listHastag = listHastag.take(2).toList();
    }

    // Gabungkan elemen-elemen terpilih menjadi string
    String formattedHastags = listHastag
        .map((e) => e.title)
        .toList()
        .join(', '); // Menggabungkan elemen tanpa []

    log(formattedHastags, name: 'listHastagMl');

    // Panggil produk yang sesuai dengan hastags yang telah diformat
    productProvider.fetchProductsWhereHastag(hastags: formattedHastags).then(
        (result) {
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

class ModelValueHastagMl {
  final String title;
  final int value;

  ModelValueHastagMl({required this.title, required this.value});
}

import 'dart:developer';

import 'package:fresha_mobile/model/order/model_request_post_order.dart';
import 'package:fresha_mobile/model/product/model_request_patch_product.dart';
import 'package:fresha_mobile/provider/hastag_ml_provider.dart';

import '../../../../core.dart';

class CheckoutController extends GetxController {
  final HastagMlProvider hastagMlProvider;
  final ProductProvider productProvider;
  final OrderProvider orderProvider;
  final PrefService prefService;

  CheckoutController({
    required this.hastagMlProvider,
    required this.productProvider,
    required this.orderProvider,
    required this.prefService,
  });

  late Map<DataProduct, int> dataListShop;

  // final List<DataProduct> listProduct = <DataProduct>[];
  final listShop = <DataProduct, int>{}.obs;
  final total = 0.obs;
  String? idCustamer;
  final dataListProduct = <ProductPostOrder>[];
  final dataListHastagProduct = <String>[];
  final isLoading = false.obs;
  final isPostHastag = false.obs;
  final isPatchProduct = false.obs;
  final isPostOrder = false.obs;

  void initLoading() {
    isLoading.value = !isLoading.value;
  }

  void initPostHastag() {
    isPostHastag.value = !isPostHastag.value;
  }

  void initPatchProduct() {
    isPatchProduct.value = !isPatchProduct.value;
  }

  void initPostOrder() {
    isPostOrder.value = !isPostOrder.value;
  }

  Future addOrder() async {
    try {
      listShop.forEach((key, value) {
        String productId = key.id;
        int quantity = value;
        int totPrice = (key.price * value);
        final dataProduct = ProductPostOrder(
          productId: productId,
          quantity: quantity,
          totPrice: totPrice,
        );
        log(productId, name: "productId");
        log(quantity.toString(), name: "quantity");
        log(totPrice.toString(), name: "totPrice");
        dataListProduct.add(dataProduct);
        dataListHastagProduct.add(key.hastagMl);
      });
      if (idCustamer != null) {
        final dataOrder = ModelRequestPostOrder(
          status: 'processed',
          totBuy: total.value,
          orderById: idCustamer!,
          listProduct: dataListProduct,
        );
        initLoading();
        //patch product stock
        dataListProduct.map((e) {
          final dataUpdateProduct =
              ModelRequestPatchProduct(id: e.productId, stock: e.quantity);
          productProvider.patchProducts(dataUpdateProduct).then(
            (result) {
              if (result.code == 200) {
                initPatchProduct();
              }
            },
            onError: (err) {
              Get.snackbar(
                "Info",
                "Terjadi kesalahan saat update product : $err",
                snackPosition: SnackPosition.TOP,
                borderRadius: 10,
              );
            },
          );
        });

        //post Hastag
        dataListHastagProduct.map((e) async {
          final dataHastag = ModelRequestPostHastagMl(
            name: e,
            custamerId: idCustamer!,
          );
          hastagMlProvider.postHastagMl(dataHastag).then(
            (result) {
              if (result.code == 200) {
                initPostHastag();
              }
            },
            onError: (err) {
              Get.snackbar(
                "Info",
                "Terjadi kesalahan saat post hastag : $err",
                snackPosition: SnackPosition.TOP,
                borderRadius: 10,
              );
            },
          );
        });
        //post Order
        orderProvider.postOrder(dataOrder).then((result) {
          if (result.code == 200) {
            initPostOrder();
          }
        }, onError: (err) {
          Get.snackbar(
            "Info",
            "Terjadi kesalahan saat post order : $err",
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
          );
        });
        if (isPatchProduct.isTrue && isPostHastag.isTrue && isPostOrder.isTrue) {
          Get.snackbar(
            "Info",
            "Anda berhasil malakukan pesanan",
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
          );
          initLoading();
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar(
            "Info",
            "Anda gagal malakukan pesanan",
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
          );
          initLoading();
          log('kosong', name: 'data kosong');
        }
      } else {
        Get.snackbar(
          "Info",
          "id Login Kosong",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting order: $error';
    }
  }

  @override
  void onInit() {
    prefService.prefInit();
    if (Get.arguments != null) {
      dataListShop = Get.arguments as Map<DataProduct, int>;
      listShop.value = dataListShop;
      log(dataListShop.length.toString(), name: 'kerangjang list Product');
      log(listShop.toString(), name: 'kerangjang listShop');
    } else {
      dataListShop = {};
    }
    idCustamer = prefService.getIdCustomer.toString();
    setTotalBayar();
    super.onInit();
  }

  @override
  onReady() {
    streamDataTotal();
    super.onReady();
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
          setTotalBayar();
        },
      );

  void setTotalBayar() {
    int data = 0;
    listShop.forEach((key, value) {
      data += key.price * value;
    });
    total.value = data;
  }
}

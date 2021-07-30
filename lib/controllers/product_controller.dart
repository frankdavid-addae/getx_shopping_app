import 'package:get/state_manager.dart';
import 'package:getx_shopping_app/models/product.dart';
import 'package:getx_shopping_app/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var isFavorite = false.obs;
  var productList = List<Product>.filled(0, Product(), growable: true).obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products.isNotEmpty) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}

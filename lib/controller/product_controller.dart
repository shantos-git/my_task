import 'package:get/get.dart';
import 'package:my_task/model/ProductsModel.dart';

class ProductController extends GetxController {
  RxList<Data> products = <Data>[].obs;

  void setProducts(List<Data> newProducts) {
    products.assignAll(newProducts);
  }

  void clearProducts() {
    products.clear();
  }
}

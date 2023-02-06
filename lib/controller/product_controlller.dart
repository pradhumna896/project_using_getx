import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  getProduct() async {
    String url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["products"];
      productList.value = result.map((e) => ProductModel.fromJson(e)).toList();
      isLoading.value = false;
      update();
    } else {
      Get.snackbar("Error is Loading...", "${response.statusCode}");
      isLoading.value = false;
    }
  }

  getIndex(value) {
    index.value = value;
    update();
  }
}

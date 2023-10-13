import 'package:dio/dio.dart';
import 'package:task_1/models/product_model.dart';

Future<List<ProductModel>> getProducts() async {
  try {
    final res = await Dio().get('https://dummyjson.com/products');

    if (res.statusCode == 200) {
      // ignore: avoid_print
      print((res.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList());
      return (res.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
  } catch (e) {
    // ignore: avoid_print
    print('-----error is: $e');
  }
  return [];
}

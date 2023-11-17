import 'package:flutter_agriculture/core/endpoints.dart';
import 'package:flutter_agriculture/models/product_model.dart';
import 'package:flutter_agriculture/repository/product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductModel>> getProductsList() async {
    final productsList = <ProductModel>[];
    try {
      final response = await http.get(
        Uri.parse(Endpoints.homeUrl),
      );
      if (response.statusCode == 200) {
        final list = response.body as List<dynamic>;
        for (var item in list) {
          final product = ProductModel.fromJson(item);
          productsList.add(product);
        }
        return productsList;
      }
      return productsList;
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';
import 'package:flutter_agriculture/core/endpoints.dart';
import 'package:flutter_agriculture/models/product_detail_model.dart';
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
        final list = jsonDecode(response.body);
        for (var item in list) {
          final product = ProductModel.fromJson(item);
          productsList.add(product);
        }
        return productsList;
      }
      return productsList;
    } catch (e) {
      throw Exception('Failed to get products');
    }
  }

  @override
  Future<ProductDetailResponse?> getProductDetail(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${Endpoints.homeUrl}/$id'),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final productResponse = ProductDetailResponse.fromJson(json);
        return productResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get product detail');
    }
  }
}

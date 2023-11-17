import 'package:flutter_agriculture/models/product_detail_model.dart';
import 'package:flutter_agriculture/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductsList();

  Future<ProductDetailResponse?> getProductDetail(String id);
}

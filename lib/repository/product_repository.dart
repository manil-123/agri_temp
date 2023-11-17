import 'package:flutter_agriculture/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProductsList();
}

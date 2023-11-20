import 'package:flutter/material.dart';
import 'package:flutter_agriculture/models/product_detail_model.dart';
import 'package:flutter_agriculture/repository/product_repository.dart';

class ProductDetailProvider extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductDetailProvider(this._productRepository);

  bool _loading = false;
  ProductDetailResponse? _productDetailResponse;
  String? _errorMessage;

  bool get loading => _loading;
  ProductDetailResponse? get productDetailResponse => _productDetailResponse;
  String? get errorMessage => _errorMessage;

  Future<void> getProductsDetail(String id) async {
    _loading = true;
    try {
      _productDetailResponse = await _productRepository.getProductDetail(id);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

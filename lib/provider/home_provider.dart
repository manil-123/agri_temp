import 'package:flutter/material.dart';
import 'package:flutter_agriculture/models/product_model.dart';
import 'package:flutter_agriculture/repository/product_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ProductRepository _productRepository;

  HomeProvider(this._productRepository);

  bool _loading = false;
  List<ProductModel> _productsList = [];
  String _errorMessage = '';

  bool get loading => _loading;
  List<ProductModel> get productsList => _productsList;
  String get errorMessage => _errorMessage;

  Future<void> getProductsList() async {
    _loading = true;
    try {
      _productsList = await _productRepository.getProductsList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

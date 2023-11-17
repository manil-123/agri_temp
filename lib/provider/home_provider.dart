import 'package:flutter/material.dart';
import 'package:flutter_agriculture/repository/product_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ProductRepository productRepository;

  HomeProvider(this.productRepository);
}

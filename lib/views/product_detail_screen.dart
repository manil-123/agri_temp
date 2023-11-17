import 'package:flutter/material.dart';
import 'package:flutter_agriculture/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(productModel.name ?? ''),
      ),
    );
  }
}

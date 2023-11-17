import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agriculture/models/product_model.dart';
import 'package:flutter_agriculture/provider/product_detail_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductDetailProvider>(context, listen: false)
        .getProductsDetail(widget.productModel.id!.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.productModel.name ?? ''),
      ),
      body: Consumer<ProductDetailProvider>(
        builder: (_, provider, __) {
          if (provider.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (provider.errorMessage.isNotEmpty) {
            return Center(
              child: Text(provider.errorMessage),
            );
          } else {
            final productModel = provider.productDetailResponse?.metaEng;
            String? firstImageUrl = productModel?.first.imagearray != null &&
                    productModel?.first.imagearray?.length != 0
                ? productModel?.first.imagearray?.first.imageOne
                : 'asdasd';
            log(firstImageUrl!.toString());

            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // CachedNetworkImage(
                  //     imageUrl: productModel![5].imagearray![0].imageOne!)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

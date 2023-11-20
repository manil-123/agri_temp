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
          } else if (provider.errorMessage != null) {
            return Center(
              child: Text(provider.errorMessage!),
            );
          } else {
            final generalDetail =
                provider.productDetailResponse?.englishModel.generalDetail;

            final morphologicalDetail = provider
                .productDetailResponse?.englishModel.morphologicalDetail;

            final agronomicalDetail =
                provider.productDetailResponse?.englishModel.agronomicalDetail;

            final nutritionalDetail =
                provider.productDetailResponse?.englishModel.nutritionalDetail;

            final distinctDetail =
                provider.productDetailResponse?.englishModel.distinctDetail;

            final imageDetail =
                provider.productDetailResponse?.englishModel.imageDetail;

            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (imageDetail?.isNotEmpty ?? false) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var entry in imageDetail!.entries)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(imageUrl: entry.value),
                            ),
                          )
                      ],
                    ),
                  ],
                  if (generalDetail?.isNotEmpty ?? false) ...[
                    const Text(
                      'General Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (var entry in generalDetail!.entries)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('${entry.key}:')),
                          Expanded(child: Text(' ${entry.value}'))
                        ],
                      ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                  if (morphologicalDetail?.isNotEmpty ?? false) ...[
                    const Text(
                      'Morphological Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (var entry in morphologicalDetail!.entries)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('${entry.key}:')),
                          Expanded(child: Text(' ${entry.value}'))
                        ],
                      ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                  if (agronomicalDetail?.isNotEmpty ?? false) ...[
                    const Text(
                      'Agronomical Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (var entry in agronomicalDetail!.entries)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('${entry.key}:')),
                          Expanded(child: Text(' ${entry.value}'))
                        ],
                      ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                  if (nutritionalDetail?.isNotEmpty ?? false) ...[
                    const Text(
                      'Nutritional Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (var entry in nutritionalDetail!.entries)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('${entry.key}:')),
                          Expanded(child: Text(' ${entry.value}'))
                        ],
                      ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                  if (distinctDetail?.isNotEmpty ?? false) ...[
                    const Text(
                      'Distinct Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (var entry in distinctDetail!.entries)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('${entry.key}:')),
                          Expanded(child: Text(' ${entry.value}'))
                        ],
                      ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

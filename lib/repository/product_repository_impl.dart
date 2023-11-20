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
        final decodedJson = json.decode(utf8.decode(response.bodyBytes));

        // Convert the first type of response to the second type
        final generalMap = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['meta']![0]['General'] as List));
        final morphologicalMap = convertListToMap(
            List<Map<String, dynamic>>.from(decodedJson['meta']![1]
                ['Morphological Characteristics'] as List));
        final agronomicalMap = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['meta']![2]['Agronomical Characteristics'] as List));
        final nutritionalMap = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['meta']![3]['Nutritional and Other Qualities']
                as List));
        final distinctMap = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['meta']![4]['Distinct Characteristics'] as List));
        final imageMap = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['meta']![5]['imagearray'] as List));

        final generalMapNep = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['metaNep']![0]['सामान्य'] as List));
        final morphologicalMapNep = convertListToMap(
            List<Map<String, dynamic>>.from(
                decodedJson['metaNep']![1]['यस जातका विशेषताहरू'] as List));
        final agronomicalMapNep = convertListToMap(
            List<Map<String, dynamic>>.from(decodedJson['metaNep']![2]
                ['बालीका गुण तथा विशेषताहरू'] as List));
        final nutritionalMapNep = convertListToMap(
            List<Map<String, dynamic>>.from(
                decodedJson['metaNep']![3]['पौष्टिक तथा अन्य गुण'] as List));
        final distinctMapNep = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['metaNep']![4]['विशिष्ट गुणहरू'] as List));
        final imageMapNep = convertListToMap(List<Map<String, dynamic>>.from(
            decodedJson['metaNep']![5]['imagearray'] as List));

        final outputResponse = {
          'meta': {
            'general': generalMap,
            'morphological': morphologicalMap,
            'agronomical': agronomicalMap,
            'nutritional': nutritionalMap,
            'distinct': distinctMap,
            'imagearray': imageMap,
          },
          'metaNep': {
            'general': generalMapNep,
            'morphological': morphologicalMapNep,
            'agronomical': agronomicalMapNep,
            'nutritional': nutritionalMapNep,
            'distinct': distinctMapNep,
            'imagearray': imageMapNep,
          }
        };
        final productResponse = ProductDetailResponse.fromJson(outputResponse);
        return productResponse;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get product detail');
    }
  }
}

Map<String, String> convertListToMap(List<Map<String, dynamic>> inputList) {
  Map<String, String> outputMap = {};

  if (inputList.isEmpty) {
    return {};
  }

  for (var map in inputList) {
    map.forEach((key, value) {
      outputMap[key] = value;
    });
  }

  return outputMap;
}

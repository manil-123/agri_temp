// To parse this JSON data, do
//
//     final productDetailResponse = productDetailResponseFromJson(jsonString);

class ProductDetailResponse {
  final ProductDetailModel englishModel;
  final ProductDetailModel nepaliModel;

  ProductDetailResponse({
    required this.englishModel,
    required this.nepaliModel,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        englishModel: ProductDetailModel.fromJson(json['meta']),
        nepaliModel: ProductDetailModel.fromJson(json['metaNep']),
      );

  Map<String, dynamic> toJson() => {
        'meta': englishModel.toJson(),
        'metaNep': nepaliModel.toJson(),
      };
}

class ProductDetailModel {
  final Map<String, dynamic> generalDetail;
  final Map<String, dynamic> morphologicalDetail;
  final Map<String, dynamic> agronomicalDetail;
  final Map<String, dynamic> nutritionalDetail;
  final Map<String, dynamic> distinctDetail;
  final Map<String, dynamic> imageDetail;

  ProductDetailModel({
    required this.generalDetail,
    required this.morphologicalDetail,
    required this.agronomicalDetail,
    required this.nutritionalDetail,
    required this.distinctDetail,
    required this.imageDetail,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
        generalDetail: json['general'],
        morphologicalDetail: json['morphological'],
        agronomicalDetail: json['agronomical'],
        nutritionalDetail: json['nutritional'],
        distinctDetail: json['distinct'],
        imageDetail: json['imagearray']);
  }

  Map<String, dynamic> toJson() => {
        'general': generalDetail,
        'morphological': morphologicalDetail,
        'agronomical': agronomicalDetail,
        'nutritional': nutritionalDetail,
        'distinct': distinctDetail,
        'imagearray': imageDetail,
      };
}

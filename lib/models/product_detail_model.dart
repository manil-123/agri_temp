// To parse this JSON data, do
//
//     final productDetailResponse = productDetailResponseFromJson(jsonString);

import 'dart:convert';

ProductDetailResponse productDetailResponseFromJson(String str) =>
    ProductDetailResponse.fromJson(json.decode(str));

String productDetailResponseToJson(ProductDetailResponse data) =>
    json.encode(data.toJson());

class ProductDetailResponse {
  final List<ProductDetailEnglishModel> metaEng;
  final List<ProductDetailNepaliModel> metaNep;

  ProductDetailResponse({
    required this.metaEng,
    required this.metaNep,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        metaEng: List<ProductDetailEnglishModel>.from(
            json["meta"].map((x) => ProductDetailEnglishModel.fromJson(x))),
        metaNep: List<ProductDetailNepaliModel>.from(
            json["metaNep"].map((x) => ProductDetailNepaliModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": List<dynamic>.from(metaEng.map((x) => x.toJson())),
        "metaNep": List<dynamic>.from(metaNep.map((x) => x.toJson())),
      };
}

class ProductDetailEnglishModel {
  final List<General>? general;
  final List<MorphologicalCharacteristic>? morphologicalCharacteristics;
  final List<AgronomicalCharacteristic>? agronomicalCharacteristics;
  final List<NutritionalAndOtherQuality>? nutritionalAndOtherQualities;
  final List<DistinctCharacteristic>? distinctCharacteristics;
  final List<Imagearray>? imagearray;

  ProductDetailEnglishModel({
    this.general,
    this.morphologicalCharacteristics,
    this.agronomicalCharacteristics,
    this.nutritionalAndOtherQualities,
    this.distinctCharacteristics,
    this.imagearray,
  });

  factory ProductDetailEnglishModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailEnglishModel(
        general: json["General"] == null
            ? []
            : List<General>.from(
                json["General"]!.map((x) => General.fromJson(x))),
        morphologicalCharacteristics:
            json["Morphological Characteristics"] == null
                ? []
                : List<MorphologicalCharacteristic>.from(
                    json["Morphological Characteristics"]!
                        .map((x) => MorphologicalCharacteristic.fromJson(x))),
        agronomicalCharacteristics: json["Agronomical Characteristics"] == null
            ? []
            : List<AgronomicalCharacteristic>.from(
                json["Agronomical Characteristics"]!
                    .map((x) => AgronomicalCharacteristic.fromJson(x))),
        nutritionalAndOtherQualities:
            json["Nutritional and Other Qualities"] == null
                ? []
                : List<NutritionalAndOtherQuality>.from(
                    json["Nutritional and Other Qualities"]!
                        .map((x) => NutritionalAndOtherQuality.fromJson(x))),
        distinctCharacteristics: json["Distinct Characteristics"] == null
            ? []
            : List<DistinctCharacteristic>.from(
                json["Distinct Characteristics"]!
                    .map((x) => DistinctCharacteristic.fromJson(x))),
        imagearray: json["imagearray"] == null
            ? []
            : List<Imagearray>.from(
                json["imagearray"]!.map((x) => Imagearray.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "General": general == null
            ? []
            : List<dynamic>.from(general!.map((x) => x.toJson())),
        "Morphological Characteristics": morphologicalCharacteristics == null
            ? []
            : List<dynamic>.from(
                morphologicalCharacteristics!.map((x) => x.toJson())),
        "Agronomical Characteristics": agronomicalCharacteristics == null
            ? []
            : List<dynamic>.from(
                agronomicalCharacteristics!.map((x) => x.toJson())),
        "Nutritional and Other Qualities": nutritionalAndOtherQualities == null
            ? []
            : List<dynamic>.from(
                nutritionalAndOtherQualities!.map((x) => x.toJson())),
        "Distinct Characteristics": distinctCharacteristics == null
            ? []
            : List<dynamic>.from(
                distinctCharacteristics!.map((x) => x.toJson())),
        "imagearray": imagearray == null
            ? []
            : List<dynamic>.from(imagearray!.map((x) => x.toJson())),
      };
}

class AgronomicalCharacteristic {
  final String? averageHeightCm;
  final String? maturingDaysDays;
  final String? resistantCharacteristics;
  final String? thousandGrainWeightGram;
  final String? yieldTonHa;

  AgronomicalCharacteristic({
    this.averageHeightCm,
    this.maturingDaysDays,
    this.resistantCharacteristics,
    this.thousandGrainWeightGram,
    this.yieldTonHa,
  });

  factory AgronomicalCharacteristic.fromJson(Map<String, dynamic> json) =>
      AgronomicalCharacteristic(
        averageHeightCm: json["Average Height (cm)"],
        maturingDaysDays: json["Maturing Days (days)"],
        resistantCharacteristics: json["Resistant Characteristics"],
        thousandGrainWeightGram: json["Thousand grain weight (gram)"],
        yieldTonHa: json["Yield (ton/ha)"],
      );

  Map<String, dynamic> toJson() => {
        "Average Height (cm)": averageHeightCm,
        "Maturing Days (days)": maturingDaysDays,
        "Resistant Characteristics": resistantCharacteristics,
        "Thousand grain weight (gram)": thousandGrainWeightGram,
        "Yield (ton/ha)": yieldTonHa,
      };
}

class DistinctCharacteristic {
  final String specialDescription;

  DistinctCharacteristic({
    required this.specialDescription,
  });

  factory DistinctCharacteristic.fromJson(Map<String, dynamic> json) =>
      DistinctCharacteristic(
        specialDescription: json["Special Description"],
      );

  Map<String, dynamic> toJson() => {
        "Special Description": specialDescription,
      };
}

class General {
  final String? botanicalName;
  final String? nameBeforeRelease;
  final String? notifiedYear;
  final String? recommendedAreas;

  General({
    this.botanicalName,
    this.nameBeforeRelease,
    this.notifiedYear,
    this.recommendedAreas,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        botanicalName: json["Botanical Name"],
        nameBeforeRelease: json["Name before Release"],
        notifiedYear: json["Notified Year"],
        recommendedAreas: json["Recommended Areas"],
      );

  Map<String, dynamic> toJson() => {
        "Botanical Name": botanicalName,
        "Name before Release": nameBeforeRelease,
        "Notified Year": notifiedYear,
        "Recommended Areas": recommendedAreas,
      };
}

class Imagearray {
  final String? imageOne;
  final String? imageTwo;
  final String? imageThree;
  final String? imageFour;

  Imagearray({
    this.imageOne,
    this.imageTwo,
    this.imageThree,
    this.imageFour,
  });

  factory Imagearray.fromJson(Map<String, dynamic> json) => Imagearray(
        imageOne: json["Aditya_1_6YWkYQd"],
        imageTwo: json["Aditya_Capture_2_LuAqweK"],
        imageThree: json["Aditya_Capture3_dsU6RNl"],
        imageFour: json["Aditya_Capture4_vgvD6R0"],
      );

  Map<String, dynamic> toJson() => {
        "Aditya_1_6YWkYQd": imageOne,
        "Aditya_Capture_2_LuAqweK": imageTwo,
        "Aditya_Capture3_dsU6RNl": imageThree,
        "Aditya_Capture4_vgvD6R0": imageFour,
      };
}

class MorphologicalCharacteristic {
  final String? colorOfSeed;
  final String? pinnacleType;
  final String? shapeOfSeed;

  MorphologicalCharacteristic({
    this.colorOfSeed,
    this.pinnacleType,
    this.shapeOfSeed,
  });

  factory MorphologicalCharacteristic.fromJson(Map<String, dynamic> json) =>
      MorphologicalCharacteristic(
        colorOfSeed: json["Color of Seed"],
        pinnacleType: json["Pinnacle Type"],
        shapeOfSeed: json["Shape of Seed"],
      );

  Map<String, dynamic> toJson() => {
        "Color of Seed": colorOfSeed,
        "Pinnacle Type": pinnacleType,
        "Shape of Seed": shapeOfSeed,
      };
}

class NutritionalAndOtherQuality {
  final String percentageOfProtein;

  NutritionalAndOtherQuality({
    required this.percentageOfProtein,
  });

  factory NutritionalAndOtherQuality.fromJson(Map<String, dynamic> json) =>
      NutritionalAndOtherQuality(
        percentageOfProtein: json["Percentage of Protein"],
      );

  Map<String, dynamic> toJson() => {
        "Percentage of Protein": percentageOfProtein,
      };
}

class ProductDetailNepaliModel {
  final List<GeneralNepali>? general;
  final List<MorphologicalCharacteristicNepali>? morphologicalCharacteristic;
  final List<AgronomicalCharacteristicNepali>? agronomicalCharacteristics;
  final List<NutritionalAndOtherQualityNepali>? nutritionalAndOtherQualities;
  final List<DistinctCharacteristicNepali>? distinctCharacteristics;
  final List<Imagearray>? imagearray;

  ProductDetailNepaliModel({
    this.general,
    this.morphologicalCharacteristic,
    this.agronomicalCharacteristics,
    this.nutritionalAndOtherQualities,
    this.distinctCharacteristics,
    this.imagearray,
  });

  factory ProductDetailNepaliModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailNepaliModel(
        general: json["सामान्य"] == null
            ? []
            : List<GeneralNepali>.from(
                json["सामान्य"]!.map((x) => GeneralNepali.fromJson(x))),
        morphologicalCharacteristic: json["यस जातका विशेषताहरू"] == null
            ? []
            : List<MorphologicalCharacteristicNepali>.from(
                json["यस जातका विशेषताहरू"]!
                    .map((x) => MorphologicalCharacteristicNepali.fromJson(x))),
        agronomicalCharacteristics: json["बालीका गुण तथा विशेषताहरू"] == null
            ? []
            : List<AgronomicalCharacteristicNepali>.from(
                json["बालीका गुण तथा विशेषताहरू"]!
                    .map((x) => AgronomicalCharacteristicNepali.fromJson(x))),
        nutritionalAndOtherQualities: json["पौष्टिक तथा अन्य गुण"] == null
            ? []
            : List<NutritionalAndOtherQualityNepali>.from(
                json["पौष्टिक तथा अन्य गुण"]!
                    .map((x) => NutritionalAndOtherQualityNepali.fromJson(x))),
        distinctCharacteristics: json["विशिष्ट गुणहरू"] == null
            ? []
            : List<DistinctCharacteristicNepali>.from(json["विशिष्ट गुणहरू"]!
                .map((x) => DistinctCharacteristicNepali.fromJson(x))),
        imagearray: json["imagearray"] == null
            ? []
            : List<Imagearray>.from(
                json["imagearray"]!.map((x) => Imagearray.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "सामान्य": general == null
            ? []
            : List<dynamic>.from(general!.map((x) => x.toJson())),
        "यस जातका विशेषताहरू": morphologicalCharacteristic == null
            ? []
            : List<dynamic>.from(
                morphologicalCharacteristic!.map((x) => x.toJson())),
        "बालीका गुण तथा विशेषताहरू": agronomicalCharacteristics == null
            ? []
            : List<dynamic>.from(
                agronomicalCharacteristics!.map((x) => x.toJson())),
        "पौष्टिक तथा अन्य गुण": nutritionalAndOtherQualities == null
            ? []
            : List<dynamic>.from(
                nutritionalAndOtherQualities!.map((x) => x.toJson())),
        "विशिष्ट गुणहरू": distinctCharacteristics == null
            ? []
            : List<dynamic>.from(
                distinctCharacteristics!.map((x) => x.toJson())),
        "imagearray": imagearray == null
            ? []
            : List<dynamic>.from(imagearray!.map((x) => x.toJson())),
      };
}

class NutritionalAndOtherQualityNepali {
  final String percentageOfProtein;

  NutritionalAndOtherQualityNepali({
    required this.percentageOfProtein,
  });

  factory NutritionalAndOtherQualityNepali.fromJson(
          Map<String, dynamic> json) =>
      NutritionalAndOtherQualityNepali(
        percentageOfProtein: json["प्रोटिनको मात्रा"],
      );

  Map<String, dynamic> toJson() => {
        "प्रोटिनको मात्रा": percentageOfProtein,
      };
}

class DistinctCharacteristicNepali {
  final String specialDescription;

  DistinctCharacteristicNepali({
    required this.specialDescription,
  });

  factory DistinctCharacteristicNepali.fromJson(Map<String, dynamic> json) =>
      DistinctCharacteristicNepali(
        specialDescription: json["विशेष विवरण"],
      );

  Map<String, dynamic> toJson() => {
        "विशेष विवरण": specialDescription,
      };
}

class AgronomicalCharacteristicNepali {
  final String? averageHeightCm;
  final String? maturingDaysDays;
  final String? resistantCharacteristics;
  final String? thousandGrainWeightGram;
  final String? yieldTonHa;

  AgronomicalCharacteristicNepali({
    this.averageHeightCm,
    this.maturingDaysDays,
    this.resistantCharacteristics,
    this.thousandGrainWeightGram,
    this.yieldTonHa,
  });

  factory AgronomicalCharacteristicNepali.fromJson(Map<String, dynamic> json) =>
      AgronomicalCharacteristicNepali(
        averageHeightCm: json["बोटको औसत उचाई (से मी)"],
        maturingDaysDays: json["बाली पाक्ने समय (दिन)"],
        resistantCharacteristics: json["प्रतिरोधी विशेषताहरू"],
        thousandGrainWeightGram: json["हजार दानाको तौल (ग्राम)"],
        yieldTonHa: json["उत्पादकत्व (टन/हेक्टर)"],
      );

  Map<String, dynamic> toJson() => {
        "बोटको औसत उचाई (से मी)": averageHeightCm,
        "बाली पाक्ने समय (दिन)": maturingDaysDays,
        "प्रतिरोधी विशेषताहरू": resistantCharacteristics,
        "हजार दानाको तौल (ग्राम)": thousandGrainWeightGram,
        "उत्पादकत्व (टन/हेक्टर)": yieldTonHa,
      };
}

class MorphologicalCharacteristicNepali {
  final String? colorOfSeed;
  final String? pinnacleType;
  final String? shapeOfSeed;

  MorphologicalCharacteristicNepali({
    this.colorOfSeed,
    this.pinnacleType,
    this.shapeOfSeed,
  });

  factory MorphologicalCharacteristicNepali.fromJson(
          Map<String, dynamic> json) =>
      MorphologicalCharacteristicNepali(
        colorOfSeed: json["बीउको दानाको रंग"],
        pinnacleType: json["बालाको किसिम"],
        shapeOfSeed: json["दानाको आकार"],
      );

  Map<String, dynamic> toJson() => {
        "बीउको दानाको रंग": colorOfSeed,
        "बालाको किसिम": pinnacleType,
        "दानाको आकार": shapeOfSeed,
      };
}

class GeneralNepali {
  final String? botanicalName;
  final String? nameBeforeRelease;
  final String? notifiedYear;
  final String? recommendedAreas;

  GeneralNepali({
    this.botanicalName,
    this.nameBeforeRelease,
    this.notifiedYear,
    this.recommendedAreas,
  });

  factory GeneralNepali.fromJson(Map<String, dynamic> json) => GeneralNepali(
        botanicalName: json["वानस्पतिक नाम"],
        nameBeforeRelease: json["जारी (सूचिकृत) हुनु अघिको नाम"],
        notifiedYear: json["सूचिकृत बर्ष"],
        recommendedAreas: json["सिफारिस गरिएका क्षेत्रहरू"],
      );

  Map<String, dynamic> toJson() => {
        "वानस्पतिक नाम": botanicalName,
        "जारी (सूचिकृत) हुनु अघिको नाम": nameBeforeRelease,
        "सूचिकृत बर्ष": notifiedYear,
        "सिफारिस गरिएका क्षेत्रहरू": recommendedAreas,
      };
}

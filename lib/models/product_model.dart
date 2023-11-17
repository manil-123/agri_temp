class ProductModel {
  int? id;
  String? name;
  String? croptypename;
  String? croptypeslug;
  String? nepname;

  ProductModel({
    this.id,
    this.name,
    this.croptypename,
    this.croptypeslug,
    this.nepname,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      croptypename: json['croptypename'],
      croptypeslug: json['croptypeslug'],
      nepname: json['nepname'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['croptypename'] = croptypename;
    data['croptypeslug'] = croptypeslug;
    data['nepname'] = nepname;
    return data;
  }
}

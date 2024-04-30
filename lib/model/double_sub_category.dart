class DoubleSubCategoryModel {
  final String id;
  final String name;
  final String image;
  final String categoryName;
  final String subCategoryName;

  DoubleSubCategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.categoryName,
      required this.subCategoryName});

  factory DoubleSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return DoubleSubCategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        categoryName: json['categoryName'],
        subCategoryName: json['subCategoryName']);
  }
}

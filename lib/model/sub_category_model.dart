class SubCategory {
  final String id;
  final String name;
  final String image;
  final String categoryName;

  SubCategory(
      {required this.id,
      required this.name,
      required this.image,
      required this.categoryName});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        categoryName: json['categoryName']);
  }
}

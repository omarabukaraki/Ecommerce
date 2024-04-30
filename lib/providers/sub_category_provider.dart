import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/sub_category_model.dart';
import 'package:flutter/material.dart';

class SubCategoryProvider extends ChangeNotifier {
  Future<void> addSubCategory(
      SubCategory subCategory, String categoryId, String categoryName) async {
    try {
      final CollectionReference subcategoriesRef = FirebaseFirestore.instance
          .collection('categories')
          .doc(categoryId)
          .collection('subcategories');

      await subcategoriesRef.doc(subCategory.id).set({
        'id': subCategory.id,
        'name': subCategory.name,
        'image': subCategory.image,
        'category': categoryName,
      });

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  List<SubCategory> _subCategories = [];

  List<SubCategory> get subCategories => _subCategories;

  Future<void> fetchSubCategories(String categoryId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> subCategorySnapshot =
          await FirebaseFirestore.instance
              .collection('categories')
              .doc(categoryId)
              .collection('subcategories')
              .get();

      _subCategories = subCategorySnapshot.docs
          .map((doc) => SubCategory.fromJson({
                ...doc.data(),
                'id': doc.id,
                'categoryName': doc.data()['categoryName'] ?? '',
              }))
          .toList();
      _subCategories
          .add(SubCategory(id: '', name: '', image: '', categoryName: ''));
      _subCategories = _subCategories.reversed.toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}

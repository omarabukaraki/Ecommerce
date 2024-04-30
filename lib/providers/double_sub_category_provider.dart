import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/double_sub_category.dart';
import 'package:flutter/material.dart';

class DoubleSubCategoryProvider extends ChangeNotifier {
  Future<void> addDoubleSubCategory(
      DoubleSubCategoryModel doubleSubCategory,
      String categoryId,
      String categoryName,
      String subCategoryId,
      String subCategoryName) async {
    try {
      final CollectionReference doubleSubCategories = FirebaseFirestore.instance
          .collection('categories')
          .doc(categoryId)
          .collection('subcategories')
          .doc(subCategoryId)
          .collection('doubleSubCategory');

      await doubleSubCategories.doc(doubleSubCategory.id).set({
        'id': doubleSubCategory.id,
        'name': doubleSubCategory.name,
        'image': doubleSubCategory.image,
        'category': categoryName,
        'subCategoryName': subCategoryName,
      });

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  List<DoubleSubCategoryModel> _doubleSubCategories = [];

  List<DoubleSubCategoryModel> get doubleSubCategories => _doubleSubCategories;

  Future<void> fetchDoubleSubCategories(
      String categoryId, String subCategoryId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> doubleSubCategorySnapshot =
          await FirebaseFirestore.instance
              .collection('categories')
              .doc(categoryId)
              .collection('subcategories')
              .doc(subCategoryId)
              .collection('doubleSubCategory')
              .get();

      _doubleSubCategories = doubleSubCategorySnapshot.docs
          .map((doc) => DoubleSubCategoryModel.fromJson({
                ...doc.data(),
                'id': doc.id,
                'name': doc.data()['name'] ?? '',
                'image': doc.data()['image'] ?? 'assets/images/user.png',
                'categoryName': doc.data()['categoryName'] ?? '',
                'subCategoryName': doc.data()['subCategoryName'] ?? '',
              }))
          .toList();

      _doubleSubCategories.add(DoubleSubCategoryModel(
          id: '', name: '', image: '', categoryName: '', subCategoryName: ''));
      _doubleSubCategories = _doubleSubCategories.reversed.toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}

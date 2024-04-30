import 'package:ecommerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider extends ChangeNotifier {
  Future<void> addCategory(Category category) async {
    try {
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(category.id)
          .set({
        'id': category.id,
        'name': category.name,
        'image': category.image,
      });

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('categories').get();

      _categories = snapshot.docs
          .map((doc) => Category.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
      _categories.add(Category(id: '', name: '', image: ''));
      _categories = _categories.reversed.toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
